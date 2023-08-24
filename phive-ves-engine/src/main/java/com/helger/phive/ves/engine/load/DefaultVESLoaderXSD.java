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
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageReadableResource;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;

public class DefaultVESLoaderXSD implements IVESLoaderXSD
{
  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultVESLoaderXSD.class);

  @Nonnull
  public IValidationExecutor <IValidationSourceXML> loadXSD (@Nonnull final IRepoStorageChain aRepoChain,
                                                             @Nonnull final VesXsdType aXSD,
                                                             @Nonnull final ErrorList aErrorList)
  {
    final VESID aXSDVESID = VESLoader.wrapID (aXSD.getResource ());
    final String sResourceType = aXSD.getResource ().getType ();
    final RepoStorageKey aXSDKey = RepoStorageKey.of (aXSDVESID, "." + sResourceType);

    // Read referenced Item
    final RepoStorageItem aXSDItem = aRepoChain.read (aXSDKey);
    if (aXSDItem == null)
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aXSDKey.getPath ())
                                 .errorText ("Failed to load XSD artifact from repository")
                                 .build ());
      return null;
    }

    final IReadableResource aRepoRes = new RepoStorageReadableResource (aXSDKey, aXSDItem);

    final ValidationExecutorXSD aExecutorXSD;
    switch (sResourceType)
    {
      case "xsd":
      {
        // Indicate a potential error
        if (StringHelper.hasText (aXSD.getMain ()))
        {
          aErrorList.add (SingleError.builderWarn ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' does not use the 'main' element")
                                     .build ());
        }

        // Load "as is"
        aExecutorXSD = ValidationExecutorXSD.create (aRepoRes);
        break;
      }
      case "zip":
      {
        final String sMain = aXSD.getMain ();
        if (StringHelper.hasNoText (sMain))
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' requires the 'main' element to be provided!")
                                     .build ());
          return null;
        }

        // TODO Load and unpack ZIP and create executor
        LOGGER.warn ("XSD resource type '" + sResourceType + "' not yet implemented");
        aExecutorXSD = null;
        break;
      }
      default:
      {
        aErrorList.add (SingleError.builderError ()
                                   .errorText ("Unsupported XSD resource type '" + sResourceType + "' found")
                                   .build ());
        return null;
      }
    }

    LOGGER.info ("Loaded XSD ValidationExecutorXSD using resource type '" +
                 sResourceType +
                 "' and path '" +
                 aXSDKey.getPath () +
                 "'");
    return aExecutorXSD;
  }
}
