/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.phive.api.executorset;

import java.time.OffsetDateTime;
import java.util.Comparator;
import java.util.Map;
import java.util.Set;
import java.util.function.Predicate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ELockType;
import com.helger.commons.annotation.MustBeLocked;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.CommonsTreeMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.collection.impl.ICommonsNavigableMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.state.EChange;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.api.version.IVESPseudoVersion;
import com.helger.diver.api.version.VESID;
import com.helger.diver.api.version.VESPseudoVersionRegistry;
import com.helger.diver.api.version.VESVersion;
import com.helger.phive.api.config.PhivePseudoVersionRegistrarSPIImpl;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.source.IValidationSource;

/**
 * A registry for {@link IValidationExecutorSet} objects. This class is
 * thread-safe and can therefore be used as a singleton.<br>
 * Initially all validation artefact providers need to register themselves via
 * {@link #registerValidationExecutorSet(IValidationExecutorSet)}. This needs to
 * be done only once upon initialization before usage.<br>
 * For applying validation of rules onto an XML document,
 * {@link #getOfID(VESID)} needs to be invoked to find a matching VES
 * (Validation Executor Set - type `IValidationExecutorSet`). If the returned
 * value is non-<code>null</code> than some rules are registered.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 */
@ThreadSafe
public class ValidationExecutorSetRegistry <SOURCETYPE extends IValidationSource> implements
                                           IValidationExecutorSetRegistry <SOURCETYPE>
{
  public static final boolean DEFAULT_RESOLVE_PSEUDO_VERSIONS = true;

  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutorSetRegistry.class);

  protected final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  private final ICommonsMap <VESID, IValidationExecutorSet <SOURCETYPE>> m_aMap = new CommonsHashMap <> ();

  @GuardedBy ("m_aRWLock")
  private boolean m_bResolvePseudoVersions = DEFAULT_RESOLVE_PSEUDO_VERSIONS;

  public ValidationExecutorSetRegistry ()
  {}

  public final boolean isResolvePseudoVersions ()
  {
    return m_aRWLock.readLockedBoolean ( () -> m_bResolvePseudoVersions);
  }

  public final void setResolvePseudoVersions (final boolean b)
  {
    m_aRWLock.writeLocked ( () -> m_bResolvePseudoVersions = b);
  }

  /**
   * @return the internal map. Never <code>null</code>. Must be locked properly.
   */
  @Nonnull
  @MustBeLocked (ELockType.DEPENDS)
  protected final ICommonsMap <VESID, IValidationExecutorSet <SOURCETYPE>> internalMap ()
  {
    return m_aMap;
  }

  public void registerValidationExecutorSet (@Nonnull final IValidationExecutorSet <SOURCETYPE> aVES)
  {
    ValueEnforcer.notNull (aVES, "VES");

    final VESID aKey = aVES.getID ();
    m_aRWLock.writeLocked ( () -> {
      if (m_aMap.containsKey (aKey))
        throw new IllegalStateException ("Another validation executor set with the ID '" +
                                         aKey.getAsSingleID () +
                                         "' is already registered!");
      m_aMap.put (aKey, aVES);
    });

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Registered validation executor set '" +
                    aKey.getAsSingleID () +
                    "' of type " +
                    aVES.getClass ().getName () +
                    " with " +
                    aVES.getCount () +
                    " elements");
  }

  @Nonnull
  public EChange unregisterValidationExecutorSet (@Nullable final VESID aVESID)
  {
    if (aVESID == null)
      return EChange.UNCHANGED;

    final EChange ret = m_aRWLock.writeLockedGet ( () -> m_aMap.removeObject (aVESID));
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ((ret.isChanged () ? "Successfully unregistered" : "Failed to unregister") +
                    " validation executor set '" +
                    aVESID.getAsSingleID () +
                    "'");
    return ret;
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutorSet <SOURCETYPE>> getAll ()
  {
    return m_aRWLock.readLockedGet (m_aMap::copyOfValues);
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutorSet <SOURCETYPE>> findAll (@Nonnull final Predicate <? super IValidationExecutorSet <SOURCETYPE>> aFilter)
  {
    return m_aRWLock.readLockedGet ( () -> m_aMap.copyOfValues (aFilter));
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> findFirst (@Nonnull final Predicate <? super IValidationExecutorSet <SOURCETYPE>> aFilter)
  {
    return m_aRWLock.readLockedGet ( () -> m_aMap.findFirstValue (e -> aFilter.test (e.getValue ())));
  }

  @Nullable
  private ICommonsNavigableMap <VESID, IValidationExecutorSet <SOURCETYPE>> _getAllMatchingVES (@Nullable final String sGroupID,
                                                                                                @Nullable final String sArtifactID,
                                                                                                @Nonnull final Predicate <VESVersion> aVersionsToAccept,
                                                                                                @Nullable final Comparator <VESID> aComparator)
  {
    if (StringHelper.hasNoText (sGroupID))
      return null;
    if (StringHelper.hasNoText (sArtifactID))
      return null;

    // Sorted by key
    final ICommonsNavigableMap <VESID, IValidationExecutorSet <SOURCETYPE>> aMatching = new CommonsTreeMap <> (aComparator);

    // Get all versions matching Group ID and Artifact ID only
    m_aRWLock.readLocked ( () -> {
      for (final Map.Entry <VESID, IValidationExecutorSet <SOURCETYPE>> aEntry : m_aMap.entrySet ())
      {
        final VESID aVESID = aEntry.getKey ();
        if (aVESID.getGroupID ().equals (sGroupID) &&
            aVESID.getArtifactID ().equals (sArtifactID) &&
            aVersionsToAccept.test (aVESID.getVersionObj ()))
          aMatching.put (aEntry);
      }
    });
    return aMatching;
  }

  @Nonnull
  private static Predicate <VESVersion> _getVersionAcceptor (@Nullable final Set <String> aVersionsToIgnore,
                                                             final boolean bIncludeSnapshots)
  {
    if (CollectionHelper.isEmpty (aVersionsToIgnore))
    {
      if (bIncludeSnapshots)
      {
        // We take all
        return x -> true;
      }

      // We take everything except static snapshot versions
      return x -> !x.isStaticSnapshotVersion ();
    }

    // We have something to ignore
    if (bIncludeSnapshots)
    {
      // We take all, except for the ignored versions
      return x -> !aVersionsToIgnore.contains (x.getAsString ());
    }

    // We take all except static snapshot versions and except for the ignored
    // versions
    return x -> !x.isStaticSnapshotVersion () && !aVersionsToIgnore.contains (x.getAsString ());
  }

  @Nullable
  private IValidationExecutorSet <SOURCETYPE> _getOldestVersion (@Nullable final String sGroupID,
                                                                 @Nullable final String sArtifactID,
                                                                 @Nullable final Set <String> aVersionsToIgnore,
                                                                 final boolean bIncludeSnapshots)
  {
    // Sorted by key
    final ICommonsNavigableMap <VESID, IValidationExecutorSet <SOURCETYPE>> aMatching = _getAllMatchingVES (sGroupID,
                                                                                                            sArtifactID,
                                                                                                            _getVersionAcceptor (aVersionsToIgnore,
                                                                                                                                 bIncludeSnapshots),
                                                                                                            Comparator.naturalOrder ());

    if (aMatching != null && aMatching.isNotEmpty ())
    {
      // Now determine the one with the first version
      final IValidationExecutorSet <SOURCETYPE> ret = aMatching.getFirstValue ();
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Resolved oldest version of '" +
                      sGroupID +
                      VESID.ID_SEPARATOR +
                      sArtifactID +
                      "' to '" +
                      ret.getID ().getVersionString () +
                      "'");
      return ret;
    }
    return null;
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getOldestVersion (@Nullable final String sGroupID,
                                                               @Nullable final String sArtifactID,
                                                               @Nullable final Set <String> aVersionsToIgnore)
  {
    return _getOldestVersion (sGroupID, sArtifactID, aVersionsToIgnore, true);
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getOldestReleaseVersion (@Nullable final String sGroupID,
                                                                      @Nullable final String sArtifactID,
                                                                      @Nullable final Set <String> aVersionsToIgnore)
  {
    return _getOldestVersion (sGroupID, sArtifactID, aVersionsToIgnore, false);
  }

  @Nullable
  private IValidationExecutorSet <SOURCETYPE> _getLatestVersion (@Nullable final String sGroupID,
                                                                 @Nullable final String sArtifactID,
                                                                 @Nullable final Set <String> aVersionsToIgnore,
                                                                 final boolean bIncludeSnapshots)
  {
    // Sorted by key
    final ICommonsNavigableMap <VESID, IValidationExecutorSet <SOURCETYPE>> aMatching = _getAllMatchingVES (sGroupID,
                                                                                                            sArtifactID,
                                                                                                            _getVersionAcceptor (aVersionsToIgnore,
                                                                                                                                 bIncludeSnapshots),
                                                                                                            Comparator.reverseOrder ());

    if (aMatching != null && aMatching.isNotEmpty ())
    {
      // Now determine the one with the latest version
      final IValidationExecutorSet <SOURCETYPE> ret = aMatching.getFirstValue ();
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Resolved latest version of '" +
                      sGroupID +
                      VESID.ID_SEPARATOR +
                      sArtifactID +
                      "' to '" +
                      ret.getID ().getVersionString () +
                      "'");
      return ret;
    }
    return null;
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getLatestVersion (@Nullable final String sGroupID,
                                                               @Nullable final String sArtifactID,
                                                               @Nullable final Set <String> aVersionsToIgnore)
  {
    return _getLatestVersion (sGroupID, sArtifactID, aVersionsToIgnore, true);
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getLatestReleaseVersion (@Nullable final String sGroupID,
                                                                      @Nullable final String sArtifactID,
                                                                      @Nullable final Set <String> aVersionsToIgnore)
  {
    return _getLatestVersion (sGroupID, sArtifactID, aVersionsToIgnore, false);
  }

  @Nullable
  private IValidationExecutorSet <SOURCETYPE> _getLatestActiveVersion (@Nullable final String sGroupID,
                                                                       @Nullable final String sArtifactID,
                                                                       @Nullable final Set <String> aVersionsToIgnore,
                                                                       final boolean bIncludeSnapshots,
                                                                       @Nullable final OffsetDateTime aCheckDateTime)
  {
    // Sorted by key
    final ICommonsNavigableMap <VESID, IValidationExecutorSet <SOURCETYPE>> aMatching = _getAllMatchingVES (sGroupID,
                                                                                                            sArtifactID,
                                                                                                            _getVersionAcceptor (aVersionsToIgnore,
                                                                                                                                 bIncludeSnapshots),
                                                                                                            Comparator.reverseOrder ());

    if (aMatching != null && aMatching.isNotEmpty ())
    {
      // Make sure we have a non-null check date time
      final OffsetDateTime aRealCheckDateTime = aCheckDateTime != null ? aCheckDateTime : PDTFactory
                                                                                                    .getCurrentOffsetDateTime ();

      // Now determine the one with the latest active version
      final IValidationExecutorSet <SOURCETYPE> ret = CollectionHelper.findFirst (aMatching.values (),
                                                                                  x -> x.getStatus ()
                                                                                        .isValidPer (aRealCheckDateTime));
      if (ret != null)
      {
        if (LOGGER.isDebugEnabled ())
          LOGGER.debug ("Resolved latest active version of '" +
                        sGroupID +
                        VESID.ID_SEPARATOR +
                        sArtifactID +
                        "' to '" +
                        ret.getID ().getVersionString () +
                        "'");
        return ret;
      }
    }
    return null;
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getLatestActiveVersion (@Nullable final String sGroupID,
                                                                     @Nullable final String sArtifactID,
                                                                     @Nullable final Set <String> aVersionsToIgnore,
                                                                     @Nullable final OffsetDateTime aCheckDateTime)
  {
    return _getLatestActiveVersion (sGroupID, sArtifactID, aVersionsToIgnore, true, aCheckDateTime);
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getLatestReleaseActiveVersion (@Nullable final String sGroupID,
                                                                            @Nullable final String sArtifactID,
                                                                            @Nullable final Set <String> aVersionsToIgnore,
                                                                            @Nullable final OffsetDateTime aCheckDateTime)
  {
    return _getLatestActiveVersion (sGroupID, sArtifactID, aVersionsToIgnore, false, aCheckDateTime);
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getOfID (@Nullable final VESID aID)
  {
    return getOfID (aID, (OffsetDateTime) null);
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> getOfID (@Nullable final VESID aID,
                                                      @Nullable final OffsetDateTime aCheckDateTime)
  {
    if (aID == null)
      return null;

    // Try exact match first
    IValidationExecutorSet <SOURCETYPE> ret = m_aRWLock.readLockedGet ( () -> m_aMap.get (aID));
    if (ret == null)
    {
      // No exact match - check if it is a pseudo version
      final IVESPseudoVersion aPseudoVersion = VESPseudoVersionRegistry.getInstance ()
                                                                       .getFromIDOrNull (aID.getVersionString ());
      if (aPseudoVersion != null)
      {
        if (isResolvePseudoVersions ())
        {
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("Trying to resolve pseudo version latest of '" + aID.getAsSingleID () + "'");

          if (aPseudoVersion.equals (VESPseudoVersionRegistry.OLDEST))
          {
            // Now determine the one with the oldest version
            ret = getOldestVersion (aID.getGroupID (), aID.getArtifactID (), null);
          }
          else
            if (aPseudoVersion.equals (VESPseudoVersionRegistry.LATEST))
            {
              // Now determine the one with the latest version
              ret = getLatestVersion (aID.getGroupID (), aID.getArtifactID (), null);
            }
            else
              if (aPseudoVersion.equals (VESPseudoVersionRegistry.LATEST_RELEASE))
              {
                // Now determine the one with the latest version
                ret = getLatestReleaseVersion (aID.getGroupID (), aID.getArtifactID (), null);
              }
              else
                if (aPseudoVersion.equals (PhivePseudoVersionRegistrarSPIImpl.LATEST_ACTIVE))
                {
                  // Now determine the one with the latest active version
                  ret = getLatestActiveVersion (aID.getGroupID (), aID.getArtifactID (), null, aCheckDateTime);
                }
                else
                  if (aPseudoVersion.equals (PhivePseudoVersionRegistrarSPIImpl.LATEST_RELEASE_ACTIVE))
                  {
                    // Now determine the one with the latest active version
                    ret = getLatestReleaseActiveVersion (aID.getGroupID (), aID.getArtifactID (), null, aCheckDateTime);
                  }
                  else
                    LOGGER.warn ("The pseudo version " + aPseudoVersion + " is currently not supported.");
        }
        else
        {
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("The pseudo version resolving is disabled.");
        }
      }
    }
    return ret;
  }

  /**
   * This is a cleanup method that frees all resources when they are no longer
   * needed. This may be helpful because some {@link IValidationExecutor}
   * implementations contained in the {@link IValidationExecutorSet} contained
   * in this registry might have strong references to {@link ClassLoader}
   * instances. By calling this method, you can clear the contained map and
   * invoke {@link ValidationExecutorSet#removeAllExecutors()} if applicable.
   *
   * @return {@link EChange}
   * @see #removeAll(boolean)
   */
  @Nonnull
  public EChange removeAll ()
  {
    return removeAll (true);
  }

  /**
   * This is a cleanup method that frees all resources when they are no longer
   * needed. This removes all registered validators.
   *
   * @param bCleanVES
   *        This may be helpful because some {@link IValidationExecutor}
   *        implementations contained in the {@link IValidationExecutorSet}
   *        contained in this registry might have strong references to
   *        {@link ClassLoader} instances. By passing <code>true</code>,
   *        {@link ValidationExecutorSet#removeAllExecutors()} is invoked on all
   *        matching validation executor sets.
   * @return {@link EChange}
   * @since 6.0.1
   */
  @Nonnull
  public EChange removeAll (final boolean bCleanVES)
  {
    EChange ret = EChange.UNCHANGED;
    m_aRWLock.writeLock ().lock ();
    try
    {
      if (m_aMap.isNotEmpty ())
      {
        ret = EChange.CHANGED;
        if (bCleanVES)
          for (final IValidationExecutorSet <?> aVES : m_aMap.values ())
            if (aVES instanceof ValidationExecutorSet)
              ((ValidationExecutorSet <?>) aVES).removeAllExecutors ();
        m_aMap.clear ();
      }
    }
    finally
    {
      m_aRWLock.writeLock ().unlock ();
    }
    if (ret.isChanged ())
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Successfully removed all validatione executor sets" +
                      (bCleanVES ? " and cleaned all VES." : "."));
    return ret;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Map", m_aMap).getToString ();
  }
}
