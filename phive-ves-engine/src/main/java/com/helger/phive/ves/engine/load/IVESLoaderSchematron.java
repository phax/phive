/*
 * Copyright (C) 2023-2025 Philip Helger (www.helger.com)
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

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.error.list.ErrorList;
import com.helger.diver.repo.IRepoStorageBase;
import com.helger.phive.api.executor.IValidationExecutor;
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
  /**
   * Load a Schematron validation from a VES.
   *
   * @param aRepo
   *        The repository to load the data from. May not be <code>null</code>.
   * @param aSCHList
   *        The JAXB VES Schematron objects with the details. Order is
   *        important. May not be <code>null</code>.
   * @param aLoadingRequiredVES
   *        In case the loading was recursively triggered via a "requires"
   *        (=include), this is the data of the requirements. May be
   *        <code>null</code>.
   * @param aErrorList
   *        The error list to be filled. May not be <code>null</code>.
   * @param aAsyncLoader
   *        The callback to be invoked, if loading this artefacts needs to
   *        trigger the loading of another artefact.
   * @return The validation executors to be used. May not be <code>null</code>
   *         and not be empty.
   */
  @Nonnull
  ICommonsList <IValidationExecutor <IValidationSourceXML>> loadSchematrons (@Nonnull IRepoStorageBase aRepo,
                                                                             @Nonnull List <VesSchematronType> aSCHList,
                                                                             @Nullable LoadedVES.RequiredVES aLoadingRequiredVES,
                                                                             @Nonnull ErrorList aErrorList,
                                                                             @Nonnull IVESAsyncLoader aAsyncLoader);
}
