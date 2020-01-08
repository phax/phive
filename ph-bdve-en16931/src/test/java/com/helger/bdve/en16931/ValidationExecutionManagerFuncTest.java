/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.en16931;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Locale;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.helger.bdve.en16931.mock.CTestFiles;
import com.helger.bdve.execute.ValidationExecutionManager;
import com.helger.bdve.executorset.IValidationExecutorSet;
import com.helger.bdve.mock.MockFile;
import com.helger.bdve.result.ValidationResultList;
import com.helger.bdve.source.IValidationSource;
import com.helger.bdve.source.ValidationSource;
import com.helger.cii.d16b.CIID16BNamespaceContext;
import com.helger.commons.error.IError;
import com.helger.commons.io.resource.FileSystemResource;
import com.helger.commons.string.StringHelper;
import com.helger.xml.namespace.MapBasedNamespaceContext;
import com.helger.xml.serialize.read.DOMReader;
import com.helger.xml.xpath.MapBasedXPathVariableResolver;
import com.helger.xml.xpath.XPathHelper;

/**
 * Test class for class {@link ValidationExecutionManager}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutionManagerFuncTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (ValidationExecutionManagerFuncTest.class);

  @Test
  public void testTestFiles ()
  {
    for (final MockFile aTestFile : CTestFiles.getAllTestFiles ())
    {
      final IValidationExecutorSet aExecutors = CTestFiles.VES_REGISTRY.getOfID (aTestFile.getVESID ());
      assertNotNull (aExecutors);
      final ValidationExecutionManager aValidator = aExecutors.createExecutionManager ();

      LOGGER.info ("Validating " +
                   aTestFile.getResource ().getPath () +
                   " against " +
                   aExecutors.getExecutorCount () +
                   " validation layers using " +
                   aTestFile.getVESID ().getAsSingleID ());

      // Read as desired type
      final IValidationSource aSource = ValidationSource.createXMLSource (aTestFile.getResource ());
      final ValidationResultList aErrors = aValidator.executeValidation (aSource, Locale.US);
      if (aTestFile.isGoodCase ())
        assertTrue (aErrors.getAllCount (IError::isError) +
                    " error(s):\n" +
                    StringHelper.getImploded ('\n', aErrors.getAllErrors ()),
                    aErrors.containsNoError ());
      else
        assertTrue (aErrors.containsAtLeastOneError ());
    }
  }

  @Test
  public void testXPath_BR_S_08 () throws Exception
  {
    final Document aDoc = DOMReader.readXMLDOM (new FileSystemResource ("src/test/resources/test-files/1.0.0/cii/CII_business_example_02.xml"));
    assertNotNull (aDoc);
    assertNotNull (aDoc.getDocumentElement ());

    // Saxon required for XPath 2
    final XPathFactory aXF = XPathHelper.createXPathFactorySaxonFirst ();
    final XPath aXP = aXF.newXPath ();
    final MapBasedNamespaceContext aCtx = CIID16BNamespaceContext.getInstance ().getClone ();
    aXP.setNamespaceContext (aCtx);
    final XPathExpression aXE = aXP.compile ("//ram:ApplicableHeaderTradeSettlement/ram:ApplicableTradeTax/ram:CategoryCode[.='S']");

    final NodeList aMatches = (NodeList) aXE.evaluate (aDoc.getDocumentElement (), XPathConstants.NODESET);
    assertNotNull (aMatches);
    assertEquals (1, aMatches.getLength ());

    final String sSum1 = "round(sum(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedLineTradeSettlement[ram:ApplicableTradeTax/ram:CategoryCode = 'S' and ram:ApplicableTradeTax/ram:RateApplicablePercent =$rate]/ram:SpecifiedTradeSettlementLineMonetarySummation/ram:LineTotalAmount) *10*10) div 100";
    final String sSum2 = "round(sum(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeAllowanceCharge[ram:ChargeIndicator/udt:Indicator='true' and ram:CategoryTradeTax/ram:CategoryCode='S' and ram:CategoryTradeTax/ram:RateApplicablePercent=$rate]/ram:ActualAmount) *10*10) div 100";
    final String sSum3 = "round(sum(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeAllowanceCharge[ram:ChargeIndicator/udt:Indicator='false' and ram:CategoryTradeTax/ram:CategoryCode='S' and ram:CategoryTradeTax/ram:RateApplicablePercent=$rate]/ram:ActualAmount) *10*10) div 100";
    final XPathExpression aXE2 = aXP.compile ("every $rate in ../ram:RateApplicablePercent satisfies (../ram:BasisAmount = " +
                                              "   " +
                                              sSum1 +
                                              " +  " +
                                              sSum2 +
                                              " - " +
                                              sSum3 +
                                              ")");

    for (int i = 0; i < aMatches.getLength (); ++i)
    {
      final Node aCurMatch = aMatches.item (i);

      final Number aBasisAmount = (Number) aXP.evaluate ("../ram:BasisAmount", aCurMatch, XPathConstants.NUMBER);
      final Number aRate = (Number) aXP.evaluate ("../ram:RateApplicablePercent", aCurMatch, XPathConstants.NUMBER);
      if (false)
      {
        final MapBasedXPathVariableResolver aVR = new MapBasedXPathVariableResolver ();
        aVR.addUniqueVariable ("rate", aRate);
        aXP.setXPathVariableResolver (aVR);

        System.out.println (aBasisAmount);
        System.out.println (aRate + "%");
        System.out.println (aXP.evaluate (sSum1, aCurMatch, XPathConstants.NUMBER));
        System.out.println (aXP.evaluate (sSum2, aCurMatch, XPathConstants.NUMBER));
        System.out.println (aXP.evaluate (sSum3, aCurMatch, XPathConstants.NUMBER));
        System.out.println ("SUM: " +
                            aXP.evaluate (sSum1 + " +  " + sSum2 + " - " + sSum3, aCurMatch, XPathConstants.NUMBER));
        System.out.println ("Equals: " +
                            aXP.evaluate ("../ram:BasisAmount = " + sSum1 + " +  " + sSum2 + " - " + sSum3,
                                          aCurMatch,
                                          XPathConstants.BOOLEAN));

        aXP.setXPathVariableResolver (null);
      }
      final boolean bOkay = ((Boolean) aXE2.evaluate (aCurMatch, XPathConstants.BOOLEAN)).booleanValue ();
      assertTrue ("Match[" + i + "]", bOkay);
    }
  }

  @Test
  public void testXPath_BR_O_08 () throws Exception
  {
    final Document aDoc = DOMReader.readXMLDOM (new FileSystemResource ("src/test/resources/test-files/1.0.0/cii/CII_example7.xml"));
    assertNotNull (aDoc);
    assertNotNull (aDoc.getDocumentElement ());

    // Saxon required for XPath 2
    final XPathFactory aXF = XPathHelper.createXPathFactorySaxonFirst ();
    final XPath aXP = aXF.newXPath ();
    final MapBasedNamespaceContext aCtx = CIID16BNamespaceContext.getInstance ().getClone ();
    aXP.setNamespaceContext (aCtx);
    final XPathExpression aXE = aXP.compile ("//rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:ApplicableTradeTax[ram:CategoryCode = 'O']");

    final NodeList aMatches = (NodeList) aXE.evaluate (aDoc.getDocumentElement (), XPathConstants.NODESET);
    assertNotNull (aMatches);
    assertEquals (1, aMatches.getLength ());

    final String sSum1 = "(round(sum(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:IncludedSupplyChainTradeLineItem/ram:SpecifiedLineTradeSettlement[ram:ApplicableTradeTax/ram:CategoryCode = 'O']/ram:SpecifiedTradeSettlementLineMonetarySummation/ram:LineTotalAmount)*10*10)div 100) ";
    final String sSum2 = "(round(sum(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeAllowanceCharge[ram:ChargeIndicator/udt:Indicator='true' and ram:CategoryTradeTax/ram:CategoryCode='O']/ram:ActualAmount)*10*10)div 100)";
    final String sSum3 = "(round(sum(/rsm:CrossIndustryInvoice/rsm:SupplyChainTradeTransaction/ram:ApplicableHeaderTradeSettlement/ram:SpecifiedTradeAllowanceCharge[ram:ChargeIndicator/udt:Indicator='false' and ram:CategoryTradeTax/ram:CategoryCode='O']/ram:ActualAmount)*10*10)div 100)";
    final XPathExpression aXE2 = aXP.compile ("ram:BasisAmount = " +
                                              "   " +
                                              sSum1 +
                                              " +  " +
                                              sSum2 +
                                              " - " +
                                              sSum3 +
                                              "");

    for (int i = 0; i < aMatches.getLength (); ++i)
    {
      final Node aCurMatch = aMatches.item (i);

      final Number aBasisAmount = (Number) aXP.evaluate ("ram:BasisAmount", aCurMatch, XPathConstants.NUMBER);
      if (false)
      {
        System.out.println (aBasisAmount);
        System.out.println (aXP.evaluate (sSum1, aCurMatch, XPathConstants.NUMBER));
        System.out.println (aXP.evaluate (sSum2, aCurMatch, XPathConstants.NUMBER));
        System.out.println (aXP.evaluate (sSum3, aCurMatch, XPathConstants.NUMBER));
      }
      final boolean bOkay = ((Boolean) aXE2.evaluate (aCurMatch, XPathConstants.BOOLEAN)).booleanValue ();
      assertTrue ("Match[" + i + "]", bOkay);
    }
  }
}
