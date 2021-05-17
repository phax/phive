package com.helger.phive.engine.vom;

import static org.junit.Assert.assertNotNull;

import java.io.File;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Test class for class {@link VOM1Marshaller}.
 *
 * @author Philip Helger
 */
public final class VOM1MarshallerTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VOM1MarshallerTest.class);

  @Test
  public void testReadExamples ()
  {
    final VOM1Marshaller m = new VOM1Marshaller ();
    for (final String s : new String [] { "examples-ves.xml",
                                          "examples-ves-edifact-based.xml",
                                          "examples-ves-xrechnung-200-ublinv.xml" })
    {
      LOGGER.info ("Reading " + s);
      assertNotNull (m.read (new File ("src/test/resources/vom/" + s)));
    }
  }
}
