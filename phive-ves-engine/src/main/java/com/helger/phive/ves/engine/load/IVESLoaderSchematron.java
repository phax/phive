/*
 * Copyright (C) 2023-2024 Philip Helger (www.helger.com)
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

import javax.annotation.Nonnull;

import com.helger.commons.error.list.ErrorList;
import com.helger.diver.repo.IRepoStorageBase;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.xml.source.IValidationSourceXML;

/**
 * This interface is used by {@link VESLoader} create an
 * {@link IValidationExecutor} from the VES Schematron requirements.
 *
 * @author Philip Helger
 */
public interface IVESLoaderSchematron
{
  @Nonnull
  IValidationExecutor <IValidationSourceXML> loadSchematron (@Nonnull IRepoStorageBase aRepo,
                                                             @Nonnull VesSchematronType aSCH,
                                                             @Nonnull ErrorList aErrorList);
}
