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
package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.string.ToStringGenerator;

/**
 * Abstract base implementation of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 */
@Immutable
public abstract class AbstractValidationExecutor implements IValidationExecutor
{
  private final IValidationArtefact m_aValidationArtefact;

  public AbstractValidationExecutor (@Nonnull final EValidationType eType,
                                     @Nonnull final IValidationArtefact aValidationArtefact)
  {
    ValueEnforcer.notNull (eType, "Type");
    m_aValidationArtefact = ValueEnforcer.notNull (aValidationArtefact, "ValidationArtefact");
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().equals (eType),
                          () -> "The validation artefact is of type " +
                                aValidationArtefact.getValidationArtefactType () +
                                " but needs to have type " +
                                eType);
  }

  @Nonnull
  public final IValidationArtefact getValidationArtefact ()
  {
    return m_aValidationArtefact;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("ValidationArtefact", m_aValidationArtefact).toString ();
  }
}
