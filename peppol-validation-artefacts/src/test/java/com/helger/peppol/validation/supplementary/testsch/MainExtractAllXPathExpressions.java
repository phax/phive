/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.supplementary.testsch;

import java.io.File;
import java.io.OutputStreamWriter;
import java.io.Writer;

import javax.annotation.Nonnull;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.charset.CCharset;
import com.helger.commons.collection.ext.CommonsTreeSet;
import com.helger.commons.collection.ext.ICommonsSortedSet;
import com.helger.commons.io.file.FileHelper;
import com.helger.commons.io.file.iterate.FileSystemRecursiveIterator;
import com.helger.commons.io.resource.FileSystemResource;
import com.helger.commons.string.StringHelper;
import com.helger.schematron.pure.binding.IPSQueryBinding;
import com.helger.schematron.pure.binding.PSQueryBindingRegistry;
import com.helger.schematron.pure.exchange.PSReader;
import com.helger.schematron.pure.model.PSAssertReport;
import com.helger.schematron.pure.model.PSPattern;
import com.helger.schematron.pure.model.PSRule;
import com.helger.schematron.pure.model.PSSchema;
import com.helger.schematron.pure.preprocess.PSPreprocessor;
import com.helger.schematron.pure.preprocess.SchematronPreprocessException;

public final class MainExtractAllXPathExpressions
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (MainExtractAllXPathExpressions.class);

  private static String _escape (@Nonnull final String s)
  {
    return StringHelper.replaceAll (s, "\"", "\\\"");
  }

  public static void main (final String [] args) throws Exception
  {
    final ICommonsSortedSet <String> aExprs = new CommonsTreeSet <> ();
    final String sPathSep = File.separator;
    for (final File f : new FileSystemRecursiveIterator (new File ("src/test/resources/")))
      if (f.isFile () &&
          f.getName ().endsWith (".sch") &&
          !f.getAbsolutePath ().contains (sPathSep + "rule-source" + sPathSep) &&
          !f.getAbsolutePath ().contains (sPathSep + "abstract" + sPathSep) &&
          !f.getAbsolutePath ().contains (sPathSep + "codelist" + sPathSep) &&
          !f.getAbsolutePath ().contains (sPathSep + "UBL" + sPathSep))
      {
        s_aLogger.info (f.getAbsolutePath ());

        final PSSchema aSchema = new PSReader (new FileSystemResource (f)).readSchema ();

        // Resolve the query binding to be used
        final IPSQueryBinding aQueryBinding = PSQueryBindingRegistry.getQueryBindingOfNameOrThrow (aSchema.getQueryBinding ());

        // Pre-process schema
        final PSPreprocessor aPreprocessor = PSPreprocessor.createPreprocessorWithoutInformationLoss (aQueryBinding);
        final PSSchema aPreprocessedSchema = aPreprocessor.getAsPreprocessedSchema (aSchema);
        if (aPreprocessedSchema == null)
          throw new SchematronPreprocessException ("Failed to preprocess schema " +
                                                   aSchema +
                                                   " with query binding " +
                                                   aQueryBinding);

        for (final PSPattern aPattern : aPreprocessedSchema.getAllPatterns ())
          for (final PSRule aRule : aPattern.getAllRules ())
          {
            if (StringHelper.hasText (aRule.getContext ()))
              aExprs.add (aRule.getContext ());
            for (final PSAssertReport aAssert : aRule.getAllAssertReports ())
              aExprs.add (aAssert.getTest ());
          }
      }

    final File fOut = new File ("test-xpaths.txt");
    try (final Writer w = new OutputStreamWriter (FileHelper.getOutputStream (fOut), CCharset.CHARSET_UTF_8_OBJ))
    {
      for (final String s : aExprs)
        w.write ("_testOK (\"" + _escape (s) + "\");\n");
    }
  }
}
