package com.helger.peppol.validation.supplementary.testsch;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.Set;
import java.util.TreeSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

  private static String _escape (final String s)
  {
    return s.replace ("\"", "\\\"");
  }

  public static void main (final String [] args) throws Exception
  {
    final Set <String> aExprs = new TreeSet <String> ();
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
          throw new SchematronPreprocessException ("Failed to preprocess schema " + aSchema + " with query binding " + aQueryBinding);

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
    final Writer w = new FileWriter (fOut);
    for (final String s : aExprs)
    {
      w.write ("_testOK (\"" + _escape (s) + "\");\n");
    }
    w.close ();
  }
}
