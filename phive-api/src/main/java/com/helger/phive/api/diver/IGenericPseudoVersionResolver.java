/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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

import com.helger.annotation.Nonempty;
import com.helger.diver.api.version.IDVRPseudoVersion;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;

/**
 * Generic pseudo version resolver interface
 *
 * @author Philip Helger
 * @param <RESULTTYPE>
 *        The type to which is resolved
 * @since 10.1.1
 */
public interface IGenericPseudoVersionResolver <RESULTTYPE>
{
  /**
   * Get the element that matches the provided group ID, artifact ID and pseudo
   * version.
   *
   * @param aPseudoVersion
   *        The pseudo version to resolve. May not be <code>null</code>.
   * @param sGroupID
   *        VES Group ID to use. May neither be <code>null</code> nor empty.
   * @param sArtifactID
   *        VES Artefact ID to use. May neither be <code>null</code> nor empty.
   * @param aVersionsToIgnore
   *        An optional set of Version numbers not to consider. This may be used
   *        to exclude certain versions from being returned. May be
   *        <code>null</code>.
   * @param aCheckDateTim
   *        The effective date for which a check should be performed. May be
   *        <code>null</code> to indicate "current date time".
   * @return <code>null</code> if resolution fails
   */
  @Nullable
  RESULTTYPE resolvePseudoVersion (@Nonnull IDVRPseudoVersion aPseudoVersion,
                                   @Nonnull @Nonempty String sGroupID,
                                   @Nonnull @Nonempty String sArtifactID,
                                   @Nullable Set <String> aVersionsToIgnore,
                                   @Nullable OffsetDateTime aCheckDateTim);
}
