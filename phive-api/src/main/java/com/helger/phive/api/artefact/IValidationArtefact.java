/*
 * Copyright (C) 2014-2022 Philip Helger (www.helger.com)
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
package com.helger.phive.api.artefact;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.phive.api.IValidationType;

/**
 * Base interface for a validation artefact, consisting of a type and a readable
 * resource.
 *
 * @author Philip Helger
 */
@MustImplementEqualsAndHashcode
public interface IValidationArtefact
{
  /**
   * @return The validation artefact type - XSD or Schematron. May not be
   *         <code>null</code>.
   */
  @Nonnull
  IValidationType getValidationArtefactType ();

  /**
   * @return The resource that contains the rules depending on the type (like
   *         XSD or Schematron). Never <code>null</code>.
   * @see #getValidationArtefactType()
   */
  @Nonnull
  IReadableResource getRuleResource ();

  /**
   * @return The path of the rule resource to use. Defaults to
   *         <code>getRuleResource().getPath ()</code>. Never <code>null</code>.
   * @since 6.0.4
   */
  @Nonnull
  default String getRuleResourcePath ()
  {
    return getRuleResource ().getPath ();
  }
}
