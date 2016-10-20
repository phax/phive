/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.bdve;

import java.io.Serializable;
import java.util.List;
import java.util.function.Consumer;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.string.ToStringGenerator;

/**
 * This class contains the configuration to run a single document validation. An
 * instance of this class can be used to validate multiple documents. All
 * validation artefacts are executed in the order they are provided in the
 * constructor!
 *
 * @author Philip Helger
 */
@Immutable
public class ValidationConfiguration implements Serializable
{
  private final ValidationKey m_aValidationKey;
  private final ICommonsList <IValidationArtefact> m_aValidationArtefacts;

  /**
   * @param aValidationKey
   *        The validation key to be used. May not be <code>null</code>. This
   *        validation key must be a superset of all validation artefact
   *        validation keys and they must only share business specification and
   *        transaction specification.
   * @param aValidationArtefacts
   *        The validation artefacts to be used in this particular order. May
   *        neither be <code>null</code> nor empty nor may it contain
   *        <code>null</code> elements.
   */
  public ValidationConfiguration (@Nonnull final ValidationKey aValidationKey,
                                  @Nonnull @Nonempty final List <IValidationArtefact> aValidationArtefacts)
  {
    ValueEnforcer.notNull (aValidationKey, "ValidationKey");
    ValueEnforcer.notEmptyNoNullValue (aValidationArtefacts, "ValidationArtefacts");
    m_aValidationKey = aValidationKey;
    m_aValidationArtefacts = new CommonsArrayList<> (aValidationArtefacts);
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
  public ICommonsList <IValidationArtefact> getAllValidationArtefacts ()
  {
    return m_aValidationArtefacts.getClone ();
  }

  /**
   * Invoke the passed consumer on each contained validation artefact in the
   * order specified in the constructor.<br>
   * Note: only read operations may be performed with the consumer!
   *
   * @param aConsumer
   *        The consumer to invoke. May not be <code>null</code>.
   */
  public void forEachValidationArtefact (@Nonnull final Consumer <? super IValidationArtefact> aConsumer)
  {
    ValueEnforcer.notNull (aConsumer, "Consumer");
    m_aValidationArtefacts.forEach (aConsumer);
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationKey", m_aValidationKey)
                                       .append ("ValidationArtefacts", m_aValidationArtefacts)
                                       .toString ();
  }
}
