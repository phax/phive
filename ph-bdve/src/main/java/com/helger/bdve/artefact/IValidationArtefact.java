/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.artefact;

import java.io.Serializable;

import javax.annotation.Nonnull;

import com.helger.bdve.EValidationType;
import com.helger.bdve.ValidationArtefactKey;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Base interface for a single validation artefact that uses Schematron for
 * validation.
 *
 * @author Philip Helger
 */
@MustImplementEqualsAndHashcode
public interface IValidationArtefact extends Serializable
{
  /**
   * @return The validation artefact type - XSD or Schematron. May not be
   *         <code>null</code>.
   */
  @Nonnull
  EValidationType getValidationArtefactType ();

  /**
   * @return The resource that contains the rules depending on the type (like
   *         XSD or Schematron). Never <code>null</code>.
   * @see #getValidationArtefactType()
   */
  @Nonnull
  IReadableResource getRuleResource ();

  /**
   * @return The validation key for this validation artefact. Never
   *         <code>null</code>.
   */
  @Nonnull
  ValidationArtefactKey getValidationKey ();
}
