package com.helger.phive.api.executorset.status;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.time.OffsetDateTime;

import org.junit.Test;

import com.helger.commons.datetime.PDTFactory;
import com.helger.commons.mock.CommonsTestHelper;

/**
 * Test class for class {@link ValidationExecutorSetStatus}.
 *
 * @author Philip Helger
 */
public final class ValidationExecutorSetStatusTest
{
  @Test
  public void testEmpty ()
  {
    final OffsetDateTime aNow = PDTFactory.getCurrentOffsetDateTimeMillisOnlyUTC ();
    final ValidationExecutorSetStatus aStatus = ValidationExecutorSetStatus.createValidAt (aNow);
    assertEquals (aNow, aStatus.getStatusLastModification ());
    assertSame (EValidationExecutorStatusType.VALID, aStatus.getType ());
    assertNull (aStatus.getValidFrom ());
    assertNull (aStatus.getValidTo ());
    assertNull (aStatus.getDeprecationReason ());
    assertNull (aStatus.getReplacementVESID ());

    CommonsTestHelper.testDefaultImplementationWithEqualContentObject (aStatus,
                                                                       ValidationExecutorSetStatus.createValidAt (aNow));
    CommonsTestHelper.testDefaultImplementationWithDifferentContentObject (aStatus,
                                                                           ValidationExecutorSetStatus.createValidAt (aNow.plusMinutes (1)));
  }
}
