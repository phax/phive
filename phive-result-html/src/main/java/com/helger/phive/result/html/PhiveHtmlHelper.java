/*
 * Copyright (C) 2026 Philip Helger (www.helger.com)
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
package com.helger.phive.result.html;

import java.nio.charset.StandardCharsets;
import java.time.OffsetDateTime;
import java.util.EnumMap;
import java.util.Locale;
import java.util.Map;
import java.util.function.BiFunction;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.location.ILocation;
import com.helger.base.string.StringHelper;
import com.helger.base.string.StringImplode;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.CommonsEnumMap;
import com.helger.collection.commons.ICommonsList;
import com.helger.datetime.format.PDTToString;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.level.IErrorLevel;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.text.locale.LocaleFormatter;
import com.helger.xml.microdom.IMicroDocument;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroDocument;
import com.helger.xml.microdom.MicroElement;

/**
 * A helper class that allows to heavily customize the creation of validation result list HTML.
 * Follows the same builder pattern as <code>JsonValidationResultListHelper</code> and
 * <code>XMLValidationResultListHelper</code>.
 *
 * @author Philip Helger
 */
public class PhiveHtmlHelper
{
  private Locale m_aDisplayLocale = Locale.US;
  private OffsetDateTime m_aValidationDT;
  private long m_nOverallDurationMillis = -1;
  private IValidationExecutorSet <?> m_aVES;
  private String m_sSourceData;

  private BiFunction <IError, Locale, String> m_aErrorTestExtractor;

  private final CommonsEnumMap <EPhiveHtmlLabel, String> m_aDefaultLabels;
  private final CommonsEnumMap <EPhiveHtmlLabel, String> m_aLabels;
  private final ICommonsList <String> m_aCssInlines = new CommonsArrayList <> ();
  private final ICommonsList <String> m_aCssLinks = new CommonsArrayList <> ();

  public PhiveHtmlHelper (@NonNull final Locale aDisplayLocale)
  {
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");
    m_aDisplayLocale = aDisplayLocale;
    if ("de".equals (aDisplayLocale.getLanguage ()))
      m_aDefaultLabels = EPhiveHtmlLabel.createLabelMapDE ();
    else
      m_aDefaultLabels = EPhiveHtmlLabel.createLabelMapEN ();
    m_aLabels = m_aDefaultLabels.getClone ();
  }

  private static boolean _isConsideredError (@NonNull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.ERROR);
  }

  private static boolean _isConsideredWarning (@NonNull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.WARN);
  }

  /**
   * Set the validation date and time when the validation execution started to "now".
   *
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper validationDateTimeNow ()
  {
    return validationDateTime (PDTFactory.getCurrentOffsetDateTimeMillisOnly ());
  }

  /**
   * Set the validation date and time when the validation execution started.
   *
   * @param a
   *        The date time to set. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper validationDateTime (@Nullable final OffsetDateTime a)
  {
    m_aValidationDT = a;
    return this;
  }

  /**
   * Set the overall duration of the validation in milliseconds. Use a value &lt; 0 to indicate "not
   * set" (the default). If not set, the overall duration will not be displayed.
   *
   * @param nMillis
   *        The overall duration in milliseconds. Use a negative value to indicate "not set".
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper overallDurationMillis (final long nMillis)
  {
    m_nOverallDurationMillis = nMillis;
    return this;
  }

  /**
   * Set the VES that was used to run the execution.
   *
   * @param a
   *        The VES to set. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper ves (@Nullable final IValidationExecutorSet <?> a)
  {
    m_aVES = a;
    return this;
  }

  /**
   * Set the source data (the validated document content) to be rendered at the bottom of the
   * report. Newlines are preserved. Each line will be individually addressable via a local HTML
   * anchor (e.g. <code>#L1</code>, <code>#L2</code>, etc.).
   *
   * @param sSourceData
   *        The source data text. May be <code>null</code> to not show source data.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper sourceData (@Nullable final String sSourceData)
  {
    m_sSourceData = sSourceData;
    return this;
  }

  /**
   * Set an optional function to extract the "test" expression (e.g. Schematron test) from an error.
   * Since the HTML module does not depend on ph-schematron, this must be provided externally if
   * test expressions should be included. Example:
   *
   * <pre>
   * helper.errorTestExtractor ( (error, locale) -&gt; error instanceof SVRLResourceError ? ((SVRLResourceError) error)
   *                                                                                                                .getTest ()
   *                                                                                   : null);
   * </pre>
   *
   * @param a
   *        The extractor function. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper errorTestExtractor (@Nullable final BiFunction <IError, Locale, String> a)
  {
    m_aErrorTestExtractor = a;
    return this;
  }

  /**
   * Set all label texts at once. The provided map is copied internally. Any labels not present in
   * the map will retain their English defaults.
   *
   * @param aLabels
   *        The map of labels to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper labels (@NonNull final Map <EPhiveHtmlLabel, String> aLabels)
  {
    ValueEnforcer.notNull (aLabels, "Labels");
    // Start with defaults, then overlay
    m_aLabels.setAll (m_aDefaultLabels);
    m_aLabels.putAll (aLabels);
    return this;
  }

  /**
   * Override a single label text.
   *
   * @param eLabel
   *        The label key. May not be <code>null</code>.
   * @param sText
   *        The text to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper label (@NonNull final EPhiveHtmlLabel eLabel, @NonNull final String sText)
  {
    ValueEnforcer.notNull (eLabel, "Label");
    ValueEnforcer.notNull (sText, "Text");
    m_aLabels.put (eLabel, sText);
    return this;
  }

  /**
   * Enable the built-in default stylesheet ({@link CPhiveHtmlCss#DEFAULT_STYLESHEET}). This
   * provides a clean, readable layout with pastel green/red coloring. The stylesheet is added as
   * inline CSS and will only be emitted when generating a full HTML document via
   * {@link #createHtmlDocument(ValidationResultList)}.
   *
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper useDefaultCSS ()
  {
    m_aCssInlines.add (0, CPhiveHtmlCss.DEFAULT_STYLESHEET);
    return this;
  }

  /**
   * Add inline CSS that will be included in a <code>&lt;style&gt;</code> element in the HTML head
   * when generating a full page.
   *
   * @param sCss
   *        The CSS text. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper addCssInline (@NonNull final String sCss)
  {
    ValueEnforcer.notNull (sCss, "Css");
    m_aCssInlines.add (sCss);
    return this;
  }

  /**
   * Add an external CSS stylesheet link that will be included as a <code>&lt;link&gt;</code>
   * element in the HTML head when generating a full page.
   *
   * @param sHref
   *        The URL of the CSS file. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhiveHtmlHelper addCssLink (@NonNull final String sHref)
  {
    ValueEnforcer.notNull (sHref, "Href");
    m_aCssLinks.add (sHref);
    return this;
  }

  @NonNull
  private static IMicroElement _createDiv (@NonNull final String @NonNull... aCssClasses)
  {
    final IMicroElement eDiv = new MicroElement ("div");
    eDiv.setAttribute ("class",
                       StringImplode.imploder ().separator (' ').source (aCssClasses).filterNonEmpty ().build ());
    return eDiv;
  }

  @NonNull
  private static IMicroElement _createSpan (@NonNull final String sCssClass, @NonNull final String sText)
  {
    final IMicroElement eSpan = new MicroElement ("span");
    eSpan.setAttribute ("class", sCssClass);
    eSpan.addText (sText);
    return eSpan;
  }

  @NonNull
  private static IMicroElement _createTh (@NonNull final String sText)
  {
    final IMicroElement eTh = new MicroElement ("th");
    eTh.addText (sText);
    return eTh;
  }

  @NonNull
  private static IMicroElement _createTd (@NonNull final String sCssClass, @Nullable final String sText)
  {
    final IMicroElement eTd = new MicroElement ("td");
    eTd.setAttribute ("class", sCssClass);
    if (sText != null)
      eTd.addText (sText);
    return eTd;
  }

  private void _addLabelValue (@NonNull final IMicroElement eParent,
                               @NonNull final String sLabel,
                               @NonNull final String sValue)
  {
    final IMicroElement eRow = new MicroElement ("div");
    eRow.addChild (_createSpan (CPhiveHtmlCss.CSS_LABEL, sLabel + ": "));
    eRow.addChild (_createSpan (CPhiveHtmlCss.CSS_VALUE, sValue));
    eParent.addChild (eRow);
  }

  private @NonNull String _getSeverityValue (@NonNull final IErrorLevel aErrorLevel,
                                             @NonNull final EnumMap <EPhiveHtmlLabel, String> aLabels)
  {
    if (aErrorLevel.isGE (EErrorLevel.ERROR))
      return aLabels.get (EPhiveHtmlLabel.SEVERITY_ERROR);
    if (aErrorLevel.isGE (EErrorLevel.WARN))
      return aLabels.get (EPhiveHtmlLabel.SEVERITY_WARNING);
    return aLabels.get (EPhiveHtmlLabel.SEVERITY_SUCCESS);
  }

  /**
   * Apply the validation result list as HTML content into the provided target element. This creates
   * the inner HTML content only (no <code>&lt;html&gt;</code>/<code>&lt;head&gt;</code>).
   *
   * @param aTarget
   *        The target HTML element (e.g. a <code>&lt;body&gt;</code> or <code>&lt;div&gt;</code>).
   *        May not be <code>null</code>.
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   */
  public void applyTo (@NonNull final IMicroElement aTarget, @NonNull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aTarget, "Target");
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");

    final EnumMap <EPhiveHtmlLabel, String> aLabels = m_aLabels;

    // Calculate overalls
    int nWarnings = 0;
    int nErrors = 0;
    boolean bValidationInterrupted = false;
    IErrorLevel aMostSevere = EErrorLevel.LOWEST;
    EExtendedValidity eWorstValidity = EExtendedValidity.VALID;

    for (final ValidationResult aVR : aValidationResultList)
    {
      if (aVR.isSkipped ())
      {
        bValidationInterrupted = true;
      }
      else
      {
        final boolean bIsValid = aVR.getErrorList ().containsNoError ();
        if (!bIsValid)
          eWorstValidity = EExtendedValidity.INVALID;
      }

      for (final IError aError : aVR.getErrorList ())
      {
        if (aError.getErrorLevel ().isGT (aMostSevere))
          aMostSevere = aError.getErrorLevel ();

        if (_isConsideredError (aError.getErrorLevel ()))
          nErrors++;
        else
          if (_isConsideredWarning (aError.getErrorLevel ()))
            nWarnings++;
      }
    }

    final boolean bOverallSuccess = eWorstValidity.isValid ();

    // Outer container
    final IMicroElement eContainer = _createDiv (CPhiveHtmlCss.CSS_RESULTS);

    // Title
    final IMicroElement eH1 = new MicroElement ("h1");
    eH1.addText (aLabels.get (EPhiveHtmlLabel.VALIDATION_RESULT));
    eContainer.addChild (eH1);

    // Creation timestamp
    if (m_aValidationDT != null)
    {
      final String sTimestamp = PDTToString.getAsString (m_aValidationDT, m_aDisplayLocale);
      final IMicroElement eCreatedAt = _createDiv (CPhiveHtmlCss.CSS_VALIDATED_AT);
      eCreatedAt.addChild (_createSpan (CPhiveHtmlCss.CSS_LABEL, aLabels.get (EPhiveHtmlLabel.VALIDATED_AT) + ": "));
      eCreatedAt.addChild (_createSpan (CPhiveHtmlCss.CSS_VALUE, sTimestamp));
      eContainer.addChild (eCreatedAt);
    }

    // VES info
    if (m_aVES != null)
    {
      final IValidationExecutorSetStatus aStatus = m_aVES.getStatus ();
      final IMicroElement eVes = _createDiv (CPhiveHtmlCss.CSS_VES,
                                             aStatus.isDeprecated () ? CPhiveHtmlCss.CSS_VES_DEPRECATED : "");
      final IMicroElement eVesH2 = new MicroElement ("h2");
      eVesH2.addText (aLabels.get (EPhiveHtmlLabel.VALIDATION_EXECUTOR_SET));
      eVes.addChild (eVesH2);
      _addLabelValue (eVes, aLabels.get (EPhiveHtmlLabel.VESID), m_aVES.getID ().getAsSingleID ());
      _addLabelValue (eVes, aLabels.get (EPhiveHtmlLabel.NAME), m_aVES.getDisplayName ());
      if (aStatus.isDeprecated ())
        _addLabelValue (eVes, aLabels.get (EPhiveHtmlLabel.DEPRECATED), aLabels.get (EPhiveHtmlLabel.TRUE));
      eContainer.addChild (eVes);
    }

    // Summary section
    {
      final IMicroElement eSummary = _createDiv (CPhiveHtmlCss.CSS_SUMMARY,
                                                 bOverallSuccess ? CPhiveHtmlCss.CSS_SUMMARY_SUCCESS
                                                                 : CPhiveHtmlCss.CSS_SUMMARY_FAILURE);
      final IMicroElement eSummaryH2 = new MicroElement ("h2");
      eSummaryH2.addText (aLabels.get (EPhiveHtmlLabel.OVERALL_RESULT));
      eSummary.addChild (eSummaryH2);

      _addLabelValue (eSummary,
                      aLabels.get (EPhiveHtmlLabel.OVERALL_RESULT),
                      bOverallSuccess ? aLabels.get (EPhiveHtmlLabel.SEVERITY_SUCCESS) : aLabels.get (
                                                                                                      EPhiveHtmlLabel.SEVERITY_ERROR));
      if (bValidationInterrupted)
        _addLabelValue (eSummary, aLabels.get (EPhiveHtmlLabel.INTERRUPTED), aLabels.get (EPhiveHtmlLabel.TRUE));
      _addLabelValue (eSummary,
                      aLabels.get (EPhiveHtmlLabel.HIGHEST_SEVERITY),
                      _getSeverityValue (aMostSevere, aLabels));
      _addLabelValue (eSummary, aLabels.get (EPhiveHtmlLabel.WARNINGS), Integer.toString (nWarnings));
      _addLabelValue (eSummary, aLabels.get (EPhiveHtmlLabel.ERRORS), Integer.toString (nErrors));
      if (m_nOverallDurationMillis >= 0)
        _addLabelValue (eSummary,
                        aLabels.get (EPhiveHtmlLabel.DURATION),
                        LocaleFormatter.getFormatted (m_nOverallDurationMillis, m_aDisplayLocale) +
                                                                aLabels.get (EPhiveHtmlLabel.MILLISECONDS_SUFFIX));
      eContainer.addChild (eSummary);
    }

    // Per-layer results
    int nLayerIndex = 0;
    for (final ValidationResult aVR : aValidationResultList)
    {
      nLayerIndex++;
      final IValidationArtefact aVA = aVR.getValidationArtefact ();
      final boolean bIsSkipped = aVR.isSkipped ();
      final boolean bIsValid = !bIsSkipped && aVR.getErrorList ().containsNoError ();

      final String sResultCssClass;
      if (bIsSkipped)
        sResultCssClass = CPhiveHtmlCss.CSS_RESULT_SKIPPED;
      else
        if (bIsValid)
          sResultCssClass = CPhiveHtmlCss.CSS_RESULT_SUCCESS;
        else
          sResultCssClass = CPhiveHtmlCss.CSS_RESULT_FAILURE;

      final IMicroElement eResult = _createDiv (CPhiveHtmlCss.CSS_RESULT, sResultCssClass);

      // Layer heading
      final IMicroElement eH3 = new MicroElement ("h3");
      eH3.addText (aLabels.get (EPhiveHtmlLabel.VALIDATION_LAYER) + " #" + nLayerIndex);
      eResult.addChild (eH3);

      // Artifact info
      _addLabelValue (eResult, aLabels.get (EPhiveHtmlLabel.ARTIFACT_TYPE), aVA.getValidationType ().getName ());
      _addLabelValue (eResult, aLabels.get (EPhiveHtmlLabel.ARTIFACT_PATH), aVA.getRuleResourcePath ());

      // Status
      if (bIsSkipped)
      {
        final IMicroElement eSkipped = _createSpan (CPhiveHtmlCss.CSS_VALUE, aLabels.get (EPhiveHtmlLabel.SKIPPED));
        eResult.addChild (eSkipped);
      }
      else
      {
        _addLabelValue (eResult,
                        aLabels.get (EPhiveHtmlLabel.OVERALL_RESULT),
                        bIsValid ? aLabels.get (EPhiveHtmlLabel.SEVERITY_SUCCESS) : aLabels.get (
                                                                                                 EPhiveHtmlLabel.SEVERITY_ERROR));
      }

      // Duration per layer
      {
        final IMicroElement eDuration = _createDiv (CPhiveHtmlCss.CSS_DURATION);
        eDuration.addChild (_createSpan (CPhiveHtmlCss.CSS_LABEL, aLabels.get (EPhiveHtmlLabel.DURATION) + ": "));
        eDuration.addChild (_createSpan (CPhiveHtmlCss.CSS_VALUE,
                                         LocaleFormatter.getFormatted (aVR.getDurationMS (), m_aDisplayLocale) +
                                                                  aLabels.get (EPhiveHtmlLabel.MILLISECONDS_SUFFIX)));
        eResult.addChild (eDuration);
      }

      // Error items table
      if (!bIsSkipped && aVR.getErrorList ().isNotEmpty ())
      {
        final boolean bHasTestColumn = m_aErrorTestExtractor != null;

        final IMicroElement eTable = new MicroElement ("table");
        eTable.setAttribute ("class", CPhiveHtmlCss.CSS_ITEMS);

        // Table header
        final IMicroElement eThead = eTable.addElement ("thead");
        final IMicroElement eHeaderRow = eThead.addElement ("tr");
        eHeaderRow.addChild (_createTh (aLabels.get (EPhiveHtmlLabel.SEVERITY)));
        eHeaderRow.addChild (_createTh (aLabels.get (EPhiveHtmlLabel.ERROR_ID)));
        eHeaderRow.addChild (_createTh (aLabels.get (EPhiveHtmlLabel.FIELD)));
        eHeaderRow.addChild (_createTh (aLabels.get (EPhiveHtmlLabel.LOCATION)));
        eHeaderRow.addChild (_createTh (aLabels.get (EPhiveHtmlLabel.ERROR_TEXT)));
        if (bHasTestColumn)
          eHeaderRow.addChild (_createTh (aLabels.get (EPhiveHtmlLabel.TEST)));

        // Table body
        final IMicroElement eTbody = eTable.addElement ("tbody");
        for (final IError aError : aVR.getErrorList ())
        {
          final String sItemCssClass;
          if (_isConsideredError (aError.getErrorLevel ()))
            sItemCssClass = CPhiveHtmlCss.CSS_ITEM_ERROR;
          else
            if (_isConsideredWarning (aError.getErrorLevel ()))
              sItemCssClass = CPhiveHtmlCss.CSS_ITEM_WARNING;
            else
              sItemCssClass = CPhiveHtmlCss.CSS_ITEM_SUCCESS;

          final IMicroElement eRow = new MicroElement ("tr");
          eRow.setAttribute ("class", CPhiveHtmlCss.CSS_ITEM + ' ' + sItemCssClass);

          // Error level
          final String sLevel = _getSeverityValue (aError.getErrorLevel (), aLabels);
          eRow.addChild (_createTd (CPhiveHtmlCss.CSS_ERROR_LEVEL, sLevel));

          // Error ID
          eRow.addChild (_createTd (CPhiveHtmlCss.CSS_ERROR_ID, aError.getErrorID ()));

          // Field name
          eRow.addChild (_createTd (CPhiveHtmlCss.CSS_ERROR_FIELD, aError.getErrorFieldName ()));

          // Location
          {
            String sLocation = null;
            if (aError.hasErrorLocation ())
            {
              final ILocation aLoc = aError.getErrorLocation ();
              final StringBuilder aSB = new StringBuilder ();
              if (aLoc.hasResourceID ())
                aSB.append (aLoc.getResourceID ());
              if (aLoc.hasLineNumber ())
              {
                if (aSB.length () > 0)
                  aSB.append (':');
                aSB.append (aLoc.getLineNumber ());
                if (aLoc.hasColumnNumber ())
                  aSB.append (':').append (aLoc.getColumnNumber ());
              }
              sLocation = aSB.toString ();
            }
            eRow.addChild (_createTd (CPhiveHtmlCss.CSS_ERROR_LOCATION, sLocation));
          }

          // Error text
          eRow.addChild (_createTd (CPhiveHtmlCss.CSS_ERROR_TEXT, aError.getErrorText (m_aDisplayLocale)));

          // Test expression (optional)
          if (bHasTestColumn)
          {
            final String sTest = m_aErrorTestExtractor.apply (aError, m_aDisplayLocale);
            eRow.addChild (_createTd (CPhiveHtmlCss.CSS_ERROR_TEST, sTest));
          }

          eTbody.addChild (eRow);
        }
        eResult.addChild (eTable);
      }

      eContainer.addChild (eResult);
    }

    // Overall duration at bottom (only if set)
    if (m_nOverallDurationMillis >= 0)
    {
      final IMicroElement eDuration = _createDiv (CPhiveHtmlCss.CSS_DURATION);
      eDuration.addChild (_createSpan (CPhiveHtmlCss.CSS_LABEL, aLabels.get (EPhiveHtmlLabel.OVERALL_DURATION) + ": "));
      eDuration.addChild (_createSpan (CPhiveHtmlCss.CSS_VALUE,
                                       LocaleFormatter.getFormatted (m_nOverallDurationMillis, m_aDisplayLocale) +
                                                                aLabels.get (EPhiveHtmlLabel.MILLISECONDS_SUFFIX)));
      eContainer.addChild (eDuration);
    }

    // Source data section
    if (StringHelper.isNotEmpty (m_sSourceData))
    {
      final IMicroElement eSource = _createDiv (CPhiveHtmlCss.CSS_SOURCE);

      final IMicroElement eSourceH2 = new MicroElement ("h2");
      eSourceH2.addText (aLabels.get (EPhiveHtmlLabel.SOURCE_DATA));
      eSource.addChild (eSourceH2);

      final IMicroElement eTable = new MicroElement ("table");
      eTable.setAttribute ("class", CPhiveHtmlCss.CSS_SOURCE_TABLE);

      final IMicroElement eTbody = eTable.addElement ("tbody");
      final String [] aLines = StringHelper.getExplodedArray ('\n', m_sSourceData);
      for (int i = 0; i < aLines.length; i++)
      {
        final int nLineNumber = i + 1;
        final String sAnchorID = "L" + nLineNumber;

        final IMicroElement eRow = eTbody.addElement ("tr");
        eRow.setAttribute ("id", sAnchorID);

        // Line number cell with self-referencing anchor
        final IMicroElement eTdNum = eRow.addElement ("td");
        eTdNum.setAttribute ("class", CPhiveHtmlCss.CSS_SOURCE_LINE_NUMBER);
        final IMicroElement eAnchor = eTdNum.addElement ("a");
        eAnchor.setAttribute ("href", "#" + sAnchorID);
        eAnchor.addText (Integer.toString (nLineNumber));

        // Line content cell
        final IMicroElement eTdContent = eRow.addElement ("td");
        eTdContent.setAttribute ("class", CPhiveHtmlCss.CSS_SOURCE_LINE_CONTENT);
        eTdContent.addText (aLines[i]);
      }

      eSource.addChild (eTable);
      eContainer.addChild (eSource);
    }

    // Footer
    {
      final IMicroElement eFooter = _createDiv (CPhiveHtmlCss.CSS_FOOTER);
      eFooter.addText (aLabels.get (EPhiveHtmlLabel.FOOTER_PREFIX));
      final IMicroElement eLink = eFooter.addElement ("a");
      eLink.setAttribute ("href", "https://github.com/phax/phive");
      eLink.addText ("phive");
      eFooter.addText (aLabels.get (EPhiveHtmlLabel.FOOTER_SUFFIX));
      eContainer.addChild (eFooter);
    }

    aTarget.addChild (eContainer);
  }

  /**
   * Create a complete standalone HTML page with the validation results. Includes
   * <code>&lt;!DOCTYPE html&gt;</code>, <code>&lt;html&gt;</code>, <code>&lt;head&gt;</code>
   * (containing charset, title, CSS), and <code>&lt;body&gt;</code>.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @return The complete HTML document. Never <code>null</code>.
   */
  @NonNull
  public IMicroDocument createHtmlDocument (@NonNull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");

    final IMicroDocument aDoc = new MicroDocument ();
    final IMicroElement eHtml = aDoc.addElement ("html");
    eHtml.setAttribute ("lang", m_aDisplayLocale.getLanguage ());

    // Head
    final IMicroElement eHead = eHtml.addElement ("head");
    {
      final IMicroElement eMeta = eHead.addElement ("meta");
      eMeta.setAttribute ("charset", StandardCharsets.UTF_8.name ());
    }
    {
      final IMicroElement eTitle = eHead.addElement ("title");
      eTitle.addText (m_aLabels.get (EPhiveHtmlLabel.VALIDATION_RESULT));
    }

    // CSS links
    for (final String sHref : m_aCssLinks)
    {
      final IMicroElement eLink = eHead.addElement ("link");
      eLink.setAttribute ("rel", "stylesheet");
      eLink.setAttribute ("href", sHref);
    }

    // Inline CSS
    for (final String sCss : m_aCssInlines)
    {
      final IMicroElement eStyle = eHead.addElement ("style");
      eStyle.addText (sCss);
    }

    // Body
    final IMicroElement eBody = eHtml.addElement ("body");
    applyTo (eBody, aValidationResultList);

    return aDoc;
  }
}
