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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.EErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.StringHelper;
import com.helger.diver.repo.IRepoStorageBase;
import com.helger.diver.repo.IRepoStorageReadItem;
import com.helger.diver.repo.RepoStorageKey;
import com.helger.diver.repo.RepoStorageReadableResource;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.ves.v10.VesCustomErrorType;
import com.helger.phive.ves.v10.VesOutputType;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.xml.schematron.CustomErrorDetails;
import com.helger.phive.xml.schematron.ESchematronEngine;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * The default implementation of {@link IVESLoaderSchematron} for Schematron
 * validation.
 *
 * @author Philip Helger
 */
public class DefaultVESLoaderSchematron implements IVESLoaderSchematron
{
  public static final String RESOURCE_TYPE_SCH = "sch";
  public static final String FILE_EXT_SCH = '.' + RESOURCE_TYPE_SCH;
  public static final String RESOURCE_TYPE_XSLT = "xslt";
  public static final String FILE_EXT_XSLT = '.' + RESOURCE_TYPE_XSLT;

  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultVESLoaderSchematron.class);

  @Nonnull
  public ICommonsList <IValidationExecutor <IValidationSourceXML>> loadSchematrons (@Nonnull final IRepoStorageBase aRepo,
                                                                                    @Nonnull final List <VesSchematronType> aSCHList,
                                                                                    @Nullable final LoadedVES.RequiredVES aLoadingRequiredVES,
                                                                                    @Nonnull final ErrorList aErrorList,
                                                                                    @Nonnull final IVESAsyncLoader aAsyncLoader)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    ValueEnforcer.notEmptyNoNullValue (aSCHList, "SCHList");
    ValueEnforcer.notNull (aErrorList, "ErrorList");
    ValueEnforcer.notNull (aAsyncLoader, "AsyncLoader");

    final ICommonsList <IValidationExecutor <IValidationSourceXML>> ret = new CommonsArrayList <> ();

    for (final VesSchematronType aSCH : aSCHList)
    {
      final RepoStorageKey aSCHKey = VESLoader.createRepoStorageKey (aSCH.getResource ());

      // Read referenced Item
      final IRepoStorageReadItem aSCHItem = aRepo.read (aSCHKey);
      if (aSCHItem == null)
      {
        aErrorList.add (SingleError.builderError ()
                                   .errorFieldName (aSCHKey.getPath ())
                                   .errorText ("Failed to load Schematron artifact from repository")
                                   .build ());
        continue;
      }

      // Readable resource from repository content
      final IReadableResource aRepoRes = new RepoStorageReadableResource (aSCHKey, aSCHItem.getContent ());

      // Resolve Namespace Context
      final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
      VESLoader.internalWrapNamespaceList (aSCH.getNamespaces (), aNSCtx);

      final ValidationExecutorSchematron aExecutorSCH;
      final String sResourceType = aSCH.getResource ().getType ();
      switch (sResourceType)
      {
        case RESOURCE_TYPE_SCH:
        {
          // Resolve Schematron Engine
          final String sEngine = aSCH.getEngine ();
          final ESchematronEngine eEngine = ESchematronEngine.getFromIDOrNull (sEngine);
          if (eEngine == null)
          {
            aErrorList.add (SingleError.builderError ()
                                       .errorText ("Schematron engine '" +
                                                   sEngine +
                                                   "' is unknown. Valid IDs are: " +
                                                   StringHelper.imploder ()
                                                               .source (ESchematronEngine.values (),
                                                                        x -> "'" + x.getID () + "'")
                                                               .separator (", ")
                                                               .build ())
                                       .build ());
            continue;
          }

          switch (eEngine)
          {
            case PURE:
              aExecutorSCH = ValidationExecutorSchematron.createPure (aRepoRes, aNSCtx);
              break;
            case ISO_SCHEMATRON:
              aExecutorSCH = ValidationExecutorSchematron.createSCH (aRepoRes, aNSCtx);
              break;
            case SCHXSLT:
              aExecutorSCH = ValidationExecutorSchematron.createSchXslt (aRepoRes, aNSCtx);
              break;
            default:
              throw new IllegalStateException ("Unsupported Schematron engine " + eEngine);
          }
          break;
        }
        case RESOURCE_TYPE_XSLT:
        {
          // Indicate a potential error
          if (StringHelper.hasText (aSCH.getEngine ()))
          {
            aErrorList.add (SingleError.builderWarn ()
                                       .errorText ("Schematron resource type '" +
                                                   sResourceType +
                                                   "' does not support the 'engine' element")
                                       .build ());
          }

          // Simple
          aExecutorSCH = ValidationExecutorSchematron.createXSLT (aRepoRes, aNSCtx);
          break;
        }
        default:
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("Unsupported Schematron resource type '" + sResourceType + "' found")
                                     .build ());
          continue;
        }
      }

      final ICommonsMap <String, CustomErrorDetails> aCustomErrorDetails = new CommonsHashMap <> ();

      // Is something defined at the Schematron itself?
      if (aSCH.getOutput () != null)
      {
        final VesOutputType aOutput = aSCH.getOutput ();

        // Check for custom error levels
        if (aOutput.hasCustomErrorEntries ())
          for (final VesCustomErrorType aCustomError : aOutput.getCustomError ())
          {
            final String sKey = aCustomError.getId ();
            final EErrorLevel eErrorLevel = VESLoader.internalWrapErrorLevel (aCustomError.getLevel ());
            if (StringHelper.hasText (sKey) && eErrorLevel != null)
              aCustomErrorDetails.put (sKey,
                                       new CustomErrorDetails (eErrorLevel,
                                                               aCustomError.getErrorTextPrefix (),
                                                               aCustomError.getErrorTextSuffix ()));
          }
      }

      // Are we changing the output levels on a "required" resource?
      if (aLoadingRequiredVES != null && aLoadingRequiredVES.getOutput ().customErrorDetails ().isNotEmpty ())
      {
        // These ones overwrite the original ones
        aCustomErrorDetails.putAll (aLoadingRequiredVES.getOutput ().customErrorDetails ());
      }

      if (aCustomErrorDetails.isNotEmpty ())
        aExecutorSCH.addCustomErrorDetails (aCustomErrorDetails);

      LOGGER.info ("Loaded ValidationExecutorSchematron using resource type '" +
                   sResourceType +
                   "' and path '" +
                   aSCHKey.getPath () +
                   "'");
      ret.add (aExecutorSCH);
    }

    return ret;
  }
}
