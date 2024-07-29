/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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

import java.util.Locale;
import java.util.Map;
import java.util.function.Consumer;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.transform.dom.DOMSource;
import javax.xml.xpath.XPath;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableObject;
import com.helger.commons.collection.impl.CommonsHashMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.equals.EqualsHelper;
import com.helger.commons.error.IError;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.level.IErrorLevel;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.location.SimpleLocation;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;
import com.helger.commons.wrapper.Wrapper;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.IValidationType;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.execute.AbstractValidationExecutor;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.schematron.AbstractSchematronResource;
import com.helger.schematron.SchematronResourceHelper;
import com.helger.schematron.pure.SchematronResourcePure;
import com.helger.schematron.pure.errorhandler.WrappedCollectingPSErrorHandler;
import com.helger.schematron.sch.SchematronResourceSCH;
import com.helger.schematron.schxslt.xslt2.SchematronResourceSchXslt_XSLT2;
import com.helger.schematron.svrl.SVRLFailedAssert;
import com.helger.schematron.svrl.SVRLHelper;
import com.helger.schematron.svrl.SVRLMarshaller;
import com.helger.schematron.svrl.SVRLResourceError.SVRLErrorBuilder;
import com.helger.schematron.svrl.SVRLSuccessfulReport;
import com.helger.schematron.svrl.jaxb.SchematronOutputType;
import com.helger.schematron.xslt.SchematronResourceXSLT;
import com.helger.xml.XMLHelper;
import com.helger.xml.namespace.IIterableNamespaceContext;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.read.DOMReaderSettings;
import com.helger.xml.serialize.write.XMLWriter;
import com.helger.xml.transform.WrappedCollectingTransformErrorListener;
import com.helger.xml.xpath.XPathExpressionHelper;
import com.helger.xml.xpath.XPathHelper;

/**
 * Implementation of {@link IValidationExecutor} for Schematron validation.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSchematron extends
                                          AbstractValidationExecutor <IValidationSourceXML, ValidationExecutorSchematron>
                                          implements
                                          IValidationExecutor.ICacheSupport
{
  public static final String IN_MEMORY_RESOURCE_NAME = "in-memory-data";

  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutorSchematron.class);

  private final String m_sPrerequisiteXPath;
  private final MapBasedNamespaceContext m_aNamespaceContext;
  private boolean m_bCacheSchematron = ICacheSupport.DEFAULT_CACHE;
  private ICommonsMap <String, CustomErrorDetails> m_aCustomErrorDetails;

  public ValidationExecutorSchematron (@Nonnull final IValidationArtefact aValidationArtefact,
                                       @Nullable final String sPrerequisiteXPath,
                                       @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    super (aValidationArtefact);
    ValueEnforcer.isTrue (aValidationArtefact.getValidationArtefactType ().isSchematron (),
                          "Artifact is not a Schematron");
    m_sPrerequisiteXPath = sPrerequisiteXPath;
    // Create a copy on demand
    m_aNamespaceContext = aNamespaceContext == null ? null : new MapBasedNamespaceContext (aNamespaceContext);
  }

  /**
   * @return The optional prerequisite XPath expression, that needs to evaluate
   *         to boolean:true before the Schematron is applied. May be
   *         <code>null</code>.
   */
  @Nullable
  public final String getPrerequisiteXPath ()
  {
    return m_sPrerequisiteXPath;
  }

  /**
   * @return The namespace context to be used for creating error messages. May
   *         be <code>null</code>.
   */
  @Nullable
  @ReturnsMutableObject
  public final MapBasedNamespaceContext getNamespaceContext ()
  {
    return m_aNamespaceContext == null ? null : m_aNamespaceContext.getClone ();
  }

  public final boolean isCacheArtefact ()
  {
    return m_bCacheSchematron;
  }

  @Nonnull
  public final ValidationExecutorSchematron setCacheArtefact (final boolean bCacheArtefact)
  {
    m_bCacheSchematron = bCacheArtefact;
    return this;
  }

  public void ensureItemIsInCache ()
  {
    if (m_bCacheSchematron)
    {
      final AbstractSchematronResource aRes = _createSchematronResource (null, new ErrorList (), x -> {});
      aRes.setUseCache (true);
      aRes.isValidSchematron ();
      LOGGER.debug ("ValidationExecutorSchematron " +
                    getValidationArtefact ().getRuleResourcePath () +
                    " is now in the cache");
    }
  }

  /**
   * Add a specific custom error level, that overrides the error level defined
   * in the Schematron itself.
   *
   * @param sErrorID
   *        The error ID, must match the Schematron assertion ID
   * @param aErrorDetails
   *        The new error details to use. May be more or less severe than the
   *        original one.
   * @return this for chaining
   * @see #addCustomErrorDetails(Map)
   */
  @Nonnull
  public final ValidationExecutorSchematron addCustomErrorDetail (@Nonnull @Nonempty final String sErrorID,
                                                                  @Nonnull final CustomErrorDetails aErrorDetails)
  {
    ValueEnforcer.notEmpty (sErrorID, "ErrorID");
    ValueEnforcer.notNull (aErrorDetails, "ErrorDetails");

    if (m_aCustomErrorDetails == null)
      m_aCustomErrorDetails = new CommonsHashMap <> ();
    m_aCustomErrorDetails.put (sErrorID, aErrorDetails);
    return this;
  }

  /**
   * Add multiple specific custom error levels, that overrides the error level
   * defined in the Schematron itself.
   *
   * @param aCustomErrorLevels
   *        The map from error ID (the Schematron assertion ID) to the new error
   *        level to use. May be <code>null</code>.
   * @return this for chaining
   * @see #addCustomErrorDetail(String, CustomErrorDetails)
   */
  @Nonnull
  public final ValidationExecutorSchematron addCustomErrorDetails (@Nullable final Map <String, ? extends CustomErrorDetails> aCustomErrorLevels)
  {
    if (aCustomErrorLevels != null && !aCustomErrorLevels.isEmpty ())
    {
      if (m_aCustomErrorDetails == null)
        m_aCustomErrorDetails = new CommonsHashMap <> ();
      m_aCustomErrorDetails.putAll (aCustomErrorLevels);
    }
    return this;
  }

  @Nonnull
  private AbstractSchematronResource _createSchematronResource (@Nullable final Locale aLocale,
                                                                @Nonnull final ErrorList aErrorList,
                                                                @Nonnull final Consumer <ESchematronOutput> aSpecialOutputHdl)
  {
    final IValidationArtefact aArtefact = getValidationArtefact ();

    // get the Schematron resource to be used for this validation artefact
    final IReadableResource aSCHRes = aArtefact.getRuleResource ();

    final IValidationType aVT = aArtefact.getValidationArtefactType ();
    if (aVT == EValidationType.SCHEMATRON_PURE)
    {
      final SchematronResourcePure aPureSCH = new SchematronResourcePure (aSCHRes);
      aPureSCH.setErrorHandler (new WrappedCollectingPSErrorHandler (aErrorList));
      // Don't cache to avoid that errors in the Schematron are hidden on
      // consecutive calls!
      return aPureSCH;
    }
    if (aVT == EValidationType.SCHEMATRON_SCH)
    {
      final SchematronResourceSCH aSCHSCH = new SchematronResourceSCH (aSCHRes);
      aSCHSCH.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
      if (aLocale != null && StringHelper.hasText (aLocale.getLanguage ()))
        aSCHSCH.setLanguageCode (aLocale.getLanguage ());
      return aSCHSCH;
    }
    if (aVT == EValidationType.SCHEMATRON_SCHXSLT)
    {
      final SchematronResourceSchXslt_XSLT2 aSCHSCH = new SchematronResourceSchXslt_XSLT2 (aSCHRes);
      aSCHSCH.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
      if (aLocale != null && StringHelper.hasText (aLocale.getLanguage ()))
        aSCHSCH.setLanguageCode (aLocale.getLanguage ());
      return aSCHSCH;
    }
    if (aVT == EValidationType.SCHEMATRON_XSLT)
    {
      final SchematronResourceXSLT aSCHXSLT = new SchematronResourceXSLT (aSCHRes);
      aSCHXSLT.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
      return aSCHXSLT;
    }
    if (aVT == EValidationType.SCHEMATRON_OIOUBL)
    {
      final SchematronResourceXSLT aSCHXSLT = new SchematronResourceXSLT (aSCHRes);
      aSCHXSLT.setErrorListener (new WrappedCollectingTransformErrorListener (aErrorList));
      // Special output layout
      aSpecialOutputHdl.accept (ESchematronOutput.OIOUBL);
      return aSCHXSLT;
    }
    throw new IllegalStateException ("Unsupported Schematron validation type: " + aVT);
  }

  @Nonnull
  public ValidationResult applyValidation (@Nonnull final IValidationSourceXML aSource, @Nullable final Locale aLocale)
  {
    ValueEnforcer.notNull (aSource, "Source");

    final IValidationArtefact aArtefact = getValidationArtefact ();

    // Get source as XML DOM Node
    Node aNode = null;
    try
    {
      aNode = SchematronResourceHelper.getNodeOfSource (aSource.getAsTransformSource (), new DOMReaderSettings ());
    }
    catch (final Exception ex)
    {
      throw new IllegalStateException ("For Schematron validation to work, the source must be valid XML which it is not.",
                                       ex);
    }
    if (StringHelper.hasText (m_sPrerequisiteXPath))
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Using Schematron prerequisite path '" + m_sPrerequisiteXPath + "'");

      // Check if the artefact can be applied on the given document by
      // checking the prerequisite XPath
      final XPath aXPathContext = XPathHelper.createNewXPath ();
      if (m_aNamespaceContext != null)
        aXPathContext.setNamespaceContext (m_aNamespaceContext);
      try
      {
        final Boolean aResult = XPathExpressionHelper.evalXPathToBoolean (aXPathContext,
                                                                          m_sPrerequisiteXPath,
                                                                          XMLHelper.getOwnerDocument (aNode));
        if (aResult != null && !aResult.booleanValue ())
        {
          LOGGER.info ("Ignoring validation artefact " +
                       aArtefact.getRuleResourcePath () +
                       " because the prerequisite XPath expression '" +
                       m_sPrerequisiteXPath +
                       "' is not fulfilled.");
          return ValidationResult.createIgnoredResult (aArtefact);
        }
      }
      catch (final IllegalArgumentException ex)
      {
        // Catch errors in prerequisite XPaths - most likely because of
        // missing namespace prefixes...
        final String sErrorMsg = "Failed to verify if validation artefact " +
                                 aArtefact.getRuleResourcePath () +
                                 " matches the prerequisite XPath expression '" +
                                 m_sPrerequisiteXPath +
                                 "' - ignoring validation artefact.";
        LOGGER.error (sErrorMsg, ex);
        return new ValidationResult (aArtefact,
                                     new ErrorList (SingleError.builderError ()
                                                               .errorText (sErrorMsg)
                                                               .linkedException (ex)
                                                               .build ()));
      }
    }
    // No prerequisite or prerequisite matched
    final ErrorList aErrorList = new ErrorList ();
    final Wrapper <ESchematronOutput> aOutput = new Wrapper <> (ESchematronOutput.SVRL);
    final AbstractSchematronResource aSCH = _createSchematronResource (aLocale, aErrorList, aOutput::set);

    // Don't cache to avoid that errors in the Schematron are hidden on
    // consecutive calls!
    aSCH.setUseCache (m_bCacheSchematron);
    try
    {
      // Main application of Schematron
      final Document aDoc = aSCH.applySchematronValidation (new DOMSource (aNode));

      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("SVRL: " + XMLWriter.getNodeAsString (aDoc));
      switch (aOutput.get ())
      {
        case SVRL:
        {
          final SchematronOutputType aSVRL = aDoc == null || aDoc.getDocumentElement () == null ? null
                                                                                                : new SVRLMarshaller ().read (aDoc);
          if (aSVRL != null)
          {
            // Valid Schematron - interpret result

            // Convert failed asserts and successful reports to error objects
            for (final SVRLFailedAssert aFailedAssert : SVRLHelper.getAllFailedAssertions (aSVRL))
              aErrorList.add (aFailedAssert.getAsResourceError (aSource.getSystemID ()));
            for (final SVRLSuccessfulReport aSuccessfulReport : SVRLHelper.getAllSuccessfulReports (aSVRL))
              aErrorList.add (aSuccessfulReport.getAsResourceError (aSource.getSystemID ()));
          }
          else
          {
            // Schematron does not create SVRL!
            LOGGER.warn ("Failed to read the result as SVRL:" +
                         (aDoc != null ? "\n" + XMLWriter.getNodeAsString (aDoc) : " no XML Document created"));
            aErrorList.add (SingleError.builderError ()
                                       .errorLocation (aArtefact.getRuleResourcePath ())
                                       .errorText ("Internal error interpreting Schematron result")
                                       .errorFieldName (aDoc != null ? XMLWriter.getNodeAsString (aDoc) : null)
                                       .build ());
          }
          break;
        }
        case OIOUBL:
        {
          if (aDoc != null && aDoc.getDocumentElement () != null)
          {
            // interpret result
            /**
             * <pre>
             * <Schematron>
             *   <Information>Checking OIOUBL-2.02 Invoice, 2017-09-15, Version 1.9.0.34429</Information>
             *   <Error context="/Invoice">
             *     <Pattern>cbc:UBLVersionID = '2.0'</Pattern>
             *     <Description>[F-LIB001] Invalid UBLVersionID. Must be '2.0'</Description>
             *     <Xpath>/Invoice[1]</Xpath>
             *   </Error>
             * </Schematron>
             * </pre>
             */

            for (final Element eError : XMLHelper.getChildElementIterator (aDoc.getDocumentElement (), "Error"))
            {
              // final String sContext = eError.getAttribute ("context");
              final String sPattern = XMLHelper.getFirstChildElementOfName (eError, "Pattern").getTextContent ();
              final String sDescription = XMLHelper.getFirstChildElementOfName (eError, "Description")
                                                   .getTextContent ();
              final String sXPath = XMLHelper.getFirstChildElementOfName (eError, "Xpath").getTextContent ();
              aErrorList.add (new SVRLErrorBuilder (sPattern).errorLocation (new SimpleLocation (aSource.getSystemID ()))
                                                             .errorText (sDescription)
                                                             .errorFieldName (sXPath)
                                                             .build ());
            }
          }
          else
          {
            // Schematron does not create SVRL!
            LOGGER.warn ("Failed to read the result as OIOUBL result:" +
                         (aDoc != null ? "\n" + XMLWriter.getNodeAsString (aDoc) : " no XML Document created"));
            aErrorList.add (SingleError.builderError ()
                                       .errorLocation (aArtefact.getRuleResourcePath ())
                                       .errorText ("Internal error - no Schematron output created for OIOUBL")
                                       .build ());
          }
          break;
        }
        default:
          throw new IllegalStateException ("Unsupported output type");
      }
    }
    catch (final Exception ex)
    {
      // Usually an error in the Schematron
      aErrorList.add (SingleError.builderError ()
                                 .errorLocation (aArtefact.getRuleResourcePath ())
                                 .errorText (ex.getMessage ())
                                 .linkedException (ex)
                                 .build ());
    }
    // Apply custom levels
    if (m_aCustomErrorDetails != null && aErrorList.isNotEmpty ())
    {
      final ErrorList aOldErrorList = aErrorList.getClone ();
      aErrorList.clear ();
      for (final IError aCurError : aOldErrorList)
      {
        final String sErrorID = aCurError.getErrorID ();
        final CustomErrorDetails aCustomErrorDetails = m_aCustomErrorDetails.get (sErrorID);
        if (aCustomErrorDetails != null)
        {
          final IErrorLevel aErrorLevel = aCustomErrorDetails.getErrorLevel ();
          if (LOGGER.isDebugEnabled ())
            LOGGER.debug ("Changing error level of '" +
                          sErrorID +
                          "' from " +
                          aCurError.getErrorLevel ().getNumericLevel () +
                          " to " +
                          aErrorLevel +
                          " (" +
                          aErrorLevel.getNumericLevel () +
                          ")");

          // Change error level and error text
          aErrorList.add (SingleError.builder (aCurError)
                                     .errorLevel (aErrorLevel)
                                     .errorText (aCustomErrorDetails.getWithErrorTextPrefixAndSuffixApplied (aCurError.getErrorText (Locale.ROOT)))
                                     .build ());
        }
        else
        {
          // No change
          aErrorList.add (aCurError);
        }
      }
    }
    return new ValidationResult (aArtefact, aErrorList);
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (!super.equals (o))
      return false;
    final ValidationExecutorSchematron rhs = (ValidationExecutorSchematron) o;
    return m_bCacheSchematron == rhs.m_bCacheSchematron &&
           EqualsHelper.equals (m_sPrerequisiteXPath, rhs.m_sPrerequisiteXPath) &&
           EqualsHelper.equals (m_aNamespaceContext, rhs.m_aNamespaceContext) &&
           EqualsHelper.equals (m_aCustomErrorDetails, rhs.m_aCustomErrorDetails);
  }

  @Override
  public int hashCode ()
  {
    return HashCodeGenerator.getDerived (super.hashCode ())
                            .append (m_bCacheSchematron)
                            .append (m_sPrerequisiteXPath)
                            .append (m_aNamespaceContext)
                            .append (m_aCustomErrorDetails)
                            .getHashCode ();
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ())
                            .append ("CacheSchematron", m_bCacheSchematron)
                            .appendIfNotNull ("PrerequisiteXPath", m_sPrerequisiteXPath)
                            .appendIfNotNull ("NamespaceContext", m_aNamespaceContext)
                            .appendIfNotNull ("CustomErrorLevels", m_aCustomErrorDetails)
                            .getToString ();
  }

  /**
   * Create a new instance for a single resource that uses Pure Schematron
   * validation.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be
   *        <code>null</code>.
   * @param aNamespaceContext
   *        An optional namespace context for nice error messages. May be
   *        <code>null</code>.
   * @return A new instance and never <code>null</code>.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorSchematron createPure (@Nonnull final IReadableResource aRes,
                                                         @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE, aRes),
                                             null,
                                             aNamespaceContext);
  }

  /**
   * Create a new instance for a single resource that uses the simple Schematron
   * validation. This is discouraged for speed reasons. It is recommended to
   * precompile the SCH to XSLT at build time and than use the
   * {@link #createXSLT(IReadableResource, IIterableNamespaceContext)} instead.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be
   *        <code>null</code>.
   * @param aNamespaceContext
   *        An optional namespace context for nice error messages. May be
   *        <code>null</code>.
   * @return A new instance and never <code>null</code>.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorSchematron createSCH (@Nonnull final IReadableResource aRes,
                                                        @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_SCH, aRes),
                                             null,
                                             aNamespaceContext);
  }

  /**
   * Create a new instance for a single resource that uses the precompiled XSLT
   * SchXslt Schematron validation.
   *
   * @param aRes
   *        The resource pointing to the Schematron rules. May not be
   *        <code>null</code>.
   * @param aNamespaceContext
   *        An optional namespace context for nice error messages. May be
   *        <code>null</code>.
   * @return A new instance and never <code>null</code>.
   * @since 7.1.2
   */
  @Nonnull
  public static ValidationExecutorSchematron createSchXslt (@Nonnull final IReadableResource aRes,
                                                            @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_SCHXSLT, aRes),
                                             null,
                                             aNamespaceContext);
  }

  /**
   * Create a new instance for a single resource that uses the precompiled XSLT
   * ISO Schematron validation.
   *
   * @param aRes
   *        The resource pointing to the XSLT rules. May not be
   *        <code>null</code>.
   * @param aNamespaceContext
   *        An optional namespace context for nice error messages. May be
   *        <code>null</code>.
   * @return A new instance and never <code>null</code>.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorSchematron createXSLT (@Nonnull final IReadableResource aRes,
                                                         @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return createXSLT (aRes, null, aNamespaceContext);
  }

  /**
   * Create a new instance for a single resource that uses the precompiled XSLT
   * Schematron validation.
   *
   * @param aRes
   *        The resource pointing to the XSLT rules. May not be
   *        <code>null</code>.
   * @param sPrerequisiteXPath
   *        An optional XPath expression that needs to be fulfilled in the
   *        source document to run this validation rules. This can increase the
   *        execution speed. May be <code>null</code>.
   * @param aNamespaceContext
   *        An optional namespace context for nice error messages. May be
   *        <code>null</code>.
   * @return A new instance and never <code>null</code>.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorSchematron createXSLT (@Nonnull final IReadableResource aRes,
                                                         @Nullable final String sPrerequisiteXPath,
                                                         @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT, aRes),
                                             sPrerequisiteXPath,
                                             aNamespaceContext);
  }

  /**
   * Create a new instance for a single resource that uses the special OIOUBL
   * Schematron validation.
   *
   * @param aRes
   *        The resource pointing to the OIOUBL rules. May not be
   *        <code>null</code>.
   * @param aNamespaceContext
   *        An optional namespace context for nice error messages. May be
   *        <code>null</code>.
   * @return A new instance and never <code>null</code>.
   * @since 6.0.4
   */
  @Nonnull
  public static ValidationExecutorSchematron createOIOUBL (@Nonnull final IReadableResource aRes,
                                                           @Nullable final IIterableNamespaceContext aNamespaceContext)
  {
    return new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_OIOUBL, aRes),
                                             null,
                                             aNamespaceContext);
  }
}
