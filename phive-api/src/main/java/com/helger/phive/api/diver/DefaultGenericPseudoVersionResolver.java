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
package com.helger.phive.api.diver;

import java.time.OffsetDateTime;
import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.state.ESuccess;
import com.helger.commons.string.ToStringGenerator;
import com.helger.diver.api.version.DVRPseudoVersionRegistry;
import com.helger.diver.api.version.IDVRPseudoVersion;
import com.helger.phive.api.config.PhivePseudoVersionRegistrarSPIImpl;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSetRegistry;
import com.helger.phive.api.source.IValidationSource;

/**
 * Default {@link IGenericPseudoVersionResolver} implementation based on a
 * {@link ValidationExecutorSetRegistry}.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 * @since 10.1.1
 */
@ThreadSafe
public class DefaultGenericPseudoVersionResolver <SOURCETYPE extends IValidationSource> implements
                                                 IGenericPseudoVersionResolver <IValidationExecutorSet <SOURCETYPE>>
{
  /**
   * The internal resolver to use
   *
   * @author Philip Helger
   * @param <SOURCETYPE>
   *        The validation source type to be used.
   * @since 10.1.1
   */
  @FunctionalInterface
  public interface INestedPseudoVersionResolver <SOURCETYPE extends IValidationSource>
  {
    @Nullable
    IValidationExecutorSet <SOURCETYPE> resolve (@Nonnull @Nonempty String sGroupID,
                                                 @Nonnull @Nonempty String sArtifactID,
                                                 @Nullable Set <String> aVersionsToIgnore,
                                                 @Nullable OffsetDateTime aCheckDateTime);
  }

  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultGenericPseudoVersionResolver.class);

  private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  private final ICommonsMap <IDVRPseudoVersion, INestedPseudoVersionResolver <SOURCETYPE>> m_aMap = new CommonsHashMap <> ();

  public DefaultGenericPseudoVersionResolver (@Nonnull final ValidationExecutorSetRegistry <SOURCETYPE> aVESRegistry)
  {
    ValueEnforcer.notNull (aVESRegistry, "VESRegistry");
    registerResolver (DVRPseudoVersionRegistry.OLDEST,
                      (gid, aid, vti, cdt) -> aVESRegistry.getOldestVersion (gid, aid, vti));
    registerResolver (DVRPseudoVersionRegistry.LATEST,
                      (gid, aid, vti, cdt) -> aVESRegistry.getLatestVersion (gid, aid, vti));
    registerResolver (DVRPseudoVersionRegistry.LATEST_RELEASE,
                      (gid, aid, vti, cdt) -> aVESRegistry.getLatestReleaseVersion (gid, aid, vti));
    registerResolver (PhivePseudoVersionRegistrarSPIImpl.LATEST_ACTIVE, aVESRegistry::getLatestActiveVersion);
    registerResolver (PhivePseudoVersionRegistrarSPIImpl.LATEST_RELEASE_ACTIVE,
                      aVESRegistry::getLatestReleaseActiveVersion);
  }

  @Nonnull
  public final ESuccess registerResolver (@Nonnull final IDVRPseudoVersion aPseudoVersion,
                                          @Nonnull final INestedPseudoVersionResolver <SOURCETYPE> aNestedResolver)
  {
    ValueEnforcer.notNull (aPseudoVersion, "PseudoVersion");
    ValueEnforcer.notNull (aNestedResolver, "NestedResolver");

    return m_aRWLock.writeLockedGet ( () -> {
      final var aOldNestedResolver = m_aMap.get (aPseudoVersion);
      if (aOldNestedResolver != null)
      {
        LOGGER.error ("Another nested resolver for pseudo version " + aPseudoVersion + " is already registered");
        return ESuccess.FAILURE;
      }
      m_aMap.put (aPseudoVersion, aNestedResolver);
      return ESuccess.SUCCESS;
    });
  }

  @Nullable
  public IValidationExecutorSet <SOURCETYPE> resolvePseudoVersion (@Nonnull final IDVRPseudoVersion aPseudoVersion,
                                                                   @Nonnull @Nonempty final String sGroupID,
                                                                   @Nonnull @Nonempty final String sArtifactID,
                                                                   @Nullable final Set <String> aVersionsToIgnore,
                                                                   @Nullable final OffsetDateTime aCheckDateTime)
  {
    ValueEnforcer.notNull (aPseudoVersion, "PseudoVersion");
    ValueEnforcer.notEmpty (sGroupID, "GroupID");
    ValueEnforcer.notEmpty (sArtifactID, "ArtifactID");

    final var aResolver = m_aRWLock.readLockedGet ( () -> m_aMap.get (aPseudoVersion));
    return aResolver != null ? aResolver.resolve (sGroupID, sArtifactID, aVersionsToIgnore, aCheckDateTime) : null;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Map", m_aMap).getToString ();
  }
}
