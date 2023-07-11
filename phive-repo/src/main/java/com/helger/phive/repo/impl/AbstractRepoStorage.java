/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.repo.impl;

import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.ArrayHelper;
import com.helger.commons.io.stream.StreamHelper;
import com.helger.commons.state.ESuccess;
import com.helger.commons.traits.IGenericImplTrait;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoHashState;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.IRepoStorage;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageType;
import com.helger.phive.repo.util.MessageDigestInputStream;
import com.helger.security.messagedigest.EMessageDigestAlgorithm;
import com.helger.security.messagedigest.MessageDigestValue;

public abstract class AbstractRepoStorage <IMPLTYPE extends AbstractRepoStorage <IMPLTYPE>> implements
                                          IRepoStorage,
                                          IGenericImplTrait <IMPLTYPE>
{
  public static final boolean DEFAULT_VERIFY_HASH_VALUE = true;
  private static final Logger LOGGER = LoggerFactory.getLogger (AbstractRepoStorage.class);

  private final RepoStorageType m_aType;
  private boolean m_bVerifyHash = DEFAULT_VERIFY_HASH_VALUE;
  // Currently constant
  private final EMessageDigestAlgorithm m_eMDAlgo = DEFAULT_MD_ALGORITHM;
  private final ERepoWritable m_eWriteEnabled;
  private final ERepoDeletable m_eDeleteEnabled;

  protected AbstractRepoStorage (@Nonnull final RepoStorageType aType,
                                 @Nonnull final ERepoWritable eWriteEnabled,
                                 @Nonnull final ERepoDeletable eDeleteEnabled)
  {
    ValueEnforcer.notNull (aType, "Type");
    ValueEnforcer.notNull (eWriteEnabled, "WriteEnabled");
    ValueEnforcer.notNull (eDeleteEnabled, "DeleteEnabled");
    m_aType = aType;
    m_eWriteEnabled = eWriteEnabled;
    m_eDeleteEnabled = eDeleteEnabled;
  }

  @Nonnull
  public final RepoStorageType getRepoType ()
  {
    return m_aType;
  }

  public final boolean isVerifyHash ()
  {
    return m_bVerifyHash;
  }

  @Nonnull
  public final IMPLTYPE setVerifyHash (final boolean b)
  {
    m_bVerifyHash = b;
    LOGGER.info ("RepoStorage " + m_aType.getID () + ": hash verification is now: " + (b ? "enabled" : "disabled"));
    return thisAsT ();
  }

  /**
   * Get the input stream (locally or remote) to the provided key. Any failure
   * to open, should be logged inside.
   *
   * @param aKey
   *        The key to open. May not be <code>null</code>.
   * @return <code>null</code> in case open fails (why so ever)
   */
  @Nullable
  protected abstract InputStream getInputStream (@Nonnull final RepoStorageKey aKey);

  @Nullable
  public final RepoStorageItem read (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    try
    {
      if (isVerifyHash ())
      {
        // Read the expected hash digest
        final byte [] aExpectedDigest = StreamHelper.getAllBytes (getInputStream (aKey.getKeyHashSha256 ()));
        if (aExpectedDigest == null)
        {
          // Should already be logged in getInputStream
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("Failed to read digest value from " + aKey.getPath ());
        }

        // The message digest to be calculated while reading
        final MessageDigest aMD = m_eMDAlgo.createMessageDigest ();
        try (final InputStream aIS = getInputStream (aKey))
        {
          if (aIS != null)
            try (final MessageDigestInputStream aMDIS = new MessageDigestInputStream (aIS, aMD))
            {
              final byte [] aData = StreamHelper.getAllBytes (aMDIS);

              final ERepoHashState eHashState;
              if (aExpectedDigest == null)
              {
                // Error in reading
                eHashState = ERepoHashState.NOT_VERIFIED;
              }
              else
              {
                // We have read a digest value
                final byte [] aDigest = aMD.digest ();
                if (ArrayHelper.isArrayEquals (aExpectedDigest, aDigest))
                {
                  // Digest match
                  eHashState = ERepoHashState.VERIFIED_MATCHING;
                  if (LOGGER.isDebugEnabled ())
                    LOGGER.debug ("Hash values are identical for '" + aKey.getPath () + "'");
                }
                else
                {
                  // Digest mismatch
                  eHashState = ERepoHashState.VERIFIED_NON_MATCHING;
                  if (LOGGER.isDebugEnabled ())
                    LOGGER.debug ("Hash value mismatch for '" + aKey.getPath () + "'");
                }
              }

              // We're good to go
              return RepoStorageItem.of (aData, eHashState);
            }
        }
      }
      else
      {
        // No verify
        try (final InputStream aIS = getInputStream (aKey))
        {
          if (aIS != null)
          {
            final byte [] aData = StreamHelper.getAllBytes (aIS);
            return RepoStorageItem.of (aData, ERepoHashState.NOT_VERIFIED);
          }
        }
      }
    }
    catch (final IOException ex)
    {
      LOGGER.error ("Failed to read item '" + aKey.getPath () + "'", ex);
    }

    return null;
  }

  public final boolean canWrite ()
  {
    return m_eWriteEnabled.isWriteEnabled ();
  }

  @Nonnull
  protected abstract ESuccess writeObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload);

  @Nonnull
  public final ESuccess write (@Nonnull final RepoStorageKey aKey, @Nonnull final RepoStorageItem aItem)
  {
    ValueEnforcer.notNull (aKey, "Key");
    ValueEnforcer.notNull (aItem, "Item");

    if (!canWrite ())
    {
      LOGGER.error ("Trying to write on a RepoStorage with write disabled");
      throw new UnsupportedOperationException ("write is not enabled");
    }

    // Create the message digest up front
    final byte [] aDigest = MessageDigestValue.create (aItem.data ().bytes (), m_eMDAlgo).bytes ();

    // Store the main data
    if (writeObject (aKey, aItem.data ().bytes ()).isFailure ())
      return ESuccess.FAILURE;

    // Store the HASH value
    if (writeObject (aKey.getKeyHashSha256 (), aDigest).isFailure ())
      return ESuccess.FAILURE;

    return ESuccess.SUCCESS;
  }

  public final boolean canDelete ()
  {
    return m_eDeleteEnabled.isDeleteEnabled ();
  }

  @Nonnull
  protected abstract ESuccess deleteObject (@Nonnull final RepoStorageKey aKey);

  @Nonnull
  public final ESuccess delete (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    if (!canDelete ())
    {
      LOGGER.error ("Trying to delete on a RepoStorage with delete disabled");
      throw new UnsupportedOperationException ("delete is not enabled");
    }

    // Delete the main data
    if (deleteObject (aKey).isFailure ())
      return ESuccess.FAILURE;

    // Delete the HASH value
    if (deleteObject (aKey.getKeyHashSha256 ()).isFailure ())
      return ESuccess.FAILURE;

    return ESuccess.SUCCESS;
  }
}
