package com.helger.peppol.validation.supplementary.createrules;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Test class for class {@link ERuleSourceThirdparty}.
 *
 * @author Philip Helger
 */
public final class ERuleSourceThirdpartyTest
{
  @Test
  public void testFilesPresent ()
  {
    for (final ERuleSourceThirdparty e : ERuleSourceThirdparty.values ())
    {
      assertTrue (e.getRuleFile ().exists ());
    }
  }
}
