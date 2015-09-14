package com.helger.peppol.validation.supplementary.createrules;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Test class for class {@link ERuleSource}.
 *
 * @author Philip Helger
 */
public final class ERuleSourceTest
{
  @Test
  public void testFilesPresent ()
  {
    for (final ERuleSource e : ERuleSource.values ())
    {
      if (e.hasBIICoreFile ())
        assertTrue (e.getBIICoreSchematronFile ().exists ());
      if (e.hasBIIRules ())
        assertTrue (e.getBIIRuleFile ().exists ());
      if (e.hasOpenPEPPOLRules ())
        assertTrue (e.getOpenPEPPOLRuleFile ().exists ());
    }
  }
}
