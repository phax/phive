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
package com.helger.phive.result.pdf;

import java.io.File;
import java.io.OutputStream;
import java.time.ZonedDateTime;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.BiFunction;

import org.apache.pdfbox.pdmodel.common.PDRectangle;
import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.annotation.WillClose;
import com.helger.annotation.style.OverrideOnDemand;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.location.ILocation;
import com.helger.base.string.StringHelper;
import com.helger.base.string.StringHex;
import com.helger.base.string.StringReplace;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.CommonsEnumMap;
import com.helger.collection.commons.ICommonsList;
import com.helger.datetime.format.PDTToString;
import com.helger.diagnostics.error.IError;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.level.IErrorLevel;
import com.helger.font.kurinto.mono.EFontResourceKurintoMono;
import com.helger.font.open_sans.EFontResourceOpenSans;
import com.helger.pdflayout.PDFCreationException;
import com.helger.pdflayout.PageLayoutPDF;
import com.helger.pdflayout.base.EPLPlaceholder;
import com.helger.pdflayout.base.IPLRenderableObject;
import com.helger.pdflayout.base.PLColor;
import com.helger.pdflayout.base.PLPageSet;
import com.helger.pdflayout.element.box.PLBox;
import com.helger.pdflayout.element.hbox.PLHBox;
import com.helger.pdflayout.element.link.PLExternalLink;
import com.helger.pdflayout.element.special.PLSpacerX;
import com.helger.pdflayout.element.table.EPLTableGridType;
import com.helger.pdflayout.element.table.PLTable;
import com.helger.pdflayout.element.table.PLTableCell;
import com.helger.pdflayout.element.text.PLText;
import com.helger.pdflayout.element.vbox.PLVBox;
import com.helger.pdflayout.pdfa.EPdfALevel;
import com.helger.pdflayout.pdfa.PdfAssociatedFile;
import com.helger.pdflayout.spec.BorderStyleSpec;
import com.helger.pdflayout.spec.EHorzAlignment;
import com.helger.pdflayout.spec.FontSpec;
import com.helger.pdflayout.spec.IPLMissingCodePointCallback;
import com.helger.pdflayout.spec.MarginSpec;
import com.helger.pdflayout.spec.PreloadFont;
import com.helger.pdflayout.spec.WidthSpec;
import com.helger.pdflayout.tagging.EPLStructureRole;
import com.helger.phive.api.CPhiveVersion;
import com.helger.phive.api.artefact.IValidationArtefact;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.result.ValidationSummary;
import com.helger.phive.api.result.label.EPhiveResultLabel;
import com.helger.phive.api.severity.PhiveSeverityHelper;
import com.helger.phive.api.validity.EExtendedValidity;
import com.helger.text.locale.LocaleFormatter;

/**
 * A helper class that allows to heavily customise the creation of validation result list PDFs. It
 * follows the same builder pattern and layout as <code>PhiveHtmlHelper</code> and uses the same
 * labels ({@link EPhiveResultLabel}).
 * <p>
 * All fonts are embedded (Open Sans and Kurinto Mono by default), so that PDF/A can be created via
 * {@link #pdfALevel(EPdfALevel)}.
 * </p>
 * <p>
 * The styling can be customised in a subclass: override {@link #getPreloadFont(EPhivePdfFontType)},
 * {@link #getColor(EPhivePdfColor)} or {@link #getFontSpec(EPhivePdfTextStyle)} for fonts and
 * colours, the <code>get...</code> methods for the page layout, and the <code>create...</code>
 * methods to change the layout of single sections.
 * </p>
 *
 * @author Philip Helger
 * @since 12.4.0
 */
public class PhivePdfHelper
{
  /** By default the footer with the link to phive is shown */
  public static final boolean DEFAULT_SHOW_FOOTER = true;
  /** By default no PDF/UA is created */
  public static final boolean DEFAULT_PDF_UA = false;
  /** The URL the footer links to */
  public static final String PHIVE_URL = "https://github.com/phax/phive";

  private static final Logger LOGGER = LoggerFactory.getLogger (PhivePdfHelper.class);

  @NonNull
  private static PreloadFont _createMonoFont ()
  {
    final PreloadFont ret = PreloadFont.createEmbedding (EFontResourceKurintoMono.KURINTO_MONO_REGULAR.getFontResource ());
    // The bounding box of the font is much higher than the glyphs used here
    ret.setUseFontLineHeightFromHHEA ();
    return ret;
  }

  private static final PreloadFont FONT_REGULAR = PreloadFont.createEmbedding (EFontResourceOpenSans.OPEN_SANS_NORMAL.getFontResource ());
  private static final PreloadFont FONT_BOLD = PreloadFont.createEmbedding (EFontResourceOpenSans.OPEN_SANS_BOLD.getFontResource ());
  private static final PreloadFont FONT_MONO = _createMonoFont ();

  private final Locale m_aDisplayLocale;
  private IValidationExecutorSet <?> m_aVES;
  private String m_sSourceData;
  private String m_sVendorName;
  private String m_sVendorURL;
  private boolean m_bShowFooter = DEFAULT_SHOW_FOOTER;
  private EPdfALevel m_ePdfALevel;
  private boolean m_bPdfUA = DEFAULT_PDF_UA;
  private ZonedDateTime m_aDocumentCreationDateTime;
  private IPLMissingCodePointCallback m_aMissingCodePointCallback;
  private final ICommonsList <PdfAssociatedFile> m_aAssociatedFiles = new CommonsArrayList <> ();

  private BiFunction <IError, Locale, String> m_aErrorTestExtractor;

  private final CommonsEnumMap <EPhiveResultLabel, String> m_aDefaultLabels;
  private final CommonsEnumMap <EPhiveResultLabel, String> m_aLabels;

  public PhivePdfHelper (@NonNull final Locale aDisplayLocale)
  {
    ValueEnforcer.notNull (aDisplayLocale, "DisplayLocale");
    m_aDisplayLocale = aDisplayLocale;
    m_aDefaultLabels = EPhiveResultLabel.createLabelMap (aDisplayLocale);
    m_aLabels = m_aDefaultLabels.getClone ();
  }

  /**
   * @return The display locale as provided in the constructor. Never <code>null</code>.
   */
  @NonNull
  public final Locale getDisplayLocale ()
  {
    return m_aDisplayLocale;
  }

  /**
   * Set the VES that was used to run the execution.
   *
   * @param a
   *        The VES to set. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper ves (@Nullable final IValidationExecutorSet <?> a)
  {
    m_aVES = a;
    return this;
  }

  /**
   * Set the source data (the validated document content) to be rendered at the end of the report,
   * with line numbers.
   *
   * @param sSourceData
   *        The source data text. May be <code>null</code> to not show source data.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper sourceData (@Nullable final String sSourceData)
  {
    m_sSourceData = sSourceData;
    return this;
  }

  /**
   * Set the optional vendor information, that is shown as "Validated by ..." below the validation
   * timestamp.
   *
   * @param sName
   *        The name of the vendor that performed the validation. May be <code>null</code> to not
   *        show vendor information.
   * @param sURL
   *        The optional URL of the vendor. If present, the name is rendered as a link. May be
   *        <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper vendor (@Nullable final String sName, @Nullable final String sURL)
  {
    m_sVendorName = sName;
    m_sVendorURL = sURL;
    return this;
  }

  /**
   * Define whether the footer with the link to the phive open source library should be shown or
   * not. The page numbers are always shown. The default is {@link #DEFAULT_SHOW_FOOTER}.
   *
   * @param bShowFooter
   *        <code>true</code> to show the footer, <code>false</code> to hide it.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper showFooter (final boolean bShowFooter)
  {
    m_bShowFooter = bShowFooter;
    return this;
  }

  /**
   * Set an optional function to extract the "test" expression (e.g. Schematron test) from an error.
   * Since this module does not depend on ph-schematron, this must be provided externally if test
   * expressions should be included.
   *
   * @param a
   *        The extractor function. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper errorTestExtractor (@Nullable final BiFunction <IError, Locale, String> a)
  {
    m_aErrorTestExtractor = a;
    return this;
  }

  /**
   * Set all label texts at once. The provided map is copied internally. Any labels not present in
   * the map will retain their defaults of the display locale.
   *
   * @param aLabels
   *        The map of labels to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper allLabels (@NonNull final Map <EPhiveResultLabel, String> aLabels)
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
  public PhivePdfHelper label (@NonNull final EPhiveResultLabel eLabel, @NonNull final String sText)
  {
    ValueEnforcer.notNull (eLabel, "Label");
    ValueEnforcer.notNull (sText, "Text");
    m_aLabels.put (eLabel, sText);
    return this;
  }

  /**
   * Get the effective text of a label.
   *
   * @param eLabel
   *        The label to get. May not be <code>null</code>.
   * @return The text of the label. Never <code>null</code>.
   */
  @NonNull
  public final String getLabel (@NonNull final EPhiveResultLabel eLabel)
  {
    return m_aLabels.get (eLabel);
  }

  /**
   * Create a PDF/A document of the provided level. All PDF/A levels supported by ph-pdf-layout can
   * be used (PDF/A-2b, 2u, 3b, 3u and 3a).
   *
   * @param ePdfALevel
   *        The PDF/A level to use. May be <code>null</code> to create no PDF/A (the default).
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper pdfALevel (@Nullable final EPdfALevel ePdfALevel)
  {
    m_ePdfALevel = ePdfALevel;
    return this;
  }

  /**
   * Create a PDF/UA-1 document. It can be combined with PDF/A. The default is
   * {@link #DEFAULT_PDF_UA}.
   *
   * @param bPdfUA
   *        <code>true</code> to create PDF/UA.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper pdfUA (final boolean bPdfUA)
  {
    m_bPdfUA = bPdfUA;
    return this;
  }

  /**
   * Set the creation date time of the document, e.g. to create reproducible PDFs.
   *
   * @param aDocumentCreationDateTime
   *        The creation date time. May be <code>null</code> to use the current date time.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper documentCreationDateTime (@Nullable final ZonedDateTime aDocumentCreationDateTime)
  {
    m_aDocumentCreationDateTime = aDocumentCreationDateTime;
    return this;
  }

  /**
   * Set the callback that is invoked if a character cannot be displayed with the used fonts. By
   * default a warning is logged once per document.
   *
   * @param aMissingCodePointCallback
   *        The callback to use. May be <code>null</code> to use the default.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper missingCodePointCallback (@Nullable final IPLMissingCodePointCallback aMissingCodePointCallback)
  {
    m_aMissingCodePointCallback = aMissingCodePointCallback;
    return this;
  }

  /**
   * Add a file that is embedded into the PDF, e.g. the validated document. Arbitrary embedded files
   * require PDF/A-3 if PDF/A is created.
   *
   * @param aAssociatedFile
   *        The file to embed. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public PhivePdfHelper addAssociatedFile (@NonNull final PdfAssociatedFile aAssociatedFile)
  {
    ValueEnforcer.notNull (aAssociatedFile, "AssociatedFile");
    m_aAssociatedFiles.add (aAssociatedFile);
    return this;
  }

  @Nullable
  private static String _getCleanText (@Nullable final String sText)
  {
    // The narrow no-break space is e.g. used in formatted times, but is not part of the fonts
    return sText == null ? null : sText.replace ('\u202F', '\u00A0');
  }

  @Nullable
  private static String _getLocationText (@NonNull final IError aError)
  {
    if (!aError.hasErrorLocation ())
      return null;

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
    return aSB.toString ();
  }

  @NonNull
  private static IPLMissingCodePointCallback _createMissingCodePointLogger ()
  {
    final AtomicBoolean aLogged = new AtomicBoolean (false);
    return (aFont, nCodePoint, nFallbackCodePoint) -> {
      if (aLogged.compareAndSet (false, true))
        LOGGER.warn ("The font '" +
                     aFont.getName () +
                     "' does not have the character U+" +
                     StringHex.getHexStringLeadingZero (nCodePoint, 4) +
                     ", which is replaced in the PDF, and maybe more.");
    };
  }

  /**
   * Get the font to use for a font type. Override this method to use different fonts. To be able to
   * create PDF/A, the fonts must be embedded.
   *
   * @param eFontType
   *        The font type. May not be <code>null</code>.
   * @return The font to use. May not be <code>null</code>.
   */
  @NonNull
  @OverrideOnDemand
  protected PreloadFont getPreloadFont (@NonNull final EPhivePdfFontType eFontType)
  {
    return switch (eFontType)
    {
      case BOLD -> FONT_BOLD;
      case MONO -> FONT_MONO;
      default -> FONT_REGULAR;
    };
  }

  /**
   * Get the colour to use. Override this method to use different colours.
   *
   * @param eColor
   *        The colour key. May not be <code>null</code>.
   * @return The colour to use. May not be <code>null</code>.
   */
  @NonNull
  @OverrideOnDemand
  protected PLColor getColor (@NonNull final EPhivePdfColor eColor)
  {
    return eColor.getDefaultColor ();
  }

  /**
   * Get the font specification for a text style. Override this method to use a different font, size
   * or colour for a text style.
   *
   * @param eTextStyle
   *        The text style. May not be <code>null</code>.
   * @return The font specification to use. May not be <code>null</code>.
   */
  @NonNull
  @OverrideOnDemand
  protected FontSpec getFontSpec (@NonNull final EPhivePdfTextStyle eTextStyle)
  {
    return new FontSpec (getPreloadFont (eTextStyle.getFontType ()),
                         eTextStyle.getFontSize (),
                         getColor (eTextStyle.getColor ()));
  }

  /**
   * @return The page size to use. A4 portrait by default. May not be <code>null</code>.
   */
  @NonNull
  @OverrideOnDemand
  protected PDRectangle getPageSize ()
  {
    return PDRectangle.A4;
  }

  /**
   * @return The page margin to use. May not be <code>null</code>.
   */
  @NonNull
  @OverrideOnDemand
  protected MarginSpec getPageMargin ()
  {
    return new MarginSpec (40, 40, 30, 40);
  }

  /**
   * Create a text element.
   *
   * @param sText
   *        The text. May be <code>null</code>.
   * @param eTextStyle
   *        The text style to use. May not be <code>null</code>.
   * @return The text element. Never <code>null</code>.
   */
  @NonNull
  protected PLText createText (@Nullable final String sText, @NonNull final EPhivePdfTextStyle eTextStyle)
  {
    return new PLText (_getCleanText (sText), getFontSpec (eTextStyle));
  }

  /**
   * Create a text that is a link to an external URL.
   *
   * @param sText
   *        The text. May be <code>null</code>.
   * @param eTextStyle
   *        The text style to use. The colour is replaced by the link colour. May not be
   *        <code>null</code>.
   * @param sURL
   *        The URL to link to. May not be <code>null</code>.
   * @return The link element. Never <code>null</code>.
   */
  @NonNull
  protected IPLRenderableObject <?> createLink (@Nullable final String sText,
                                                @NonNull final EPhivePdfTextStyle eTextStyle,
                                                @NonNull final String sURL)
  {
    final PLText aText = new PLText (_getCleanText (sText),
                                     getFontSpec (eTextStyle).getCloneWithDifferentColor (getColor (EPhivePdfColor.LINK)));
    return new PLExternalLink (aText).setURI (sURL);
  }

  /**
   * Get the display text of a severity.
   *
   * @param aErrorLevel
   *        The error level. May not be <code>null</code>.
   * @return The severity text. Never <code>null</code>.
   */
  @NonNull
  protected String getSeverityText (@NonNull final IErrorLevel aErrorLevel)
  {
    if (aErrorLevel.isGE (EErrorLevel.ERROR))
      return getLabel (EPhiveResultLabel.SEVERITY_ERROR);
    if (aErrorLevel.isGE (EErrorLevel.WARN))
      return getLabel (EPhiveResultLabel.SEVERITY_WARNING);
    return getLabel (EPhiveResultLabel.SEVERITY_SUCCESS);
  }

  /**
   * Create a table with two columns for label/value pairs. Add rows with
   * {@link #addLabelValueRow(PLTable, String, IPLRenderableObject)}.
   *
   * @return The new table. Never <code>null</code>.
   */
  @NonNull
  protected PLTable createLabelValueTable ()
  {
    return new PLTable (WidthSpec.abs (130), WidthSpec.star ());
  }

  /**
   * Add a label/value row to a table created by {@link #createLabelValueTable()}.
   *
   * @param aTable
   *        The table to add the row to. May not be <code>null</code>.
   * @param sLabel
   *        The label text. May not be <code>null</code>.
   * @param aValue
   *        The value element. May not be <code>null</code>.
   */
  protected void addLabelValueRow (@NonNull final PLTable aTable,
                                   @NonNull final String sLabel,
                                   @NonNull final IPLRenderableObject <?> aValue)
  {
    aTable.addRow (new PLTableCell (createText (sLabel + ":", EPhivePdfTextStyle.LABEL).setPaddingY (1)),
                   new PLTableCell (aValue).setPaddingY (1));
  }

  /**
   * Add a label/value row with a text value to a table created by {@link #createLabelValueTable()}.
   *
   * @param aTable
   *        The table to add the row to. May not be <code>null</code>.
   * @param sLabel
   *        The label text. May not be <code>null</code>.
   * @param sValue
   *        The value text. May be <code>null</code>.
   */
  protected void addLabelValueRow (@NonNull final PLTable aTable,
                                   @NonNull final String sLabel,
                                   @Nullable final String sValue)
  {
    addLabelValueRow (aTable, sLabel, createText (sValue, EPhivePdfTextStyle.VALUE));
  }

  /**
   * Create a coloured box around some content, as used for the VES and the summary.
   *
   * @param aContent
   *        The content of the box. May not be <code>null</code>.
   * @param eFillColor
   *        The background colour. May not be <code>null</code>.
   * @param eBorderColor
   *        The border colour. May not be <code>null</code>.
   * @return The box. Never <code>null</code>.
   */
  @NonNull
  protected PLBox createSectionBox (@NonNull final IPLRenderableObject <?> aContent,
                                    @NonNull final EPhivePdfColor eFillColor,
                                    @NonNull final EPhivePdfColor eBorderColor)
  {
    return new PLBox (aContent).setFillColor (getColor (eFillColor))
                               .setBorder (new BorderStyleSpec (getColor (eBorderColor), 0.75f))
                               .setPadding (8, 12)
                               .setMarginBottom (10)
                               .setVertSplittable (false);
  }

  /**
   * Create the title area with the title, the validation date time and the optional vendor.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @return The created element. Never <code>null</code>.
   */
  @NonNull
  protected IPLRenderableObject <?> createTitle (@NonNull final ValidationResultList aValidationResultList)
  {
    final PLVBox aContent = new PLVBox ();
    aContent.addRow (createText (getLabel (EPhiveResultLabel.VALIDATION_RESULT), EPhivePdfTextStyle.TITLE)
                                                                                                          .setStructureRole (EPLStructureRole.H1)
                                                                                                          .setMarginBottom (6));

    final String sTimestamp = PDTToString.getAsString (aValidationResultList.getValidationDateTime (),
                                                       m_aDisplayLocale);
    aContent.addRow (createText (getLabel (EPhiveResultLabel.VALIDATED_AT) + ": " + sTimestamp,
                                 EPhivePdfTextStyle.MUTED));

    if (StringHelper.isNotEmpty (m_sVendorName))
    {
      final String sPrefix = getLabel (EPhiveResultLabel.VALIDATED_BY) + ": ";
      if (StringHelper.isNotEmpty (m_sVendorURL))
      {
        final PLHBox aHBox = new PLHBox ();
        aHBox.addColumn (createText (sPrefix, EPhivePdfTextStyle.MUTED), WidthSpec.auto ());
        aHBox.addColumn (createLink (m_sVendorName, EPhivePdfTextStyle.MUTED, m_sVendorURL), WidthSpec.star ());
        aContent.addRow (aHBox);
      }
      else
        aContent.addRow (createText (sPrefix + m_sVendorName, EPhivePdfTextStyle.MUTED));
    }
    return new PLBox (aContent).setMarginBottom (12);
  }

  /**
   * Create the section with the information on the VES. Only called if a VES is present.
   *
   * @param aVES
   *        The VES to use. May not be <code>null</code>.
   * @return The created element. Never <code>null</code>.
   */
  @NonNull
  protected IPLRenderableObject <?> createVESSection (@NonNull final IValidationExecutorSet <?> aVES)
  {
    final IValidationExecutorSetStatus aStatus = aVES.getStatus ();

    final PLVBox aContent = new PLVBox ();
    aContent.addRow (createText (getLabel (EPhiveResultLabel.VALIDATION_EXECUTOR_SET), EPhivePdfTextStyle.HEADING)
                                                                                                                  .setStructureRole (EPLStructureRole.H2)
                                                                                                                  .setMarginBottom (4));
    final PLTable aTable = createLabelValueTable ();
    addLabelValueRow (aTable, getLabel (EPhiveResultLabel.VESID), aVES.getID ().getAsSingleID ());
    addLabelValueRow (aTable, getLabel (EPhiveResultLabel.NAME), aVES.getDisplayName ());
    if (aStatus.isDeprecated ())
      addLabelValueRow (aTable, getLabel (EPhiveResultLabel.DEPRECATED), getLabel (EPhiveResultLabel.TRUE));
    aContent.addRow (aTable);

    return aStatus.isDeprecated () ? createSectionBox (aContent,
                                                       EPhivePdfColor.BG_DEPRECATED,
                                                       EPhivePdfColor.BORDER_DEPRECATED)
                                   : createSectionBox (aContent, EPhivePdfColor.BG_VES, EPhivePdfColor.BORDER_VES);
  }

  /**
   * Create the section with the overall result.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @return The created element. Never <code>null</code>.
   */
  @NonNull
  protected IPLRenderableObject <?> createSummarySection (@NonNull final ValidationResultList aValidationResultList)
  {
    final ValidationSummary aSummary = ValidationSummary.create (aValidationResultList);
    final boolean bOverallSuccess = aValidationResultList.getOverallValidity ().isValid ();

    final PLVBox aContent = new PLVBox ();
    aContent.addRow (createText (getLabel (EPhiveResultLabel.OVERALL_RESULT), EPhivePdfTextStyle.HEADING)
                                                                                                         .setStructureRole (EPLStructureRole.H2)
                                                                                                         .setMarginBottom (4));
    final PLTable aTable = createLabelValueTable ();
    addLabelValueRow (aTable,
                      getLabel (EPhiveResultLabel.OVERALL_RESULT),
                      bOverallSuccess ? getLabel (EPhiveResultLabel.SEVERITY_SUCCESS)
                                      : getLabel (EPhiveResultLabel.SEVERITY_ERROR));
    if (aSummary.isValidationInterrupted ())
      addLabelValueRow (aTable, getLabel (EPhiveResultLabel.INTERRUPTED), getLabel (EPhiveResultLabel.TRUE));
    addLabelValueRow (aTable,
                      getLabel (EPhiveResultLabel.HIGHEST_SEVERITY),
                      getSeverityText (aSummary.getMostSevereErrorLevel ()));
    addLabelValueRow (aTable, getLabel (EPhiveResultLabel.WARNINGS), Integer.toString (aSummary.getWarningCount ()));
    addLabelValueRow (aTable, getLabel (EPhiveResultLabel.ERRORS), Integer.toString (aSummary.getErrorCount ()));
    if (aValidationResultList.hasValidationDuration ())
      addLabelValueRow (aTable,
                        getLabel (EPhiveResultLabel.DURATION),
                        LocaleFormatter.getFormatted (aValidationResultList.getValidationDuration ().toMillis (),
                                                      m_aDisplayLocale) +
                                                               getLabel (EPhiveResultLabel.MILLISECONDS_SUFFIX));
    aContent.addRow (aTable);

    return bOverallSuccess ? createSectionBox (aContent, EPhivePdfColor.BG_SUCCESS, EPhivePdfColor.BORDER_SUCCESS)
                           : createSectionBox (aContent, EPhivePdfColor.BG_FAILURE, EPhivePdfColor.BORDER_FAILURE);
  }

  /**
   * Create the table with all errors of a single validation layer. Only called if the layer was not
   * skipped and has at least one error. The column "Location" is only present if at least one error
   * has a location. The column "Test" is only present if an error test extractor is set.
   *
   * @param aVR
   *        The validation result of the layer. May not be <code>null</code>.
   * @return The created table. Never <code>null</code>.
   */
  @NonNull
  protected PLTable createErrorTable (@NonNull final ValidationResult aVR)
  {
    final boolean bHasTestColumn = m_aErrorTestExtractor != null;
    final boolean bHasLocationColumn = aVR.getErrorList ()
                                          .containsAny (x -> StringHelper.isNotEmpty (_getLocationText (x)));

    // Severity, Error ID, Field, [Location], Error text, [Test]
    final ICommonsList <WidthSpec> aWidths = new CommonsArrayList <> ();
    aWidths.add (WidthSpec.abs (62));
    aWidths.add (WidthSpec.perc (14));
    aWidths.add (WidthSpec.perc (bHasLocationColumn || bHasTestColumn ? 18 : 26));
    if (bHasLocationColumn)
      aWidths.add (WidthSpec.perc (14));
    aWidths.add (WidthSpec.star ());
    if (bHasTestColumn)
      aWidths.add (WidthSpec.perc (18));
    final PLTable aTable = new PLTable (aWidths);
    aTable.setHeaderRowCount (1);

    // Header row
    final ICommonsList <String> aHeaders = new CommonsArrayList <> ();
    aHeaders.add (getLabel (EPhiveResultLabel.SEVERITY));
    aHeaders.add (getLabel (EPhiveResultLabel.ERROR_ID));
    aHeaders.add (getLabel (EPhiveResultLabel.FIELD));
    if (bHasLocationColumn)
      aHeaders.add (getLabel (EPhiveResultLabel.LOCATION));
    aHeaders.add (getLabel (EPhiveResultLabel.ERROR_TEXT));
    if (bHasTestColumn)
      aHeaders.add (getLabel (EPhiveResultLabel.TEST));
    final ICommonsList <PLTableCell> aHeaderCells = new CommonsArrayList <> ();
    for (final String sHeader : aHeaders)
      aHeaderCells.add (new PLTableCell (createText (sHeader, EPhivePdfTextStyle.TABLE_HEADER).setPadding (3, 4))
                                                                                                                 .setStructureRole (EPLStructureRole.TH));
    aTable.addAndReturnRow (aHeaderCells).setFillColor (getColor (EPhivePdfColor.BG_SUBTLE));

    // Body rows
    for (final IError aError : aVR.getErrorList ())
    {
      final EPhivePdfColor eRowColor;
      final EPhivePdfColor eSeverityColor;
      if (PhiveSeverityHelper.isConsideredError (aError.getErrorLevel ()))
      {
        eRowColor = EPhivePdfColor.BG_ERROR_ROW;
        eSeverityColor = EPhivePdfColor.ERROR_TEXT;
      }
      else
        if (PhiveSeverityHelper.isConsideredWarning (aError.getErrorLevel ()))
        {
          eRowColor = EPhivePdfColor.BG_WARNING_ROW;
          eSeverityColor = EPhivePdfColor.WARNING_TEXT;
        }
        else
        {
          eRowColor = EPhivePdfColor.BG_SUCCESS_ROW;
          eSeverityColor = EPhivePdfColor.TEXT;
        }

      final ICommonsList <PLTableCell> aCells = new CommonsArrayList <> ();
      aCells.add (new PLTableCell (new PLText (getSeverityText (aError.getErrorLevel ()),
                                               getFontSpec (EPhivePdfTextStyle.TABLE_CELL_SEVERITY).getCloneWithDifferentColor (getColor (eSeverityColor))).setPadding (3,
                                                                                                                                                                        4)));
      aCells.add (new PLTableCell (createText (aError.getErrorID (), EPhivePdfTextStyle.TABLE_CELL_MONO).setPadding (3,
                                                                                                                     4)));
      aCells.add (new PLTableCell (createText (aError.getErrorFieldName (), EPhivePdfTextStyle.TABLE_CELL_MONO)
                                                                                                               .setPadding (3,
                                                                                                                            4)));
      if (bHasLocationColumn)
        aCells.add (new PLTableCell (createText (_getLocationText (aError), EPhivePdfTextStyle.TABLE_CELL_MONO)
                                                                                                               .setPadding (3,
                                                                                                                            4)));
      aCells.add (new PLTableCell (createText (aError.getErrorText (m_aDisplayLocale), EPhivePdfTextStyle.TABLE_CELL)
                                                                                                                     .setPadding (3,
                                                                                                                                  4)));
      if (bHasTestColumn)
        aCells.add (new PLTableCell (createText (m_aErrorTestExtractor.apply (aError, m_aDisplayLocale),
                                                 EPhivePdfTextStyle.TABLE_CELL_MONO).setPadding (3, 4)));
      aTable.addAndReturnRow (aCells).setFillColor (getColor (eRowColor));
    }

    EPLTableGridType.FULL.applyGridToTable (aTable, new BorderStyleSpec (getColor (EPhivePdfColor.BORDER), 0.5f));
    aTable.setMarginTop (6);
    return aTable;
  }

  /**
   * Create the section of a single validation layer.
   *
   * @param aVR
   *        The validation result of the layer. May not be <code>null</code>.
   * @param nLayerIndex
   *        The 1-based index of the layer.
   * @return The created element. Never <code>null</code>.
   */
  @NonNull
  protected IPLRenderableObject <?> createLayerSection (@NonNull final ValidationResult aVR, final int nLayerIndex)
  {
    final IValidationArtefact aVA = aVR.getValidationArtefact ();
    final EExtendedValidity eValidity = aVR.getValidity ();
    final boolean bIsSkipped = eValidity.isSkipped ();
    final boolean bIsValid = !bIsSkipped && eValidity.isValid ();

    final EPhivePdfColor eAccentColor;
    if (bIsSkipped)
      eAccentColor = EPhivePdfColor.ACCENT_SKIPPED;
    else
      if (bIsValid)
        eAccentColor = EPhivePdfColor.ACCENT_SUCCESS;
      else
        eAccentColor = EPhivePdfColor.ACCENT_FAILURE;

    final PLVBox aContent = new PLVBox ();
    aContent.addRow (createText (getLabel (EPhiveResultLabel.VALIDATION_LAYER) + " #" + nLayerIndex,
                                 EPhivePdfTextStyle.SUBHEADING).setStructureRole (EPLStructureRole.H3)
                                                               .setMarginBottom (4));

    final PLTable aTable = createLabelValueTable ();
    addLabelValueRow (aTable, getLabel (EPhiveResultLabel.ARTIFACT_TYPE), aVA.getValidationType ().getName ());
    addLabelValueRow (aTable,
                      getLabel (EPhiveResultLabel.ARTIFACT_PATH),
                      createText (aVA.getRuleResourcePath (), EPhivePdfTextStyle.VALUE_MONO));
    addLabelValueRow (aTable,
                      getLabel (EPhiveResultLabel.OVERALL_RESULT),
                      bIsSkipped ? getLabel (EPhiveResultLabel.SKIPPED)
                                 : bIsValid ? getLabel (EPhiveResultLabel.SEVERITY_SUCCESS)
                                            : getLabel (EPhiveResultLabel.SEVERITY_ERROR));
    addLabelValueRow (aTable,
                      getLabel (EPhiveResultLabel.DURATION),
                      LocaleFormatter.getFormatted (aVR.getDurationMS (), m_aDisplayLocale) +
                                                             getLabel (EPhiveResultLabel.MILLISECONDS_SUFFIX));
    aContent.addRow (aTable);

    if (!bIsSkipped && aVR.getErrorList ().isNotEmpty ())
      aContent.addRow (createErrorTable (aVR));

    final PLBox ret = new PLBox (aContent).setBorder (new BorderStyleSpec (getColor (EPhivePdfColor.BORDER), 0.75f))
                                          .setBorderLeft (new BorderStyleSpec (getColor (eAccentColor), 3))
                                          .setPadding (8, 12)
                                          .setMarginBottom (10);
    if (bIsSkipped)
      ret.setFillColor (getColor (EPhivePdfColor.BG_SKIPPED));
    return ret;
  }

  /**
   * Create the section with the source data. Only called if source data is present.
   *
   * @param sSourceData
   *        The source data. May neither be <code>null</code> nor empty.
   * @return The created element. Never <code>null</code>.
   */
  @NonNull
  protected IPLRenderableObject <?> createSourceDataSection (@NonNull final String sSourceData)
  {
    final PLVBox ret = new PLVBox ();
    ret.addRow (createText (getLabel (EPhiveResultLabel.SOURCE_DATA), EPhivePdfTextStyle.HEADING).setStructureRole (
                                                                                                                    EPLStructureRole.H2)
                                                                                                 .setMarginTop (6)
                                                                                                 .setMarginBottom (4));

    final String [] aLines = StringHelper.getExplodedArray ('\n', sSourceData);
    final int nDigits = Integer.toString (aLines.length).length ();
    final FontSpec aLineNumberFont = getFontSpec (EPhivePdfTextStyle.SOURCE_LINE_NUMBER);
    // Monospaced font: all digits have the same width
    final float fLineNumberWidth = Math.max (2, nDigits) * aLineNumberFont.getFontSize () * 0.65f + 12;

    final PLTable aTable = new PLTable (WidthSpec.abs (fLineNumberWidth), WidthSpec.star ());
    for (int i = 0; i < aLines.length; i++)
    {
      // Tabs and carriage returns are not part of the fonts
      final String sLine = StringReplace.replaceAll (StringHelper.trimEnd (aLines[i], '\r'), "\t", "    ");
      aTable.addRow (new PLTableCell (new PLText (Integer.toString (i + 1), aLineNumberFont).setHorzAlign (
                                                                                                           EHorzAlignment.RIGHT)
                                                                                            .setPadding (0.5f, 6))
                                                                                                                  .setFillColor (getColor (EPhivePdfColor.BG_SUBTLE)),
                     new PLTableCell (createText (sLine, EPhivePdfTextStyle.SOURCE_LINE).setPadding (0.5f, 6)));
    }
    ret.addRow (new PLBox (aTable).setBorder (new BorderStyleSpec (getColor (EPhivePdfColor.BORDER), 0.5f)));
    return ret;
  }

  /**
   * Create the page footer, that is shown on every page. By default it contains the optional link
   * to phive and the page number.
   *
   * @return The page footer. May be <code>null</code> to have no page footer.
   */
  @Nullable
  protected IPLRenderableObject <?> createPageFooter ()
  {
    final PLHBox aContent = new PLHBox ();
    if (m_bShowFooter)
      aContent.addColumn (createLink (getLabel (EPhiveResultLabel.FOOTER_PREFIX) +
                                      "phive" +
                                      getLabel (EPhiveResultLabel.FOOTER_SUFFIX),
                                      EPhivePdfTextStyle.FOOTER,
                                      PHIVE_URL), WidthSpec.star ());
    else
      aContent.addColumn (new PLSpacerX (0), WidthSpec.star ());
    aContent.addColumn (createText (getLabel (EPhiveResultLabel.PAGE) +
                                    " " +
                                    EPLPlaceholder.TOTAL_PAGE_NUMBER.getVariable () +
                                    " " +
                                    getLabel (EPhiveResultLabel.PAGE_OF) +
                                    " " +
                                    EPLPlaceholder.TOTAL_PAGE_COUNT.getVariable (),
                                    EPhivePdfTextStyle.FOOTER).setReplacePlaceholder (true)
                                                              .setHorzAlign (EHorzAlignment.RIGHT),
                        WidthSpec.abs (100));
    return new PLBox (aContent).setBorderTop (new BorderStyleSpec (getColor (EPhivePdfColor.BORDER), 0.5f))
                               .setPaddingTop (4);
  }

  /**
   * Create the page set with all the content.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @return The page set. Never <code>null</code>.
   */
  @NonNull
  protected PLPageSet createPageSet (@NonNull final ValidationResultList aValidationResultList)
  {
    final PLPageSet aPS = new PLPageSet (getPageSize ()).setMargin (getPageMargin ());

    aPS.addElement (createTitle (aValidationResultList));
    if (m_aVES != null)
      aPS.addElement (createVESSection (m_aVES));
    aPS.addElement (createSummarySection (aValidationResultList));

    int nLayerIndex = 0;
    for (final ValidationResult aVR : aValidationResultList)
    {
      nLayerIndex++;
      aPS.addElement (createLayerSection (aVR, nLayerIndex));
    }

    if (StringHelper.isNotEmpty (m_sSourceData))
      aPS.addElement (createSourceDataSection (m_sSourceData));

    aPS.setPageFooter (createPageFooter ());
    return aPS;
  }

  /**
   * Create the page layout with the validation results, but don't render it yet. This allows for
   * further customisation of the layout.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @return The page layout. Never <code>null</code>.
   */
  @NonNull
  public PageLayoutPDF createPageLayout (@NonNull final ValidationResultList aValidationResultList)
  {
    ValueEnforcer.notNull (aValidationResultList, "ValidationResultList");

    final PageLayoutPDF ret = new PageLayoutPDF ();
    ret.setDocumentTitle (getLabel (EPhiveResultLabel.VALIDATION_RESULT));
    if (m_aVES != null)
      ret.setDocumentSubject (m_aVES.getID ().getAsSingleID () + " - " + m_aVES.getDisplayName ());
    if (StringHelper.isNotEmpty (m_sVendorName))
      ret.setDocumentAuthor (m_sVendorName);
    ret.setDocumentCreator ("phive v" + CPhiveVersion.BUILD_VERSION);
    ret.setDocumentLanguage (m_aDisplayLocale.toLanguageTag ());
    if (m_aDocumentCreationDateTime != null)
      ret.setDocumentCreationDateTime (m_aDocumentCreationDateTime);
    ret.setMissingCodePointCallback (m_aMissingCodePointCallback != null ? m_aMissingCodePointCallback
                                                                         : _createMissingCodePointLogger ());
    if (m_ePdfALevel != null)
      ret.setPdfALevel (m_ePdfALevel);
    if (m_bPdfUA)
      ret.setCreatePdfUA (true);
    for (final PdfAssociatedFile aFile : m_aAssociatedFiles)
      ret.addAssociatedFile (aFile);

    ret.addPageSet (createPageSet (aValidationResultList));
    return ret;
  }

  /**
   * Create the PDF and write it to the provided output stream.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @param aOS
   *        The output stream to write to. Is closed afterwards. May not be <code>null</code>.
   * @throws PDFCreationException
   *         If creating the PDF failed
   */
  public void createPdf (@NonNull final ValidationResultList aValidationResultList,
                         @NonNull @WillClose final OutputStream aOS) throws PDFCreationException
  {
    ValueEnforcer.notNull (aOS, "OutputStream");
    createPageLayout (aValidationResultList).renderTo (aOS);
  }

  /**
   * Create the PDF and write it to the provided file.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @param aFile
   *        The file to write to. May not be <code>null</code>.
   * @throws PDFCreationException
   *         If creating the PDF failed
   */
  public void createPdf (@NonNull final ValidationResultList aValidationResultList,
                         @NonNull final File aFile) throws PDFCreationException
  {
    ValueEnforcer.notNull (aFile, "File");
    createPageLayout (aValidationResultList).renderTo (aFile);
  }

  /**
   * Create the PDF as a byte array.
   *
   * @param aValidationResultList
   *        The validation result list. May not be <code>null</code>.
   * @return The bytes of the PDF. Never <code>null</code>.
   * @throws PDFCreationException
   *         If creating the PDF failed
   */
  @ReturnsMutableCopy
  public byte @NonNull [] createPdfBytes (@NonNull final ValidationResultList aValidationResultList) throws PDFCreationException
  {
    final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ();
    createPdf (aValidationResultList, aBAOS);
    return aBAOS.toByteArray ();
  }
}
