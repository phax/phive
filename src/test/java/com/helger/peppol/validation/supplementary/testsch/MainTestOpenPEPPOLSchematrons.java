package com.helger.peppol.validation.supplementary.testsch;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.error.IResourceErrorGroup;
import com.helger.commons.io.file.iterate.FileSystemRecursiveIterator;
import com.helger.commons.xml.transform.CollectingTransformErrorListener;
import com.helger.schematron.xslt.SchematronResourceSCH;

public final class MainTestOpenPEPPOLSchematrons
{
  private static final Logger s_aLogger = LoggerFactory.getLogger (MainTestOpenPEPPOLSchematrons.class);

  public static void main (final String [] args)
  {
    final String sPathSep = File.separator;
    for (final File f : new FileSystemRecursiveIterator (new File ("src/test/resources/openpeppol")))
      if (f.isFile () &&
          f.getName ().endsWith (".sch") &&
          !f.getAbsolutePath ().contains (sPathSep + "abstract" + sPathSep) &&
          !f.getAbsolutePath ().contains (sPathSep + "codelist" + sPathSep) &&
          !f.getAbsolutePath ().contains (sPathSep + "UBL" + sPathSep))
      {
        s_aLogger.info (f.getAbsolutePath ());
        final CollectingTransformErrorListener aCEL = new CollectingTransformErrorListener ();
        final SchematronResourceSCH aRes = SchematronResourceSCH.fromFile (f);
        aRes.setUseCache (false);
        aRes.setErrorListener (aCEL);
        aRes.isValidSchematron ();

        final IResourceErrorGroup aREG = aCEL.getResourceErrors ();
        if (aREG.containsAtLeastOneFailure ())
        {
          s_aLogger.error (aREG.toString ());
        }
      }
  }
}
