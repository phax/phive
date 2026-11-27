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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.jspecify.annotations.NonNull;
import org.junit.Test;

import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.state.EValidity;
import com.helger.collection.commons.CommonsHashSet;
import com.helger.collection.commons.ICommonsSet;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.schematron.model.PSAssertReport;
import com.helger.schematron.model.PSPattern;
import com.helger.schematron.model.PSSchema;
import com.helger.schematron.pure.SchematronResourcePureXPath;

/**
 * Test class for class {@link SchematronZipResolver}.
 *
 * @author Philip Helger
 */
public final class SchematronZipResolverTest
{
  private static final String NS = " xmlns='http://purl.oclc.org/dsdl/schematron'";

  /** Main Schematron in a sub directory, with an abstract pattern and an include */
  private static final String MAIN_SCH = "<schema" +
                                         NS +
                                         " queryBinding='xslt2'>" +
                                         "<pattern abstract='true' id='requires'>" +
                                         "<rule context='$ctx'><assert test='$child'>child is missing</assert></rule>" +
                                         "</pattern>" +
                                         "<pattern is-a='requires' id='p-root'>" +
                                         "<param name='ctx' value='/root'/><param name='child' value='item'/>" +
                                         "</pattern>" +
                                         "<include href='rules/patterns.sch'/>" +
                                         "</schema>";

  /** Included from the main Schematron; includes a rule from the parent directory with an anchor */
  private static final String PATTERNS_SCH = "<pattern" +
                                             NS +
                                             " id='p-inc'>" +
                                             "<include href='../common/rules.xml#r-name'/>" +
                                             "</pattern>";

  private static final String RULES_XML = "<rules" +
                                          NS +
                                          ">" +
                                          "<rule id='r-other' context='/root'><assert test='false()'>other</assert></rule>" +
                                          "<rule id='r-name' context='/root/item'>" +
                                          "<assert test='@name'>name is missing</assert>" +
                                          "<report test='@name = \"forbidden\"'>forbidden name</report>" +
                                          "</rule>" +
                                          "</rules>";

  private static byte @NonNull [] _zip (@NonNull final String... aNamesAndContents) throws IOException
  {
    final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ();
    try (final ZipOutputStream aZOS = new ZipOutputStream (aBAOS))
    {
      for (int i = 0; i < aNamesAndContents.length; i += 2)
      {
        aZOS.putNextEntry (new ZipEntry (aNamesAndContents[i]));
        aZOS.write (aNamesAndContents[i + 1].getBytes (StandardCharsets.UTF_8));
        aZOS.closeEntry ();
      }
    }
    return aBAOS.toByteArray ();
  }

  @NonNull
  private static String _resolveError (final byte @NonNull [] aZip, @NonNull final String sMainPath)
  {
    final ErrorList aErrorList = new ErrorList ();
    assertNull (new SchematronZipResolver ().getResolvedSchematron (aZip, sMainPath, aErrorList));
    assertTrue (aErrorList.containsAtLeastOneError ());
    return aErrorList.toString ();
  }

  @NonNull
  private static EValidity _validate (final byte @NonNull [] aSch, @NonNull final String sXML) throws Exception
  {
    final SchematronResourcePureXPath aSchRes = SchematronResourcePureXPath.builderFromByteArray (aSch).build ();
    assertTrue (aSchRes.isValidSchematron ());
    return aSchRes.getSchematronValidity (new ReadableResourceByteArray (sXML.getBytes (StandardCharsets.UTF_8)));
  }

  @Test
  public void testResolveNestedIncludes () throws Exception
  {
    final byte [] aZip = _zip ("sch/main.sch",
                               MAIN_SCH,
                               "sch/rules/patterns.sch",
                               PATTERNS_SCH,
                               "sch/common/rules.xml",
                               RULES_XML);
    final ErrorList aErrorList = new ErrorList ();
    // Windows separator and no leading slash
    final PSSchema aSchema = new SchematronZipResolver ().getResolvedSchematron (aZip, "sch\\main.sch", aErrorList);
    assertNotNull (aErrorList.toString (), aSchema);
    assertTrue (aErrorList.toString (), aErrorList.containsNoError ());

    // Includes and abstract patterns are resolved
    assertFalse (aSchema.hasAnyInclude ());
    assertTrue (aSchema.isPreprocessed ());
    final ICommonsSet <String> aPatternIDs = new CommonsHashSet <> ();
    for (final PSPattern aPattern : aSchema.getAllPatterns ())
    {
      assertFalse (aPattern.isAbstract ());
      aPatternIDs.add (aPattern.getID ());
    }
    assertEquals (new CommonsHashSet <> ("p-root", "p-inc"), aPatternIDs);

    // Only the anchored rule was included, with its report
    final PSPattern aIncPattern = aSchema.getAllPatterns ().findFirst (x -> "p-inc".equals (x.getID ()));
    assertEquals (1, aIncPattern.getRuleCount ());
    assertEquals ("/root/item", aIncPattern.getAllRules ().get (0).getContext ());
    // The report is kept and not converted to an assert
    assertEquals (1, aIncPattern.getAllRules ().get (0).getAllAssertReports ().getCount (PSAssertReport::isReport));

    // The serialised Schematron is self-contained and usable
    final byte [] aSch = SchematronZipResolver.getSchematronAsBytes (aSchema);
    final String sSch = new String (aSch, StandardCharsets.UTF_8);
    assertFalse (sSch, sSch.contains ("include"));
    assertFalse (sSch, sSch.contains ("abstract"));
    assertTrue (sSch, sSch.contains ("forbidden name"));
    assertTrue (_validate (aSch, "<root><item name='a'/></root>").isValid ());
    assertTrue (_validate (aSch, "<root/>").isInvalid ());
    assertTrue (_validate (aSch, "<root><item/></root>").isInvalid ());
  }

  @Test
  public void testParentPathStaysInZipRoot () throws IOException
  {
    // "../../common/rules.xml" relative to "/rules/" is clamped to "/common/rules.xml"
    final byte [] aZip = _zip ("main.sch",
                               "<schema" + NS + "><include href='rules/patterns.sch'/></schema>",
                               "rules/patterns.sch",
                               "<pattern" + NS + " id='p'><include href='../../common/rules.xml#r-name'/></pattern>",
                               "common/rules.xml",
                               RULES_XML);
    final ErrorList aErrorList = new ErrorList ();
    assertNotNull (aErrorList.toString (),
                   new SchematronZipResolver ().getResolvedSchematron (aZip, "/main.sch", aErrorList));
  }

  @Test
  public void testIncludeNotInZip () throws IOException
  {
    final String sError = _resolveError (_zip ("main.sch",
                                               "<schema" + NS + "><include href='rules/missing.sch'/></schema>"),
                                         "main.sch");
    assertTrue (sError, sError.contains ("'/rules/missing.sch', which is not contained in the ZIP file"));
  }

  @Test
  public void testIncludeAbsoluteURL () throws IOException
  {
    // Never resolved from the network or the file system
    String sError = _resolveError (_zip ("main.sch",
                                         "<schema" + NS + "><include href='http://www.example.org/a.sch'/></schema>"),
                                   "main.sch");
    assertTrue (sError, sError.contains ("must be a relative path inside the ZIP file"));

    sError = _resolveError (_zip ("main.sch", "<schema" + NS + "><include href='file:///etc/passwd'/></schema>"),
                            "main.sch");
    assertTrue (sError, sError.contains ("must be a relative path inside the ZIP file"));
  }

  @Test
  public void testMainMissing () throws IOException
  {
    final String sError = _resolveError (_zip ("other.sch", MAIN_SCH), "main.sch");
    assertTrue (sError, sError.contains ("does not contain the main Schematron '/main.sch'"));
  }

  @Test
  public void testNotAZip ()
  {
    final String sError = _resolveError ("not a zip".getBytes (StandardCharsets.UTF_8), "main.sch");
    assertTrue (sError, sError.contains ("Schematron ZIP file is not a ZIP archive"));
  }

  @Test
  public void testNoSchematron () throws IOException
  {
    final String sError = _resolveError (_zip ("main.sch", "<root/>"), "main.sch");
    assertTrue (sError, sError.contains ("Failed to resolve the Schematron from the ZIP file"));
  }

  @Test
  public void testMaxZipEntryCount () throws IOException
  {
    final byte [] aZip = _zip ("main.sch", MAIN_SCH, "rules/patterns.sch", PATTERNS_SCH, "common/rules.xml", RULES_XML);
    final ErrorList aErrorList = new ErrorList ();
    assertNull (new SchematronZipResolver ().setMaxZipEntryCount (2)
                                            .getResolvedSchematron (aZip, "main.sch", aErrorList));
    assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("more than 2 entries"));
  }

  @Test
  public void testMaxUnzippedSize () throws IOException
  {
    final byte [] aZip = _zip ("main.sch", MAIN_SCH);
    final ErrorList aErrorList = new ErrorList ();
    assertNull (new SchematronZipResolver ().setMaxUnzippedSize (MAIN_SCH.length () - 1)
                                            .getResolvedSchematron (aZip, "main.sch", aErrorList));
    assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("exceeds maximum unzipped size"));
  }

  @Test
  public void testPreviousErrorsAreIgnored () throws IOException
  {
    final byte [] aZip = _zip ("main.sch", MAIN_SCH, "rules/patterns.sch", PATTERNS_SCH, "common/rules.xml", RULES_XML);
    final ErrorList aErrorList = new ErrorList ();
    aErrorList.add (SingleError.builderError ().errorText ("previous error").build ());
    assertNotNull (new SchematronZipResolver ().getResolvedSchematron (aZip, "main.sch", aErrorList));
    assertEquals (1, aErrorList.size ());
  }
}
