/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation;

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.CollectionHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.peppol.validation.artefact.IValidationSchematronArtefact;
import com.helger.peppol.validation.domain.ValidationKey;

/**
 * This class contains the configuration to run a single UBL document
 * validation. An instance of this class can be used to validate multiple
 * documents.
 *
 * @author Philip Helger
 */
@Immutable
public class ValidationConfiguration
{
  private final ValidationKey m_aValidationKey;
  private final List <IValidationSchematronArtefact> m_aValidationArtefacts;

  /**
   * @param aValidationKey
   *        The validation key to be used. May not be <code>null</code>.
   * @param aValidationArtefacts
   *        The validation artefacts to be used in this particular order. May
   *        neither be <code>null</code> nor empty nor may it contain
   *        <code>null</code> elements.
   */
  public ValidationConfiguration (@Nonnull final ValidationKey aValidationKey,
                                  @Nonnull @Nonempty final List <IValidationSchematronArtefact> aValidationArtefacts)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");
    ValueEnforcer.notEmptyNoNullValue (aValidationArtefacts, "ValidationArtefacts");
    m_aValidationKey = aValidationKey;
    m_aValidationArtefacts = CollectionHelper.newList (aValidationArtefacts);
  }

  /**
   * @return The validation key passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  public ValidationKey getValidationKey ()
  {
    return m_aValidationKey;
  }

  /**
   * @return All validation artefacts to be applied in the order specified by
   *         the returned list. Never <code>null</code> nor empty nor does it
   *         contain <code>null</code> documents.
   */
  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  public List <IValidationSchematronArtefact> getAllValidationArtefacts ()
  {
    return CollectionHelper.newList (m_aValidationArtefacts);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("extendedValidationKey", m_aValidationKey)
                                       .append ("validationArtefacts", m_aValidationArtefacts)
                                       .toString ();
  }
}
