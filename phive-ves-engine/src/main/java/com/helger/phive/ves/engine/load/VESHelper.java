/*
 * Copyright (C) 2023 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.engine.load;

import java.time.Duration;
import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.timing.StopWatch;
import com.helger.diver.api.version.VESID;
import com.helger.diver.repo.IRepoStorageBase;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;

/**
 * VES helper class
 *
 * @author Philip Helger
 */
@Immutable
public final class VESHelper
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESHelper.class);

  private VESHelper ()
  {}

  /**
   * Load the validation rules from an external repository, identified by a
   * VESID and apply the validation rules onto the provided data to be
   * validated. All errors occurring are stored in the provided error list.
   *
   * @param aRepo
   *        Repository to load from
   * @param aVESID
   *        The VESID of the artefacts to load
   * @param aValidationSource
   *        The data to be validated
   * @param aErrorList
   *        The error list to be filled, containing the loading errors.
   * @return The validation result list.
   * @throws VESLoadingException
   *         If anything goes wrong
   */
  @Nonnull
  public static ValidationResultList loadVESAndApplyValidation (@Nonnull final IRepoStorageBase aRepo,
                                                                @Nonnull final VESID aVESID,
                                                                @Nonnull final IValidationSource aValidationSource,
                                                                @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aRepo, "RepoChain");
    ValueEnforcer.notNull (aVESID, "VESID");
    ValueEnforcer.notNull (aValidationSource, "ValidationSource");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    // load
    final LoadedVES aLoadedVES = new VESLoader (aRepo).setUseEagerRequirementLoading (true)
                                                      .loadVESFromRepo (aVESID, aErrorList);
    if (aLoadedVES == null)
      throw new VESLoadingException ("Failed to load VES '" + aVESID.getAsSingleID () + "'");

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Start validation of '" + aVESID.getAsSingleID () + "'");

    // validate
    final ValidationResultList aValidationResultList = new ValidationResultList ();
    final Duration aDuration = StopWatch.runMeasured ( () -> {
      aLoadedVES.applyValidation (aValidationSource, aValidationResultList, Locale.ENGLISH);
    });

    if (aDuration.compareTo (Duration.ofMillis (500)) > 0)
      LOGGER.warn ("Finished validation of '" + aVESID.getAsSingleID () + "' after " + aDuration);

    return aValidationResultList;
  }
}
