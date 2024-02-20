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

import java.io.IOException;
import java.math.RoundingMode;
import java.net.URI;
import java.util.Locale;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
import javax.xml.validation.Schema;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.ls.LSResourceResolver;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.CommonsLinkedHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.collection.impl.ICommonsOrderedMap;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.id.IHasID;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.misc.SizeHelper;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.resource.inmemory.ReadableResourceInputStream;
import com.helger.commons.io.stream.NonBlockingByteArrayOutputStream;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.math.MathHelper;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.commons.timing.StopWatch;
import com.helger.diver.repo.IRepoStorageBase;
import com.helger.diver.repo.IRepoStorageItem;
import com.helger.diver.repo.RepoStorageKey;
import com.helger.diver.repo.RepoStorageReadableResource;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.ves.v10.VesXmlPreconditionType;
import com.helger.phive.ves.v10.VesXsdCatalogItemPublicType;
import com.helger.phive.ves.v10.VesXsdCatalogItemSystemType;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.xml.ls.SimpleLSResourceResolver;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * The default implementation of {@link IVESLoaderXSD} for XML Schema
 * validation.
 *
 * @author Philip Helger
 */
public class DefaultVESLoaderXSD implements IVESLoaderXSD
{
  public static final String RESOURCE_TYPE_ZIP = "zip";
  public static final String RESOURCE_TYPE_XSD = "xsd";

  private static final Logger LOGGER = LoggerFactory.getLogger (DefaultVESLoaderXSD.class);

  /**
   * Catalog entry type
   *
   * @author Philip Helger
   */
  public enum ECatalogType implements IHasID <String>
  {
    PUBLIC ("public"),
    SYSTEM ("system");

    private final String m_sID;

    ECatalogType (@Nonnull @Nonempty final String sID)
    {
      m_sID = sID;
    }

    @Nonnull
    @Nonempty
    public String getID ()
    {
      return m_sID;
    }

    @Nullable
    public static ECatalogType getFromIDOrNull (@Nullable final String sID)
    {
      return EnumHelper.getFromIDOrNull (ECatalogType.class, sID);
    }
  }

  /**
   * Represent a single XML catalog entry
   *
   * @author Philip Helger
   */
  @Immutable
  public static final class CatalogEntry implements IHasID <String>
  {
    private final ECatalogType m_eType;
    private final String m_sID;
    private final RepoStorageKey m_aKey;

    public CatalogEntry (@Nonnull final ECatalogType eType,
                         @Nonnull @Nonempty final String sID,
                         @Nonnull final RepoStorageKey aKey)
    {
      ValueEnforcer.notNull (eType, "Type");
      ValueEnforcer.notEmpty (sID, "ID");
      ValueEnforcer.notNull (aKey, "Key");
      m_eType = eType;
      m_sID = sID;
      m_aKey = aKey;
    }

    @Nonnull
    public ECatalogType getType ()
    {
      return m_eType;
    }

    @Nonnull
    @Nonempty
    public String getID ()
    {
      return m_sID;
    }

    @Nonnull
    public RepoStorageKey getRepoStorageKey ()
    {
      return m_aKey;
    }

    @Override
    public String toString ()
    {
      return new ToStringGenerator (null).append ("Type", m_eType)
                                         .append ("ID", m_sID)
                                         .append ("Key", m_aKey)
                                         .getToString ();
    }
  }

  @Nullable
  private static final String _unifyPath (@Nullable final String x)
  {
    // Converty any "\" to "/"
    String ret = FilenameHelper.getPathUsingUnixSeparator (x);
    if (ret != null)
    {
      // Make absolute to simply LS resource resolving
      if (!ret.startsWith ("/"))
        ret = '/' + ret;
    }
    return ret;
  }

  @Nonnull
  public IValidationExecutor <IValidationSourceXML> loadXSD (@Nonnull final IRepoStorageBase aRepo,
                                                             @Nonnull final VesXsdType aXSD,
                                                             @Nonnull final ErrorList aErrorList)
  {
    final RepoStorageKey aXSDKey = VESLoader.createRepoStorageKey (aXSD.getResource ());

    // Read referenced Item
    final IRepoStorageItem aXSDItem = aRepo.read (aXSDKey);
    if (aXSDItem == null)
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorFieldName (aXSDKey.getPath ())
                                 .errorText ("Failed to load XSD artifact from repository")
                                 .build ());
      return null;
    }

    // Read catalog items (if any)
    final ICommonsOrderedMap <String, CatalogEntry> aCatalogEntries = new CommonsLinkedHashMap <> ();
    if (aXSD.getCatalog () != null)
    {
      for (final Object aItem : aXSD.getCatalog ().getPublicOrSystem ())
      {
        final CatalogEntry aEntry;
        if (aItem instanceof VesXsdCatalogItemPublicType)
        {
          final VesXsdCatalogItemPublicType aPublic = (VesXsdCatalogItemPublicType) aItem;
          aEntry = new CatalogEntry (ECatalogType.PUBLIC,
                                     aPublic.getUri (),
                                     VESLoader.createRepoStorageKey (aPublic.getResource ()));
        }
        else
        {
          final VesXsdCatalogItemSystemType aSystem = (VesXsdCatalogItemSystemType) aItem;
          aEntry = new CatalogEntry (ECatalogType.SYSTEM,
                                     aSystem.getId (),
                                     VESLoader.createRepoStorageKey (aSystem.getResource ()));
        }
        if (aCatalogEntries.containsKey (aEntry.getID ()))
        {
          aErrorList.add (SingleError.builderError ()
                                     .errorFieldName (aEntry.getID ())
                                     .errorText ("Another catalog item with the same identifier is already present")
                                     .build ());
          return null;
        }
        aCatalogEntries.put (aEntry.getID (), aEntry);
      }
    }

    // Check for precondition
    final VesXmlPreconditionType aPrecondition = aXSD.getPrecondition ();

    final IReadableResource aRepoRes = new RepoStorageReadableResource (aXSDKey, aXSDItem);

    final StopWatch aSW = StopWatch.createdStarted ();
    final ValidationExecutorXSD aExecutorXSD;
    final String sResourceType = aXSD.getResource ().getType ();
    switch (sResourceType)
    {
      case RESOURCE_TYPE_XSD:
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

        if (aCatalogEntries.isNotEmpty ())
        {
          // TODO implement catalog support
          aErrorList.add (SingleError.builderWarn ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' is missing support for catalog entries")
                                     .build ());
        }
        if (aPrecondition != null)
        {
          // TODO implement precondition support
          aErrorList.add (SingleError.builderWarn ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' is missing support for XSD preconditions")
                                     .build ());
        }

        // Load "as is"
        aExecutorXSD = ValidationExecutorXSD.create (aRepoRes);
        break;
      }
      case RESOURCE_TYPE_ZIP:
      {
        final String sMainUnified = _unifyPath (aXSD.getMain ());
        if (StringHelper.hasNoText (sMainUnified))
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

        if (aCatalogEntries.isNotEmpty ())
        {
          // TODO implement catalog support
          aErrorList.add (SingleError.builderWarn ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' does not yet support catalog entries")
                                     .build ());
        }
        if (aPrecondition != null)
        {
          // TODO implement precondition support
          aErrorList.add (SingleError.builderWarn ()
                                     .errorText ("XSD resource type '" +
                                                 sResourceType +
                                                 "' is missing support for XSD preconditions")
                                     .build ());
        }

        final SizeHelper aSH = SizeHelper.getSizeHelperOfLocale (Locale.ROOT);
        LOGGER.info ("Loaded ZIP with " +
                     aSH.getAsMatching (nSourceLen) +
                     " with " +
                     aZIPContent.size () +
                     " entries; unzipped size is " +
                     aSH.getAsMatching (nUnzippedLen) +
                     " bytes (~" +
                     MathHelper.getDividedBigDecimal (nUnzippedLen * 100, nSourceLen, 2, RoundingMode.HALF_UP) +
                     "%)");

        // Use a specific Resource Resolver to load entries from within the ZIP
        // file
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

            final String sRelativeSystemId;
            if (sSystemId == null)
              sRelativeSystemId = null;
            else
              sRelativeSystemId = FilenameHelper.getCleanPath (FilenameHelper.getPath (aBaseURI.getPath ()) +
                                                               '/' +
                                                               sSystemId);

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
            // TODO resolve by catalog

            // Search in ZIP
            final NonBlockingByteArrayOutputStream aZIPResolved = aZIPContent.get (sRelativeSystemId);
            if (aZIPResolved != null)
            {
              LOGGER.info ("  Successfully resolved '" + sRelativeSystemId + "' to ZIP file content");
              return new ReadableResourceInputStream (sRelativeSystemId, aZIPResolved.getAsInputStream ());
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
