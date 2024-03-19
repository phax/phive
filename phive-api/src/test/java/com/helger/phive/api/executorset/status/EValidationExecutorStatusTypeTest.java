package com.helger.phive.api.executorset.status;

import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.commons.string.StringHelper;

/**
 * Test class for class {@link EValidationExecutorStatusType}.
 *
 * @author Philip Helger
 */
public final class EValidationExecutorStatusTypeTest
{
  @Test
  public void testBasic ()
  {
    for (final EValidationExecutorStatusType e : EValidationExecutorStatusType.values ())
    {
      assertTrue (StringHelper.hasText (e.getID ()));
      assertSame (e, EValidationExecutorStatusType.getFromIDOrNull (e.getID ()));
    }

    assertNull (EValidationExecutorStatusType.getFromIDOrNull ("blafoo"));
  }
}
