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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.time.OffsetDateTime;
import java.util.Locale;

import org.junit.Test;

import com.helger.base.location.SimpleLocation;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.io.file.SimpleFileIO;
import com.helger.io.resource.ClassPathResource;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.xml.microdom.IMicroDocument;
import com.helger.xml.microdom.IMicroElement;
import com.helger.xml.microdom.MicroElement;
import com.helger.xml.microdom.serialize.MicroWriter;
import com.helger.xml.serialize.write.EXMLSerializeIndent;
import com.helger.xml.serialize.write.XMLWriterSettings;

/**
 * Test class for class {@link PhiveHtmlHelper}.
 *
 * @author Philip Helger
 */
public final class PhiveHtmlHelperTest
{
  @Test
  public void testEmptyResultList () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnly ();
    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "My Test VES",
                                                                         ValidationExecutorSetStatus.createValidAt (aNow));

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES).overallDurationMillis (100).applyTo (eBody, new ValidationResultList (null));

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertNotNull (sHtml);

    // Check CSS classes present
    assertTrue (sHtml.contains ("class=\"" + CPhiveHtmlCss.CSS_RESULTS + "\""));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SUMMARY));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SUMMARY_SUCCESS));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_VES));

    // Check labels
    assertTrue (sHtml.contains ("Validation Result"));
    assertTrue (sHtml.contains ("group:art:1"));
    assertTrue (sHtml.contains ("My Test VES"));
    assertTrue (sHtml.contains ("Success"));

    // Check creation timestamp
    assertFalse (sHtml.contains (CPhiveHtmlCss.CSS_VALIDATED_AT));
    assertFalse (sHtml.contains ("Created at"));

    // Check footer with phive link
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_FOOTER));
    assertTrue (sHtml.contains ("href=\"https://github.com/phax/phive\""));
    assertTrue (sHtml.contains (">phive<"));
  }

  @Test
  public void testWithErrors () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "2.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Test VES with errors",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    // Create a validation result with errors
    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.XSD,
                                                           new ClassPathResource ("test/dummy.xsd"));
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ()
                               .errorID ("ERR-001")
                               .errorFieldName ("/invoice/id")
                               .errorText ("Value is missing")
                               .errorLocation (new SimpleLocation ("test.xml", 10, 5))
                               .build ());
    aErrorList.add (SingleError.builderWarn ().errorID ("WARN-001").errorText ("Deprecated element used").build ());
    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, 42);

    final ValidationResultList aVRL = new ValidationResultList (null);
    aVRL.add (aVR);

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES).overallDurationMillis (200).applyTo (eBody, aVRL);

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertNotNull (sHtml);

    // Check failure indicated
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SUMMARY_FAILURE));
    assertFalse (sHtml.contains (CPhiveHtmlCss.CSS_SUMMARY_SUCCESS));

    // Check error items present
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_ITEMS));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_ITEM_ERROR));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_ITEM_WARNING));

    // Check error content
    assertTrue (sHtml.contains ("ERR-001"));
    assertTrue (sHtml.contains ("Value is missing"));
    assertTrue (sHtml.contains ("/invoice/id"));
    assertTrue (sHtml.contains ("test.xml:10:5"));
    assertTrue (sHtml.contains ("WARN-001"));
    assertTrue (sHtml.contains ("Deprecated element used"));

    // Check artifact info
    assertTrue (sHtml.contains ("xsd"));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_RESULT_FAILURE));
  }

  @Test
  public void testWithSkippedLayer () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "3.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Test with skip",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    // Create a skipped result
    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.XSD,
                                                           new ClassPathResource ("test/dummy.xsd"));
    final ValidationResult aVR = ValidationResult.createSkippedResult (aVA);

    final ValidationResultList aVRL = new ValidationResultList (null);
    aVRL.add (aVR);

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES).overallDurationMillis (50).applyTo (eBody, aVRL);

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertNotNull (sHtml);

    // Check skipped indicated
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_RESULT_SKIPPED));
    assertTrue (sHtml.contains ("Skipped"));
  }

  @Test
  public void testWithoutVES ()
  {
    final Locale aDisplayLocale = Locale.US;

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (null).overallDurationMillis (10).applyTo (eBody, new ValidationResultList (null));

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertNotNull (sHtml);

    // No VES section
    assertFalse (sHtml.contains (CPhiveHtmlCss.CSS_VES));
    // But summary still present
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SUMMARY));
  }

  @Test
  public void testCreateFullPage () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Page Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .overallDurationMillis (100)
                                                                    .createHtmlDocument (new ValidationResultList (null));
    assertNotNull (aDoc);

    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertNotNull (sHtml);

    // Check full page structure
    assertTrue (sHtml.contains ("<html"));
    assertTrue (sHtml.contains ("<head>"));
    assertTrue (sHtml.contains ("<meta charset=\"UTF-8\""));
    assertTrue (sHtml.contains ("<title>Validation Result</title>"));
    assertTrue (sHtml.contains ("<body>"));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_RESULTS));
  }

  @Test
  public void testCssInlineInjection () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "CSS Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final String sCustomCss = ".phive-results { background: #fff; } .phive-item-error { color: red; }";
    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .addCssInline (sCustomCss)
                                                                    .overallDurationMillis (50)
                                                                    .createHtmlDocument (new ValidationResultList (null));
    assertNotNull (aDoc);

    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertTrue (sHtml.contains ("<style>" + sCustomCss + "</style>"));
  }

  @Test
  public void testCssLinkInjection () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "CSS Link Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final String sCssUrl = "https://example.com/phive-styles.css";
    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .addCssLink (sCssUrl)
                                                                    .overallDurationMillis (50)
                                                                    .createHtmlDocument (new ValidationResultList (null));
    assertNotNull (aDoc);

    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertTrue (sHtml.contains ("rel=\"stylesheet\""));
    assertTrue (sHtml.contains ("href=\"" + sCssUrl + "\""));
  }

  @Test
  public void testMultipleCssInjections () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Multi CSS Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .addCssLink ("https://example.com/a.css")
                                                                    .addCssLink ("https://example.com/b.css")
                                                                    .addCssInline ("body { margin: 0; }")
                                                                    .addCssInline ("h1 { color: blue; }")
                                                                    .overallDurationMillis (50)
                                                                    .createHtmlDocument (new ValidationResultList (null));
    assertNotNull (aDoc);

    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertTrue (sHtml.contains ("href=\"https://example.com/a.css\""));
    assertTrue (sHtml.contains ("href=\"https://example.com/b.css\""));
    assertTrue (sHtml.contains ("body { margin: 0; }"));
    assertTrue (sHtml.contains ("h1 { color: blue; }"));
  }

  @Test
  public void testCustomLabels () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.GERMAN;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Label Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                        .label (EPhiveHtmlLabel.VALIDATION_RESULT, "ValRes1")
                                        .label (EPhiveHtmlLabel.OVERALL_RESULT, "OverallRes1")
                                        .label (EPhiveHtmlLabel.SEVERITY_SUCCESS, "Success1")
                                        .overallDurationMillis (50)
                                        .applyTo (eBody, new ValidationResultList (null));

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertTrue (sHtml.contains ("ValRes1"));
    assertTrue (sHtml.contains ("OverallRes1"));
    assertTrue (sHtml.contains ("Success1"));
  }

  @Test
  public void testErrorTestExtractor () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Test Extractor",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.XSD,
                                                           new ClassPathResource ("test/dummy.xsd"));
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ()
                               .errorID ("SCH-01")
                               .errorText ("Rule violated")
                               .errorLocation (new SimpleLocation ("doc.xml", 5, 10))
                               .build ());
    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, 30);
    final ValidationResultList aVRL = new ValidationResultList (null);
    aVRL.add (aVR);

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                        .errorTestExtractor ( (err, loc) -> "//invoice/id != ''")
                                        .overallDurationMillis (100)
                                        .applyTo (eBody, aVRL);

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    // Test column header and value present
    assertTrue (sHtml.contains (">Test<"));
    assertTrue (sHtml.contains ("//invoice/id != ''"));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_ERROR_TEST));
  }

  @Test
  public void testSourceData () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Source Data Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final String sSourceData = "<invoice>\n" + "  <id>123</id>\n" + "  <total>100.00</total>\n" + "</invoice>";
    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                        .sourceData (sSourceData)
                                        .overallDurationMillis (50)
                                        .applyTo (eBody, new ValidationResultList (null));

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));

    // Check source section present
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SOURCE));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SOURCE_TABLE));
    assertTrue (sHtml.contains ("Source Data"));

    // Check line anchors
    assertTrue (sHtml.contains ("id=\"L1\""));
    assertTrue (sHtml.contains ("id=\"L2\""));
    assertTrue (sHtml.contains ("id=\"L3\""));
    assertTrue (sHtml.contains ("id=\"L4\""));
    assertTrue (sHtml.contains ("href=\"#L1\""));

    // Check line numbers
    assertTrue (sHtml.contains (">1<"));
    assertTrue (sHtml.contains (">4<"));

    // Check content is present (XML-escaped)
    assertTrue (sHtml.contains ("&lt;invoice&gt;"));
    assertTrue (sHtml.contains ("&lt;id&gt;123&lt;/id&gt;"));

    // Check CSS classes on cells
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SOURCE_LINE_NUMBER));
    assertTrue (sHtml.contains (CPhiveHtmlCss.CSS_SOURCE_LINE_CONTENT));
  }

  @Test
  public void testSourceDataNotPresentWhenNull () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "No Source Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroElement eBody = new MicroElement ("body");
    new PhiveHtmlHelper (aDisplayLocale).ves (aVES).overallDurationMillis (50).applyTo (eBody, new ValidationResultList (null));

    final String sHtml = MicroWriter.getNodeAsString (eBody,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertFalse (sHtml.contains (CPhiveHtmlCss.CSS_SOURCE));
  }

  @Test
  public void testDefaultStylesheet () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Stylesheet Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .useDefaultCSS ()
                                                                    .overallDurationMillis (50)
                                                                    .createHtmlDocument (new ValidationResultList (null));
    assertNotNull (aDoc);

    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    // Default stylesheet should be present as inline style
    assertTrue (sHtml.contains ("<style>"));
    assertTrue (sHtml.contains (".phive-results"));
    assertTrue (sHtml.contains (".phive-summary-success"));
    assertTrue (sHtml.contains (".phive-summary-failure"));
    assertTrue (sHtml.contains (".phive-item-error"));
    assertTrue (sHtml.contains (".phive-source-table"));
  }

  @Test
  public void testDefaultStylesheetNotPresentByDefault () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "No Style Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .overallDurationMillis (50)
                                                                    .createHtmlDocument (new ValidationResultList (null));
    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    // No <style> element should be present
    assertFalse (sHtml.contains ("<style>"));
  }

  @Test
  public void testHtmlDocumentWithLang () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.FRENCH;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Lang Test",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final IMicroDocument aDoc = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                    .overallDurationMillis (50)
                                                                    .createHtmlDocument (new ValidationResultList (null));

    final String sHtml = MicroWriter.getNodeAsString (aDoc,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.NONE));
    assertTrue (sHtml.contains ("lang=\"fr\""));
  }

  @Test
  public void testCreatePageWithSuccess () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Test Extractor",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.XSD,
                                                           new ClassPathResource ("test/dummy.xsd"));
    final ErrorList aErrorList = new ErrorList ();
    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, 30);
    final ValidationResultList aVRL = new ValidationResultList (null);
    aVRL.add (aVR);

    final String sSourceData = "<invoice>\n" + "  <id>123</id>\n" + "  <total>100.00</total>\n" + "</invoice>";

    final IMicroDocument aHtml = new PhiveHtmlHelper (aDisplayLocale).ves (aVES)
                                                                     .validationDateTimeNow ()
                                                                     .overallDurationMillis (100)
                                                                     .sourceData (sSourceData)
                                                                     .useDefaultCSS ()
                                                                     .createHtmlDocument (aVRL);

    final String sHtml = MicroWriter.getNodeAsString (aHtml,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.INDENT_AND_ALIGN));
    assertNotNull (sHtml);

    SimpleFileIO.writeFile (new File ("target/test-report-success1.html"), sHtml.getBytes (StandardCharsets.UTF_8));
  }

  @Test
  public void testCreatePageWithError () throws DVRVersionException
  {
    final Locale aDisplayLocale = Locale.US;
    final DVRCoordinate aVESID = DVRCoordinate.create ("group", "art", "1.0");

    final ValidationExecutorSet <?> aVES = new ValidationExecutorSet <> (aVESID,
                                                                         "Test Extractor",
                                                                         ValidationExecutorSetStatus.createValidNow ());

    final ValidationArtefact aVA = new ValidationArtefact (EValidationType.XSD,
                                                           new ClassPathResource ("test/dummy.xsd"));
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ()
                               .errorID ("SCH-01")
                               .errorText ("Rule violated")
                               .errorLocation (new SimpleLocation ("doc.xml", 3, 27))
                               .build ());
    final ValidationResult aVR = new ValidationResult (aVA, aErrorList, 4321);
    final ValidationResultList aVRL = new ValidationResultList (null);
    aVRL.add (aVR);

    final String sSourceData = "<invoice>\n" + "  <id>123</id>\n" + "  <total>100.00</total>\n" + "</invoice>";

    final IMicroDocument aHtml = new PhiveHtmlHelper (aDisplayLocale).validationDateTimeNow ()
                                                                     .ves (aVES)
                                                                     .overallDurationMillis (12345)
                                                                     .sourceData (sSourceData)
                                                                     .useDefaultCSS ()
                                                                     .createHtmlDocument (aVRL);

    final String sHtml = MicroWriter.getNodeAsString (aHtml,
                                                      new XMLWriterSettings ().setIndent (EXMLSerializeIndent.INDENT_AND_ALIGN));
    assertNotNull (sHtml);

    SimpleFileIO.writeFile (new File ("target/test-report-error1.html"), sHtml.getBytes (StandardCharsets.UTF_8));
  }
}
