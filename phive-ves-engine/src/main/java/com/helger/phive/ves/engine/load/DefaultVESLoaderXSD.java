package com.helger.phive.ves.engine.load;

import java.io.IOException;
import java.net.URI;
import java.util.function.Function;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.validation.Schema;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.ls.LSResourceResolver;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.inmemory.ReadableResourceInputStream;
import com.helger.commons.io.stream.NonBlockingByteArrayOutputStream;
import com.helger.commons.string.StringHelper;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageReadableResource;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.xml.ls.SimpleLSResourceResolver;
import com.helger.xml.schema.XMLSchemaCache;

public class DefaultVESLoaderXSD implements IVESLoaderXSD
{
  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultVESLoaderXSD.class);

  @Nonnull
  public IValidationExecutor <IValidationSourceXML> loadXSD (@Nonnull final IRepoStorageBase aRepo,
                                                             @Nonnull final VesXsdType aXSD,
                                                             @Nonnull final ErrorList aErrorList)
  {
    final VESID aXSDVESID = VESLoader.wrapID (aXSD.getResource ());
    final String sResourceType = aXSD.getResource ().getType ();
    final RepoStorageKey aXSDKey = RepoStorageKey.of (aXSDVESID, "." + sResourceType);

    // Read referenced Item
    final RepoStorageItem aXSDItem = aRepo.read (aXSDKey);
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
        final Function <String, String> fctUnify = x -> {
          String ret = FilenameHelper.getPathUsingUnixSeparator (x);
          if (ret != null)
          {
            // Make absolute to simply LS resource resolving
            if (!ret.startsWith ("/"))
              ret = "/" + ret;
          }
          return ret;
        };

        final String sMain = fctUnify.apply (aXSD.getMain ());
        if (StringHelper.hasNoText (sMain))
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' requires the 'main' element to be provided!")
                                     .build ());
          return null;
        }

        // Read ZIP file as a whole
        final ICommonsMap <String, NonBlockingByteArrayOutputStream> aZIPContent = new CommonsHashMap <> ();
        final int nSourceLen = aXSDItem.data ().size ();
        long nUnzippedLed = 0;
        final byte [] aBuffer = new byte [4096];
        boolean bFoundMain = false;
        try (ZipInputStream aZIS = new ZipInputStream (aRepoRes.getInputStream ()))
        {
          ZipEntry aEntry = null;
          while ((aEntry = aZIS.getNextEntry ()) != null)
          {
            final String sEntryName = fctUnify.apply (aEntry.getName ());
            if (sMain.equals (sEntryName))
              bFoundMain = true;

            try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ())
            {
              // Read ZIP entry
              int nLen;
              while ((nLen = aZIS.read (aBuffer)) > 0)
              {
                aBAOS.write (aBuffer, 0, nLen);
                nUnzippedLed += nLen;
              }
              aZIPContent.put (sEntryName, aBAOS);
            }
          }
        }
        catch (final IOException ex)
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("XSD resource type '" + sResourceType + "' seems to be a broken ZIP")
                                     .build ());
          return null;
        }

        if (!bFoundMain)
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' does not contain the main element '" +
                                                 sMain +
                                                 "'")
                                     .build ());
          return null;
        }

        LOGGER.info ("Loaded ZIP with " +
                     nSourceLen +
                     " bytes to " +
                     aZIPContent.size () +
                     " entries and unzipped " +
                     nUnzippedLed +
                     " bytes (" +
                     (nUnzippedLed / nSourceLen * 100) +
                     "%)");

        final LSResourceResolver aResResolver = new SimpleLSResourceResolver ()
        {
          @Override
          protected IReadableResource internalResolveResource (@Nonnull @Nonempty final String sType,
                                                               @Nullable final String sNamespaceURI,
                                                               @Nullable final String sPublicId,
                                                               @Nullable final String sSystemId,
                                                               @Nullable final String sBaseURI) throws Exception
          {
            // type is "http://www.w3.org/2001/XMLSchema"
            // Remove the filename from main
            final URI aBaseURI = URI.create (sBaseURI);

            final String sRelativeSystemId = sSystemId == null ? null : FilenameHelper.getCleanPath (FilenameHelper
                                                                                                                   .getPath (aBaseURI.getPath ()) +
                                                                                                     "/" +
                                                                                                     sSystemId);

            if (LOGGER.isDebugEnabled ())
              LOGGER.debug ("Resolving '" +
                            sNamespaceURI +
                            "' and '" +
                            sPublicId +
                            "' and '" +
                            sSystemId +
                            "' / '" +
                            sRelativeSystemId +
                            "' and '" +
                            sBaseURI +
                            "'");

            // Catalog has precedence

            // Search in ZIP
            final NonBlockingByteArrayOutputStream aZIPResolved = aZIPContent.get (sRelativeSystemId);
            if (aZIPResolved != null)
            {
              LOGGER.info ("Resolved '" + sRelativeSystemId + "' to ZIP file content");
              return new ReadableResourceInputStream (sRelativeSystemId, aZIPResolved.getAsInputStream ());
            }

            LOGGER.warn ("Failed to resolve '" +
                         sNamespaceURI +
                         "' and '" +
                         sPublicId +
                         "' and '" +
                         sSystemId +
                         "' / '" +
                         sRelativeSystemId +
                         "' and '" +
                         sBaseURI +
                         "'");
            return super.internalResolveResource (sType, sNamespaceURI, sPublicId, sSystemId, sBaseURI);
          }
        };

        final Schema aSchema = new XMLSchemaCache (aResResolver).getSchema (new ReadableResourceInputStream (sMain,
                                                                                                             aZIPContent.get (sMain)
                                                                                                                        .getAsInputStream ()));
        if (aSchema == null)
          throw new IllegalStateException ("Failed to resolve Schema");

        aExecutorXSD = new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aRepoRes),
                                                  () -> aSchema);
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
