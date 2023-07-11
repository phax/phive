/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

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
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.IRepoStorage;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.RepoStorageType;
import com.helger.phive.engine.repo.util.MessageDigestInputStream;
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

  protected AbstractRepoStorage (@Nonnull final RepoStorageType aType)
  {
    ValueEnforcer.notNull (aType, "Type");
    m_aType = aType;
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

              final EHashState eHashState;
              if (aExpectedDigest == null)
              {
                // Error in reading
                eHashState = EHashState.NOT_VERIFIED;
              }
              else
              {
                // We have read a digest value
                final byte [] aDigest = aMD.digest ();
                if (ArrayHelper.isArrayEquals (aExpectedDigest, aDigest))
                {
                  // Digest match
                  eHashState = EHashState.VERIFIED_MATCHING;
                  if (LOGGER.isDebugEnabled ())
                    LOGGER.debug ("Hash values are identical for '" + aKey.getPath () + "'");
                }
                else
                {
                  // Digest mismatch
                  eHashState = EHashState.VERIFIED_NON_MATCHING;
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
            return RepoStorageItem.of (aData, EHashState.NOT_VERIFIED);
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

  @Nonnull
  protected abstract ESuccess putObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload);

  @Nonnull
  public final ESuccess write (@Nonnull final RepoStorageKey aKey, @Nonnull final RepoStorageItem aItem)
  {
    ValueEnforcer.notNull (aKey, "Key");
    ValueEnforcer.notNull (aItem, "Item");

    // Create the message digest up front
    final byte [] aDigest = MessageDigestValue.create (aItem.data ().bytes (), m_eMDAlgo).bytes ();

    // Store the main data
    if (putObject (aKey, aItem.data ().bytes ()).isFailure ())
      return ESuccess.FAILURE;

    // Store the HASH value
    if (putObject (aKey.getKeyHashSha256 (), aDigest).isFailure ())
      return ESuccess.FAILURE;

    return ESuccess.SUCCESS;
  }
}
