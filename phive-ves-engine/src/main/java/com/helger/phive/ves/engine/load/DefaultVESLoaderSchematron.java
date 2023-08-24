package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.error.SingleError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageReadableResource;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.xml.schematron.ESchematronEngine;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.xml.namespace.MapBasedNamespaceContext;

public class DefaultVESLoaderSchematron implements IVESLoaderSchematron
{
  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultVESLoaderSchematron.class);

  @Nonnull
  public IValidationExecutor <IValidationSourceXML> loadSchematron (@Nonnull final IRepoStorageBase aRepo,
                                                                    @Nonnull final VesSchematronType aSCH,
                                                                    @Nonnull final ErrorList aErrorList)
  {
    final VESID aSCHVESID = VESLoader.wrapID (aSCH.getResource ());
    final String sResourceType = aSCH.getResource ().getType ();
    final RepoStorageKey aSCHKey = RepoStorageKey.of (aSCHVESID, "." + sResourceType);

    // Read referenced Item
    final RepoStorageItem aSCHItem = aRepo.read (aSCHKey);
    if (aSCHItem == null)
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aSCHKey.getPath ())
                                 .errorText ("Failed to load Schematron artifact from repository")
                                 .build ());
      return null;
    }

    final IReadableResource aRepoRes = new RepoStorageReadableResource (aSCHKey, aSCHItem);

    // Resolve Namespace Context
    final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
    VESLoader.wrap (aSCH.getNamespaces (), aNSCtx);

    final ValidationExecutorSchematron aExecutorSCH;
    switch (sResourceType)
    {
      case "sch":
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
          return null;
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
      case "xslt":
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
        return null;
      }
    }

    LOGGER.info ("Loaded XSD ValidationExecutorSchematron using resource type '" +
                 sResourceType +
                 "' and path '" +
                 aSCHKey.getPath () +
                 "'");
    return aExecutorSCH;
  }
}
