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

import java.io.InputStream;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.verapdf.gf.foundry.VeraGreenfieldFoundryProvider;
import org.verapdf.pdfa.Foundries;
import org.verapdf.pdfa.PDFAParser;
import org.verapdf.pdfa.PDFAValidator;
import org.verapdf.pdfa.flavours.PDFAFlavour;
import org.verapdf.pdfa.results.TestAssertion;
import org.verapdf.pdfa.results.ValidationResult;

import com.helger.base.io.nonblocking.NonBlockingByteArrayInputStream;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.ICommonsList;

/**
 * Test helper that checks PDFs with veraPDF.
 *
 * @author Philip Helger
 */
final class PdfAValidatorHelper
{
  private static boolean s_bInitialised = false;

  private PdfAValidatorHelper ()
  {}

  private static synchronized void _ensureInitialised ()
  {
    if (!s_bInitialised)
    {
      VeraGreenfieldFoundryProvider.initialise ();
      s_bInitialised = true;
    }
  }

  /**
   * Validate the provided PDF with veraPDF.
   *
   * @param aPdfBytes
   *        The PDF to validate. May not be <code>null</code>.
   * @param eFlavour
   *        The flavour to validate against. May be <code>null</code> to use the PDF/A flavour that
   *        the PDF declares.
   * @return The messages of all failed rules. Never <code>null</code> but maybe empty.
   * @throws Exception
   *         on error
   */
  @NonNull
  static ICommonsList <String> validate (final byte @NonNull [] aPdfBytes, @Nullable final PDFAFlavour eFlavour)
                                                                                                                throws Exception
  {
    _ensureInitialised ();
    final ICommonsList <String> ret = new CommonsArrayList <> ();
    try (final InputStream aIS = new NonBlockingByteArrayInputStream (aPdfBytes);
         final PDFAParser aParser = Foundries.defaultInstance ()
                                             .createParser (aIS,
                                                            eFlavour != null ? eFlavour : PDFAFlavour.NO_FLAVOUR);
         final PDFAValidator aValidator = Foundries.defaultInstance ()
                                                   .createValidator (eFlavour != null ? eFlavour
                                                                                      : aParser.getFlavour (),
                                                                     false))
    {
      final ValidationResult aResult = aValidator.validate (aParser);
      for (final TestAssertion aTA : aResult.getTestAssertions ())
        if (aTA.getStatus () == TestAssertion.Status.FAILED)
          ret.add (aTA.getRuleId ().getClause () +
                   "-" +
                   aTA.getRuleId ().getTestNumber () +
                   ": " +
                   aTA.getMessage ());
      if (ret.isEmpty () && !aResult.isCompliant ())
        ret.add ("Not compliant, but no failed rule was reported");
    }
    return ret;
  }

  /**
   * Get the PDF/A flavour the PDF declares.
   *
   * @param aPdfBytes
   *        The PDF to check. May not be <code>null</code>.
   * @return The flavour ID, e.g. "3b". Never <code>null</code>.
   * @throws Exception
   *         on error
   */
  @NonNull
  static String getDeclaredFlavourID (final byte @NonNull [] aPdfBytes) throws Exception
  {
    _ensureInitialised ();
    try (final InputStream aIS = new NonBlockingByteArrayInputStream (aPdfBytes);
         final PDFAParser aParser = Foundries.defaultInstance ().createParser (aIS, PDFAFlavour.NO_FLAVOUR))
    {
      return aParser.getFlavour ().getId ();
    }
  }
}
