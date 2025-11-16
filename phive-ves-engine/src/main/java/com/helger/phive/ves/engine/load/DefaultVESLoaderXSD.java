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

import java.io.IOException;
import java.math.RoundingMode;
import java.net.URI;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.xml.validation.Schema;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.ls.LSResourceResolver;

import com.helger.annotation.Nonempty;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.numeric.BigHelper;
import com.helger.base.string.StringHelper;
import com.helger.base.timing.StopWatch;
import com.helger.collection.commons.CommonsHashMap;
import com.helger.collection.commons.ICommonsMap;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.IRepoStorageBase;
import com.helger.diver.repo.IRepoStorageReadItem;
import com.helger.diver.repo.RepoStorageKey;
import com.helger.diver.repo.RepoStorageReadableResource;
import com.helger.io.file.FilenameHelper;
import com.helger.io.misc.SizeHelper;
import com.helger.io.resource.IReadableResource;
import com.helger.io.resource.inmemory.ReadableResourceInputStream;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.ves.engine.load.catalog.EVESCatalogType;
import com.helger.phive.ves.engine.load.catalog.VESCatalog;
import com.helger.phive.ves.engine.load.catalog.VESCatalogEntry;
import com.helger.phive.ves.v10.VesXmlPreconditionType;
import com.helger.phive.ves.v10.VesXsdCatalogItemPublicType;
import com.helger.phive.ves.v10.VesXsdCatalogItemSystemType;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.xml.ls.SimpleLSResourceResolver;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * The default implementation of {@link IVESLoaderXSD} for XML Schema validation.
 *
 * @author Philip Helger
 */
public class DefaultVESLoaderXSD implements IVESLoaderXSD
{
  public static final String RESOURCE_TYPE_ZIP = "zip";
  public static final String FILE_EXT_ZIP = '.' + RESOURCE_TYPE_ZIP;
  public static final String RESOURCE_TYPE_XSD = "xsd";
  public static final String FILE_EXT_XSD = '.' + RESOURCE_TYPE_XSD;

  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultVESLoaderXSD.class);

  @Nullable
  private static final String _unifyPath (@Nullable final String x)
  {
    // Convert any "\" to "/"
    String ret = FilenameHelper.getPathUsingUnixSeparator (x);
    if (ret != null)
    {
      // Make absolute to simply LS resource resolving
      if (!ret.startsWith ("/"))
        ret = '/' + ret;
    }
    return ret;
  }

  @NonNull
  public IValidationExecutor <IValidationSourceXML> loadXSD (@NonNull final IRepoStorageBase aRepo,
                                                             @NonNull final VesXsdType aXSD,
                                                             final LoadedVES.@Nullable RequiredVES aLoadingRequiredVES,
                                                             @NonNull final ErrorList aErrorList,
                                                             @NonNull final IVESAsyncLoader aAsyncLoader)
  {
    ValueEnforcer.notNull (aRepo, "Repo");
    ValueEnforcer.notNull (aXSD, "XSD");
    ValueEnforcer.notNull (aErrorList, "ErrorList");
    ValueEnforcer.notNull (aAsyncLoader, "AsyncLoader");

    final RepoStorageKey aXSDKey = VESLoader.createRepoStorageKey (aXSD.getResource ());

    // Read referenced Item
    final IRepoStorageReadItem aXSDItem = aRepo.read (aXSDKey);
    if (aXSDItem == null)
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aXSDKey.getPath ())
                                 .errorText ("Failed to load XSD artifact from repository")
                                 .build ());
      return null;
    }

    // Read catalog items (if any)
    final VESCatalog aCatalogEntries = new VESCatalog ();
    if (aXSD.getCatalog () != null)
    {
      for (final Object aItem : aXSD.getCatalog ().getPublicOrSystem ())
      {
        final VESCatalogEntry aEntry;
        if (aItem instanceof final VesXsdCatalogItemPublicType aPublic)
        {
          aEntry = new VESCatalogEntry (EVESCatalogType.PUBLIC,
                                        aPublic.getUri (),
                                        VESLoader.createRepoStorageKey (aPublic.getResource ()));
        }
        else
        {
          final VesXsdCatalogItemSystemType aSystem = (VesXsdCatalogItemSystemType) aItem;
          aEntry = new VESCatalogEntry (EVESCatalogType.SYSTEM,
                                        aSystem.getId (),
                                        VESLoader.createRepoStorageKey (aSystem.getResource ()));
        }
        if (aCatalogEntries.addEntry (aEntry).isUnchanged ())
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorFieldName (aEntry.getID ())
                                     .errorText ("Another catalog item with the same identifier '" +
                                                 aEntry.getID () +
                                                 "' is already present")
                                     .build ());
          return null;
        }
      }
    }

    // Check for precondition
    final VesXmlPreconditionType aPrecondition = aXSD.getPrecondition ();

    // Readable resource from repository content
    final IReadableResource aRepoRes = new RepoStorageReadableResource (aXSDKey, aXSDItem.getContent ());

    final StopWatch aSW = StopWatch.createdStarted ();
    final ValidationExecutorXSD aExecutorXSD;
    final String sResourceType = aXSD.getResource ().getType ();
    switch (sResourceType)
    {
      case RESOURCE_TYPE_XSD:
      {
        // Indicate a potential error
        if (StringHelper.isNotEmpty (aXSD.getMain ()))
        {
          aErrorList.add (SingleError.builderWarn ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' does not use the 'main' element")
                                     .build ());
        }

        if (aCatalogEntries.isNotEmpty ())
        {
          // TODO implement catalog support
          final String sMsg = "XSD resource type '" + sResourceType + "' is missing support for catalog entries";
          LOGGER.warn (sMsg);
          aErrorList.add (SingleError.builderWarn ().errorText (sMsg).build ());
        }
        if (aPrecondition != null)
        {
          // TODO implement precondition support
          final String sMsg = "XSD resource type '" + sResourceType + "' is missing support for XSD preconditions";
          LOGGER.warn (sMsg);
          aErrorList.add (SingleError.builderWarn ().errorText (sMsg).build ());
        }

        // Load "as is"
        aExecutorXSD = ValidationExecutorXSD.create (aRepoRes);
        break;
      }
      case RESOURCE_TYPE_ZIP:
      {
        final String sMainUnified = _unifyPath (aXSD.getMain ());
        if (StringHelper.isEmpty (sMainUnified))
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
        final long nSourceLen = aXSDItem.getContent ().getLength ();
        long nUnzippedLen = 0;
        final byte [] aBuffer = new byte [4096];
        boolean bFoundMain = false;
        try (final ZipInputStream aZIS = new ZipInputStream (aRepoRes.getInputStream ()))
        {
          ZipEntry aEntry = null;
          while ((aEntry = aZIS.getNextEntry ()) != null)
          {
            if (aEntry.isDirectory ())
              continue;

            final String sEntryNameUnified = _unifyPath (aEntry.getName ());
            if (sMainUnified.equals (sEntryNameUnified))
              bFoundMain = true;

            // Read ZIP entry
            try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ())
            {
              int nLen;
              while ((nLen = aZIS.read (aBuffer)) > 0)
              {
                aBAOS.write (aBuffer, 0, nLen);
                nUnzippedLen += nLen;
              }

              // Remember ZIP entry in map
              aZIPContent.put (sEntryNameUnified, aBAOS);
            }
          }
        }
        catch (final IOException ex)
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("XSD resource type '" + sResourceType + "' seems to be a broken ZIP")
                                     .linkedException (ex)
                                     .build ());
          return null;
        }

        if (!bFoundMain)
        {
          // Make sure that the reference "main" object exists
          aErrorList.add (SingleError.builderError ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' does not contain the main element '" +
                                                 sMainUnified +
                                                 "'")
                                     .build ());
          return null;
        }

        if (aPrecondition != null)
        {
          // TODO implement precondition support
          final String sMsg = "XSD resource type '" + sResourceType + "' is missing support for XSD preconditions";
          LOGGER.warn (sMsg);
          aErrorList.add (SingleError.builderWarn ().errorText (sMsg).build ());
        }

        final SizeHelper aSH = SizeHelper.getSizeHelperOfLocale (Locale.ROOT);
        LOGGER.info ("Loaded ZIP with " +
                     aSH.getAsMatching (nSourceLen) +
                     " with " +
                     aZIPContent.size () +
                     " entries; unzipped size is " +
                     aSH.getAsMatching (nUnzippedLen) +
                     " bytes (~" +
                     BigHelper.getDividedBigDecimal (nUnzippedLen * 100, nSourceLen, 2, RoundingMode.HALF_UP) +
                     "%)");

        // Use a specific Resource Resolver to load entries from within the ZIP
        // file
        final LSResourceResolver aResResolver = new SimpleLSResourceResolver ()
        {
          @Override
          protected IReadableResource internalResolveResource (@NonNull @Nonempty final String sType,
                                                               @Nullable final String sNamespaceURI,
                                                               @Nullable final String sPublicId,
                                                               @Nullable final String sSystemId,
                                                               @Nullable final String sBaseURI) throws Exception
          {
            // type is "http://www.w3.org/2001/XMLSchema"
            // Remove the filename from main
            final URI aBaseURI = URI.create (sBaseURI);

            final String sRelativeSystemId;
            if (sSystemId == null)
              sRelativeSystemId = null;
            else
            {
              String sBasePath = FilenameHelper.getPath (aBaseURI.getPath ());
              // Avoid double slash
              if (!StringHelper.endsWith (sBasePath, '/'))
                sBasePath += '/';
              sRelativeSystemId = FilenameHelper.getCleanPath (sBasePath + sSystemId);
            }

            if (LOGGER.isDebugEnabled ())
              LOGGER.debug ("  Trying to resolve '" +
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
            if (aCatalogEntries.isNotEmpty ())
            {
              // Check public entries first
              if (StringHelper.isNotEmpty (sNamespaceURI))
              {
                final VESCatalogEntry aEntry = aCatalogEntries.findEntryByUri (sNamespaceURI);
                if (aEntry != null)
                {
                  final DVRCoordinate aTargetVESID = aEntry.getRepoStorageKey ().getCoordinate ();

                  // Load referenced catalog resource
                  final IRepoStorageReadItem aLoadedCatalogRes = aAsyncLoader.loadResource (aTargetVESID,
                                                                                            "." + RESOURCE_TYPE_XSD);
                  if (aLoadedCatalogRes != null)
                  {
                    if (LOGGER.isDebugEnabled ())
                      LOGGER.debug ("  Successfully resolved namespace URI '" +
                                    sNamespaceURI +
                                    "' to Catalog Entry pointing to '" +
                                    aTargetVESID.getAsSingleID () +
                                    "'");
                    return new ReadableResourceInputStream (sRelativeSystemId,
                                                            aLoadedCatalogRes.getContent ().getInputStream ());
                  }
                  LOGGER.warn ("  Failed to resolve Catalog Entry pointing to '" + aTargetVESID.getAsSingleID () + "'");
                }
                else
                {
                  // Will be resolved otherwise
                  if (LOGGER.isDebugEnabled ())
                    LOGGER.debug ("  Found no Catalog Entry for namespace URI '" + sNamespaceURI + "'");
                }
              }

              if (StringHelper.isNotEmpty (sPublicId))
              {
                // TODO implement catalog support
                final String sMsg = "XSD resource type '" +
                                    sResourceType +
                                    "' does not yet support catalog entries for PUBLIC ID ('" +
                                    sPublicId +
                                    "')";
                LOGGER.warn (sMsg);
                aErrorList.add (SingleError.builderWarn ().errorText (sMsg).build ());
              }

              if (StringHelper.isNotEmpty (sSystemId))
              {
                final VESCatalogEntry aEntry = aCatalogEntries.findEntryBySystemID (sSystemId);
                if (aEntry != null)
                {
                  final DVRCoordinate aTargetVESID = aEntry.getRepoStorageKey ().getCoordinate ();

                  // Load referenced catalog resource
                  final IRepoStorageReadItem aLoadedCatalogRes = aAsyncLoader.loadResource (aTargetVESID,
                                                                                            "." + RESOURCE_TYPE_XSD);
                  if (aLoadedCatalogRes != null)
                  {
                    LOGGER.info ("  Successfully resolved System ID '" +
                                 sSystemId +
                                 "' to Catalog Entry pointing to '" +
                                 aTargetVESID.getAsSingleID () +
                                 "'");
                    return new ReadableResourceInputStream (sRelativeSystemId,
                                                            aLoadedCatalogRes.getContent ().getInputStream ());
                  }
                  LOGGER.warn ("  Failed to resolve Catalog Entry pointing to '" + aTargetVESID.getAsSingleID () + "'");
                }
                else
                {
                  // Will be resolved otherwise
                  if (LOGGER.isDebugEnabled ())
                    LOGGER.debug ("  Found no Catalog Entry for System ID '" + sSystemId + "'");
                }
              }
            }

            if (StringHelper.isNotEmpty (sRelativeSystemId))
            {
              // Matches in ZIP are the default
              final NonBlockingByteArrayOutputStream aZIPResolved = aZIPContent.get (sRelativeSystemId);
              if (aZIPResolved != null)
              {
                if (LOGGER.isDebugEnabled ())
                  LOGGER.debug ("  Successfully resolved '" + sRelativeSystemId + "' to ZIP file content");
                return new ReadableResourceInputStream (sRelativeSystemId, aZIPResolved.getAsInputStream ());
              }
              LOGGER.warn ("  Failed to resolve System ID '" + sRelativeSystemId + "' in ZIP content");
            }

            LOGGER.warn ("  Failed to resolve '" +
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

        // Now create the parsed XML Schema using a ResourceResolver and an
        // InputStream based on the Main file of the ZIP
        final ReadableResourceInputStream aRes = new ReadableResourceInputStream (sMainUnified,
                                                                                  aZIPContent.get (sMainUnified)
                                                                                             .getAsInputStream ());
        final Schema aSchema = new XMLSchemaCache (aResResolver).getSchema (aRes);
        if (aSchema == null)
          throw new IllegalStateException ("Failed to resolve XML Schema from ZIP");

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

    aSW.stop ();
    LOGGER.info ("Loaded ValidationExecutorXSD using resource type '" +
                 sResourceType +
                 "' and path '" +
                 aXSDKey.getPath () +
                 "' in " +
                 aSW.getMillis () +
                 "ms");
    return aExecutorXSD;
  }
}
