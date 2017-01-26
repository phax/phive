/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol.supplementary.testsch;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.error.list.IErrorList;
import com.helger.commons.io.file.iterate.FileSystemRecursiveIterator;
import com.helger.schematron.xslt.SchematronResourceSCH;
import com.helger.xml.transform.CollectingTransformErrorListener;

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

        final IErrorList aREG = aCEL.getErrorList ();
        if (aREG.containsAtLeastOneFailure ())
        {
          s_aLogger.error (aREG.toString ());
        }
      }
  }
}
