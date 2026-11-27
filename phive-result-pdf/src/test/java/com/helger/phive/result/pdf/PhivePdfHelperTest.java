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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.util.Locale;

import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.jspecify.annotations.NonNull;
import org.junit.Test;
import org.verapdf.pdfa.flavours.PDFAFlavour;

import com.helger.base.location.SimpleLocation;
import com.helger.collection.commons.ICommonsList;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.io.file.SimpleFileIO;
import com.helger.io.resource.ClassPathResource;
import com.helger.pdflayout.base.PLColor;
import com.helger.pdflayout.pdfa.EPdfAFRelationship;
import com.helger.pdflayout.pdfa.EPdfALevel;
import com.helger.pdflayout.pdfa.PdfAssociatedFile;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.result.label.EPhiveResultLabel;
import com.helger.phive.api.validity.EExtendedValidity;

/**
 * Test class for class {@link PhivePdfHelper}. The created PDFs are written to
 * <code>target/pdf</code>.
 *
 * @author Philip Helger
 */
public final class PhivePdfHelperTest
{
  private static final String SOURCE_DATA = "<invoice>\n" +
                                            "\t<id>123</id>\n" +
                                            "  <total>100.00</total>\n" +
                                            "  <note>Grüße &amp; Ünïcödé</note>\n" +
                                            "</invoice>";

  @NonNull
  private static IValidationExecutorSet <?> _createVES (final boolean bDeprecated) throws DVRVersionException
  {
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");
    return new ValidationExecutorSet <> (aVESID,
                                         "My Test VES",
                                         ValidationExecutorSetStatus.createDeprecatedNow (bDeprecated));
  }

  @NonNull
  private static ValidationResultList _createEmptyVRL ()
  {
    return ValidationResultList.createNoSource ().setValidationDuration (Duration.ofMillis (78));
  }

  @NonNull
  private static ValidationResultList _createVRLWithErrors (final boolean bWithLocation)
  {
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ()
                               .errorID ("ERR-001")
                               .errorFieldName ("/Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName")
                               .errorText ("Value is missing")
                               .errorLocation (bWithLocation ? new SimpleLocation ("test.xml", 10, 5) : null)
                               .build ());
    aErrorList.add (SingleError.builderWarn ().errorID ("WARN-001").errorText ("Deprecated element used").build ());
    aErrorList.add (SingleError.builderInfo ().errorID ("INFO-001").errorText ("Just for your information").build ());

    final ValidationResultList ret = _createEmptyVRL ();
    ret.add (new ValidationResult (new ValidationArtefact (EValidationType.XSD,
                                                           new ClassPathResource ("test/dummy.xsd")),
                                   aErrorList,
                                   EExtendedValidity.INVALID,
                                   Duration.ofMillis (42)));
    ret.add (ValidationResult.createSkippedResult (new ValidationArtefact (EValidationType.SCHEMATRON_XSLT2,
                                                                           new ClassPathResource ("test/dummy.xslt"))));
    return ret;
  }

  @NonNull
  private static String _getText (final byte @NonNull [] aPdf) throws Exception
  {
    try (final PDDocument aDoc = Loader.loadPDF (aPdf))
    {
      return new PDFTextStripper ().getText (aDoc);
    }
  }

  private static byte @NonNull [] _render (@NonNull final PhivePdfHelper aHelper,
                                           @NonNull final ValidationResultList aVRL,
                                           @NonNull final String sName) throws Exception
  {
    final byte [] ret = aHelper.createPdfBytes (aVRL);
    assertNotNull (ret);
    SimpleFileIO.writeFile (new File ("target/pdf/" + sName + ".pdf"), ret);
    return ret;
  }

  @Test
  public void testEmptyResultList () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).ves (_createVES (false)), _createEmptyVRL (), "empty");
    final String sText = _getText (aPdf);
    assertTrue (sText, sText.contains ("Validation Result"));
    assertTrue (sText, sText.contains ("Validated at"));
    // No character may be missing in the fonts
    assertFalse (sText, sText.contains ("?"));
    assertTrue (sText, sText.contains ("group:art:1"));
    assertTrue (sText, sText.contains ("My Test VES"));
    assertTrue (sText, sText.contains ("Success"));
    assertTrue (sText, sText.contains ("Page 1 of 1"));
    assertTrue (sText, sText.contains ("open source library"));
    assertFalse (sText, sText.contains ("Validated by"));
    assertFalse (sText, sText.contains ("Source Data"));
  }

  @Test
  public void testWithErrors () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).ves (_createVES (true))
                                                                .errorTestExtractor ((err,
                                                                                      loc) -> "//invoice/id != ''"),
                                  _createVRLWithErrors (true),
                                  "errors");
    final String sText = _getText (aPdf);
    assertTrue (sText, sText.contains ("Deprecated"));
    assertTrue (sText, sText.contains ("Validation Layer #1"));
    assertTrue (sText, sText.contains ("Validation Layer #2"));
    assertTrue (sText, sText.contains ("Skipped"));
    assertTrue (sText, sText.contains ("ERR-001"));
    assertTrue (sText, sText.contains ("Value is missing"));
    assertTrue (sText, sText.contains ("WARN-001"));
    assertTrue (sText, sText.contains ("INFO-001"));
    assertTrue (sText, sText.contains ("Location"));
    assertTrue (sText, sText.contains ("test.xml:10:5"));
    assertTrue (sText, sText.contains ("Test"));
    // The test column is narrow, so the test expression is wrapped
    assertTrue (sText, sText.contains ("//invoice/id !="));
  }

  @Test
  public void testNoLocationColumnIfEmpty () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US), _createVRLWithErrors (false), "no-location");
    final String sText = _getText (aPdf);
    assertTrue (sText, sText.contains ("ERR-001"));
    assertFalse (sText, sText.contains ("Location"));
    assertFalse (sText, sText.contains ("Applied Validation Executor Set"));
  }

  @Test
  public void testGermanWithVendorAndSourceData () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.GERMANY).ves (_createVES (false))
                                                                     .vendor ("ACME Validator",
                                                                              "https://acme.example.org")
                                                                     .sourceData (SOURCE_DATA),
                                  _createVRLWithErrors (true),
                                  "german");
    final String sText = _getText (aPdf);
    assertTrue (sText, sText.contains ("Validierungsergebnis"));
    assertTrue (sText, sText.contains ("Validiert durch"));
    assertTrue (sText, sText.contains ("ACME Validator"));
    assertTrue (sText, sText.contains ("Quelldaten"));
    assertTrue (sText, sText.contains ("<id>123</id>"));
    assertTrue (sText, sText.contains ("Grüße &amp; Ünïcödé"));
    assertTrue (sText, sText.contains ("Seite 1 von "));
    assertTrue (sText, sText.contains ("Opensource Bibliothek"));
  }

  @Test
  public void testNoFooterAndCustomLabel () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).showFooter (false)
                                                                .vendor ("ACME Validator", null)
                                                                .label (EPhiveResultLabel.VALIDATION_RESULT,
                                                                        "My Report"), _createEmptyVRL (), "no-footer");
    final String sText = _getText (aPdf);
    assertTrue (sText, sText.contains ("My Report"));
    assertTrue (sText, sText.contains ("Validated by: ACME Validator"));
    assertFalse (sText, sText.contains ("open source library"));
    // Page numbers are always shown
    assertTrue (sText, sText.contains ("Page 1 of 1"));
  }

  @Test
  public void testManyPages () throws Exception
  {
    final StringBuilder aSB = new StringBuilder ();
    for (int i = 0; i < 500; ++i)
      aSB.append ("<line number='").append (i).append ("'>Some content of line ").append (i).append ("</line>\n");

    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).ves (_createVES (false)).sourceData (aSB.toString ()),
                                  _createVRLWithErrors (true),
                                  "many-pages");
    try (final PDDocument aDoc = Loader.loadPDF (aPdf))
    {
      final int nPages = aDoc.getNumberOfPages ();
      assertTrue (nPages > 3);
      final String sText = new PDFTextStripper ().getText (aDoc);
      assertTrue (sText, sText.contains ("Page 1 of " + nPages));
      assertTrue (sText, sText.contains ("Page " + nPages + " of " + nPages));
      assertTrue (sText, sText.contains ("Some content of line 499"));
    }
  }

  @Test
  public void testAllPdfALevels () throws Exception
  {
    final ZonedDateTime aCreationDT = ZonedDateTime.of (2026, 11, 27, 12, 0, 0, 0, ZoneOffset.UTC);
    for (final EPdfALevel eLevel : EPdfALevel.values ())
    {
      final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).ves (_createVES (false))
                                                                  .vendor ("ACME Validator", "https://acme.example.org")
                                                                  .sourceData (SOURCE_DATA)
                                                                  .pdfALevel (eLevel)
                                                                  .documentCreationDateTime (aCreationDT),
                                    _createVRLWithErrors (true),
                                    "pdfa-" + eLevel.getID ());
      assertEquals (eLevel.getID (), PdfAValidatorHelper.getDeclaredFlavourID (aPdf));
      final ICommonsList <String> aErrors = PdfAValidatorHelper.validate (aPdf, null);
      assertTrue (eLevel.getID () + ":\n" + String.join ("\n", aErrors), aErrors.isEmpty ());
    }
  }

  @Test
  public void testPdfUA () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).ves (_createVES (false))
                                                                .sourceData (SOURCE_DATA)
                                                                .pdfALevel (EPdfALevel.PDF_A_3A)
                                                                .pdfUA (true), _createVRLWithErrors (true), "pdfua");
    ICommonsList <String> aErrors = PdfAValidatorHelper.validate (aPdf, null);
    assertTrue (String.join ("\n", aErrors), aErrors.isEmpty ());
    aErrors = PdfAValidatorHelper.validate (aPdf, PDFAFlavour.PDFUA_1);
    assertTrue (String.join ("\n", aErrors), aErrors.isEmpty ());
  }

  @Test
  public void testPdfA3WithSourceAttachment () throws Exception
  {
    final byte [] aPdf = _render (new PhivePdfHelper (Locale.US).pdfALevel (EPdfALevel.PDF_A_3B)
                                                                .addAssociatedFile (new PdfAssociatedFile (SOURCE_DATA.getBytes (StandardCharsets.UTF_8),
                                                                                                           "source.xml",
                                                                                                           "text/xml",
                                                                                                           "The validated document",
                                                                                                           EPdfAFRelationship.SOURCE)),
                                  _createVRLWithErrors (true),
                                  "pdfa3-attachment");
    final ICommonsList <String> aErrors = PdfAValidatorHelper.validate (aPdf, null);
    assertTrue (String.join ("\n", aErrors), aErrors.isEmpty ());
    try (final PDDocument aDoc = Loader.loadPDF (aPdf))
    {
      assertNotNull (aDoc.getDocumentCatalog ().getNames ().getEmbeddedFiles ().getNames ().get ("source.xml"));
    }
  }

  @Test
  public void testSubclassStyling () throws Exception
  {
    final PhivePdfHelper aHelper = new PhivePdfHelper (Locale.US)
    {
      @Override
      protected PLColor getColor (@NonNull final EPhivePdfColor eColor)
      {
        if (eColor == EPhivePdfColor.BG_FAILURE)
          return PLColor.PINK;
        return super.getColor (eColor);
      }
    };
    final byte [] aPdf = _render (aHelper.ves (_createVES (false)), _createVRLWithErrors (true), "subclass");
    final String sText = _getText (aPdf);
    assertTrue (sText, sText.contains ("ERR-001"));
  }
}
