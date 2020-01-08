/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
import javax.annotation.Nullable;

import com.helger.bdve.EValidationType;
import com.helger.commons.annotation.MustImplementEqualsAndHashcode;
import com.helger.commons.io.resource.IReadableResource;

/**
 * Base interface for a validation artefact, consisting of a type, a class
 * loader and a readable resource.
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
   * Get the preferred class loader to be used to load the resource of this
   * validation artefact. May be <code>null</code> to indicate usage of the
   * default class loader.
   *
   * @return The class loader to be used. May be <code>null</code>.
   * @since 3.2.0
   */
  @Nullable
  ClassLoader getClassLoader ();

  /**
   * @return The resource that contains the rules depending on the type (like
   *         XSD or Schematron). Never <code>null</code>.
   * @see #getValidationArtefactType()
   */
  @Nonnull
  IReadableResource getRuleResource ();
}
