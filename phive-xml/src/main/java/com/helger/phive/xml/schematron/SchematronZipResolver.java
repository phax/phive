/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.schematron;

import java.io.IOException;
import java.io.InputStream;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.annotation.Nonempty;
import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.io.nonblocking.NonBlockingByteArrayInputStream;
import com.helger.base.string.StringHelper;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.file.FilenameHelper;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.xml.zip.InMemoryZipContent;
import com.helger.schematron.CSchematron;
import com.helger.schematron.SchematronException;
import com.helger.schematron.errorhandler.WrappedCollectingPSErrorHandler;
import com.helger.schematron.exchange.PSReader;
import com.helger.schematron.model.PSNS;
import com.helger.schematron.model.PSSchema;
import com.helger.schematron.preprocess.PSPreprocessor;
import com.helger.schematron.pure.binding.IPSQueryBinding;
import com.helger.schematron.pure.binding.PSQueryBindingRegistry;
import com.helger.schematron.resolve.ISchematronIncludeResolver;
import com.helger.schematron.svrl.CSVRL;
import com.helger.xml.microdom.IMicroDocument;
import com.helger.xml.microdom.MicroDocument;
import com.helger.xml.microdom.serialize.MicroWriter;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.write.EXMLSerializeIndent;
import com.helger.xml.serialize.write.XMLWriterSettings;

/**
 * Resolve a Schematron that is contained in a ZIP file, together with all the files it includes,
 * into one self-contained Schematron. Everything happens in memory:
 * <ol>
 * <li>The ZIP file is read with {@link InMemoryZipContent} (no nested ZIPs, with limits for the
 * unzipped size and the number of entries)</li>
 * <li>All <code>sch:include</code> elements are resolved from the ZIP entries, relative to the file
 * that contains the include. Includes are never resolved from the file system or the network: an
 * href that is not an entry of the ZIP (including absolute URLs) is an error. A path going above
 * the root of the ZIP (<code>../</code>) stays at the root of the ZIP.</li>
 * <li>The Schematron is preprocessed without information loss (abstract patterns, abstract rules
 * and <code>extends</code> are resolved; reports, diagnostics and titles are kept).</li>
 * </ol>
 * The result can be serialised with {@link #getSchematronAsBytes(PSSchema)}.
 *
 * @author Philip Helger
 * @since 12.4.0
 */
@NotThreadSafe
public class SchematronZipResolver
{
  /** The display name used in the error messages of the ZIP handling */
  public static final String ZIP_DISPLAY_NAME = "Schematron ZIP file";

  private static final Logger LOGGER = LoggerFactory.getLogger (SchematronZipResolver.class);

  /**
   * Include resolver that only resolves entries of the ZIP file.
   */
  private static final class ZipIncludeResolver implements ISchematronIncludeResolver
  {
    private final InMemoryZipContent m_aZipContent;

    ZipIncludeResolver (@NonNull final InMemoryZipContent aZipContent)
    {
      m_aZipContent = aZipContent;
    }

    @NonNull
    public IReadableResource getResolvedSchematronResource (@NonNull @Nonempty final String sHref) throws IOException
    {
      // Only called by code that does not know the including resource
      throw new IOException ("Cannot resolve the Schematron include '" + sHref + "' without the including resource");
    }

    @Override
    @NonNull
    public IReadableResource getResolvedSchematronResource (@NonNull @Nonempty final String sHref,
                                                            @Nullable final IReadableResource aBaseResource) throws IOException
    {
      if (aBaseResource == null)
        return getResolvedSchematronResource (sHref);

      // Avoid any absolute URL or Windows drive
      if (sHref.indexOf (':') >= 0)
        throw new IOException ("The Schematron include '" + sHref + "' must be a relative path inside the ZIP file");

      final String sHrefUnified = FilenameHelper.getPathUsingUnixSeparator (sHref);
      final String sPath;
      if (sHrefUnified.startsWith ("/"))
      {
        // Relative to the ZIP root
        sPath = FilenameHelper.getCleanPath (sHrefUnified);
      }
      else
      {
        // Relative to the including resource. Its path is always absolute.
        String sBasePath = FilenameHelper.getPath (aBaseResource.getPath ());
        if (!StringHelper.endsWith (sBasePath, '/'))
          sBasePath += '/';
        sPath = FilenameHelper.getCleanPath (sBasePath + sHrefUnified);
      }

      final IReadableResource ret = m_aZipContent.getEntryAsResource (sPath);
      if (ret == null)
        throw new IOException ("The Schematron include '" +
                               sHref +
                               "' of '" +
                               aBaseResource.getPath () +
                               "' resolves to '" +
                               sPath +
                               "', which is not contained in the ZIP file");

      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Resolved Schematron include '" +
                      sHref +
                      "' of '" +
                      aBaseResource.getPath () +
                      "' to ZIP entry '" +
                      sPath +
                      "'");
      return ret;
    }
  }

  private long m_nMaxUnzippedSize = InMemoryZipContent.DEFAULT_MAX_UNZIPPED_SIZE;
  private int m_nMaxZipEntryCount = InMemoryZipContent.DEFAULT_MAX_ZIP_ENTRY_COUNT;

  public SchematronZipResolver ()
  {}

  /**
   * @return The maximum allowed unzipped size in bytes. Defaults to
   *         {@link InMemoryZipContent#DEFAULT_MAX_UNZIPPED_SIZE}.
   */
  @Nonnegative
  public final long getMaxUnzippedSize ()
  {
    return m_nMaxUnzippedSize;
  }

  /**
   * Set the maximum allowed unzipped size in bytes. This is a safeguard against ZIP bomb attacks.
   *
   * @param nMaxUnzippedSize
   *        The maximum unzipped size in bytes. Must be &gt; 0.
   * @return this for chaining
   */
  @NonNull
  public final SchematronZipResolver setMaxUnzippedSize (@Nonnegative final long nMaxUnzippedSize)
  {
    ValueEnforcer.isGT0 (nMaxUnzippedSize, "MaxUnzippedSize");
    m_nMaxUnzippedSize = nMaxUnzippedSize;
    return this;
  }

  /**
   * @return The maximum allowed number of entries of the ZIP file. Defaults to
   *         {@link InMemoryZipContent#DEFAULT_MAX_ZIP_ENTRY_COUNT}.
   */
  @Nonnegative
  public final int getMaxZipEntryCount ()
  {
    return m_nMaxZipEntryCount;
  }

  /**
   * Set the maximum allowed number of entries of the ZIP file. This is a safeguard against ZIP files
   * with a huge number of (small) entries, because all entries are kept in memory.
   *
   * @param nMaxZipEntryCount
   *        The maximum number of entries. Must be &gt; 0.
   * @return this for chaining
   */
  @NonNull
  public final SchematronZipResolver setMaxZipEntryCount (@Nonnegative final int nMaxZipEntryCount)
  {
    ValueEnforcer.isGT0 (nMaxZipEntryCount, "MaxZipEntryCount");
    m_nMaxZipEntryCount = nMaxZipEntryCount;
    return this;
  }

  /**
   * Resolve the Schematron from the already read ZIP content.
   *
   * @param aZipContent
   *        The content of the ZIP file. May not be <code>null</code>.
   * @param sMainPath
   *        The path of the main Schematron inside the ZIP file. "\" and "/" are both supported as
   *        separator; a leading "/" is optional. May neither be <code>null</code> nor empty.
   * @param aErrorList
   *        The error list to add errors and warnings to. May not be <code>null</code>.
   * @return The preprocessed, self-contained Schematron or <code>null</code> in case of an error.
   *         In this case the error list contains at least one error.
   */
  @Nullable
  public PSSchema getResolvedSchematron (@NonNull final InMemoryZipContent aZipContent,
                                         @NonNull @Nonempty final String sMainPath,
                                         @NonNull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aZipContent, "ZipContent");
    ValueEnforcer.notEmpty (sMainPath, "MainPath");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    final IReadableResource aMainRes = aZipContent.getEntryAsResource (sMainPath);
    if (aMainRes == null)
    {
      aErrorList.add (SingleError.builderError ()
                                 .errorText (ZIP_DISPLAY_NAME +
                                             " does not contain the main Schematron '" +
                                             InMemoryZipContent.getUnifiedPath (sMainPath) +
                                             "'")
                                 .build ());
      return null;
    }

    // Only the errors of this call are relevant for the result
    final ErrorList aLocalErrorList = new ErrorList ();
    final WrappedCollectingPSErrorHandler aErrorHandler = new WrappedCollectingPSErrorHandler (aLocalErrorList);
    try
    {
      // Read and resolve all includes
      final PSSchema aSchema = new PSReader (aMainRes, aErrorHandler, null).setSchematronIncludeResolver (new ZipIncludeResolver (aZipContent))
                                                                            .readSchema ();
      if (aLocalErrorList.containsNoError ())
      {
        // Resolve abstract patterns etc.
        final IPSQueryBinding aQueryBinding = PSQueryBindingRegistry.getQueryBindingOfNameOrThrow (aSchema.getQueryBinding ());
        final PSPreprocessor aPreprocessor = PSPreprocessor.createPreprocessorWithoutInformationLoss (aQueryBinding);
        final PSSchema aPreprocessedSchema = aPreprocessor.getForcedPreprocessedSchema (aSchema);
        if (aPreprocessedSchema == null)
        {
          aLocalErrorList.add (SingleError.builderError ()
                                          .errorFieldName (aMainRes.getPath ())
                                          .errorText ("Failed to preprocess the Schematron with query binding " +
                                                      aQueryBinding)
                                          .build ());
        }
        else
          if (aPreprocessedSchema.isValid (aErrorHandler))
          {
            aErrorList.addAll (aLocalErrorList);
            return aPreprocessedSchema;
          }
          else
            if (aLocalErrorList.containsNoError ())
            {
              aLocalErrorList.add (SingleError.builderError ()
                                              .errorFieldName (aMainRes.getPath ())
                                              .errorText ("The resolved Schematron is invalid")
                                              .build ());
            }
      }
    }
    catch (final SchematronException ex)
    {
      aLocalErrorList.add (SingleError.builderError ()
                                      .errorFieldName (aMainRes.getPath ())
                                      .errorText ("Failed to resolve the Schematron from the ZIP file: " +
                                                  ex.getMessage ())
                                      .linkedException (ex)
                                      .build ());
    }
    aErrorList.addAll (aLocalErrorList);
    return null;
  }

  /**
   * Read the ZIP file and resolve the Schematron in it.
   *
   * @param aZipIS
   *        The input stream to read the ZIP file from. May not be <code>null</code>. It is not
   *        closed by this method.
   * @param sMainPath
   *        The path of the main Schematron inside the ZIP file. May neither be <code>null</code>
   *        nor empty.
   * @param aErrorList
   *        The error list to add errors and warnings to. May not be <code>null</code>.
   * @return The preprocessed, self-contained Schematron or <code>null</code> in case of an error.
   *         In this case the error list contains at least one error.
   * @see #getResolvedSchematron(InMemoryZipContent, String, ErrorList)
   */
  @Nullable
  public PSSchema getResolvedSchematron (@NonNull final InputStream aZipIS,
                                         @NonNull @Nonempty final String sMainPath,
                                         @NonNull final ErrorList aErrorList)
  {
    final InMemoryZipContent aZipContent = InMemoryZipContent.readZip (aZipIS,
                                                                       m_nMaxUnzippedSize,
                                                                       m_nMaxZipEntryCount,
                                                                       ZIP_DISPLAY_NAME,
                                                                       aErrorList);
    if (aZipContent == null)
      return null;
    return getResolvedSchematron (aZipContent, sMainPath, aErrorList);
  }

  /**
   * Resolve the Schematron in the ZIP file.
   *
   * @param aZipBytes
   *        The bytes of the ZIP file. May not be <code>null</code>.
   * @param sMainPath
   *        The path of the main Schematron inside the ZIP file. May neither be <code>null</code>
   *        nor empty.
   * @param aErrorList
   *        The error list to add errors and warnings to. May not be <code>null</code>.
   * @return The preprocessed, self-contained Schematron or <code>null</code> in case of an error.
   *         In this case the error list contains at least one error.
   * @see #getResolvedSchematron(InMemoryZipContent, String, ErrorList)
   */
  @Nullable
  public PSSchema getResolvedSchematron (final byte @NonNull [] aZipBytes,
                                         @NonNull @Nonempty final String sMainPath,
                                         @NonNull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aZipBytes, "ZipBytes");
    return getResolvedSchematron (new NonBlockingByteArrayInputStream (aZipBytes), sMainPath, aErrorList);
  }

  /**
   * Serialise the passed Schematron to XML bytes in UTF-8, indented, with the Schematron namespace
   * as the default namespace and the prefixes <code>xsl</code>, <code>svrl</code> and those of all
   * <code>ns</code> elements.
   *
   * @param aSchema
   *        The Schematron to serialise, e.g. the result of
   *        {@link #getResolvedSchematron(InMemoryZipContent, String, ErrorList)}. May not be
   *        <code>null</code>.
   * @return The serialised Schematron. Never <code>null</code>.
   */
  public static byte @NonNull [] getSchematronAsBytes (@NonNull final PSSchema aSchema)
  {
    ValueEnforcer.notNull (aSchema, "Schema");

    final MapBasedNamespaceContext aNSCtx = new MapBasedNamespaceContext ();
    aNSCtx.addDefaultNamespaceURI (CSchematron.NAMESPACE_SCHEMATRON);
    aNSCtx.addMapping ("xsl", CSchematron.NAMESPACE_URI_XSL);
    aNSCtx.addMapping ("svrl", CSVRL.SVRL_NAMESPACE_URI);
    // Add all <ns> elements from schema as NS context
    for (final PSNS aItem : aSchema.getAllNSs ())
      aNSCtx.setMapping (aItem.getPrefix (), aItem.getUri ());

    final XMLWriterSettings aXWS = new XMLWriterSettings ().setIndent (EXMLSerializeIndent.INDENT_AND_ALIGN)
                                                           .setNamespaceContext (aNSCtx);
    final IMicroDocument aDoc = new MicroDocument ();
    aDoc.addChild (aSchema.getAsMicroElement ());
    final byte [] ret = MicroWriter.getNodeAsBytes (aDoc, aXWS);
    if (ret == null)
      throw new IllegalStateException ("Failed to serialise the Schematron");
    return ret;
  }
}
