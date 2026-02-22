package com.helger.phive.api.validity;

import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.base.string.StringHelper;

/**
 * Test class for class {@link EExtendedValidity}.
 *
 * @author Philip Helger
 */
public final class EExtendedValidityTest
{
  @Test
  public void testBasic ()
  {
    for (final var e : EExtendedValidity.values ())
    {
      assertTrue (StringHelper.isNotEmpty (e.getID ()));
      assertTrue (e.isDefined () || e.isUndefined ());
      assertSame (e, EExtendedValidity.getFromIDOrNull (e.getID ()));
    }
  }
}
