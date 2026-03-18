/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.api;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * Test class for class {@link EValidationBaseType}.
 *
 * @author Philip Helger
 */
public final class EValidationBaseTypeTest
{
  @Test
  public void testAll ()
  {
    for (final EValidationBaseType e : EValidationBaseType.values ())
    {
      assertNotNull (e.getID ());
      assertNotNull (e.getName ());
      assertSame (e, EValidationBaseType.getFromIDOrNull (e.getID ()));
    }
  }

  @Test
  public void testGetFromIDOrNull ()
  {
    assertNull (EValidationBaseType.getFromIDOrNull (null));
    assertNull (EValidationBaseType.getFromIDOrNull (""));
    assertNull (EValidationBaseType.getFromIDOrNull ("invalid-id"));
    assertSame (EValidationBaseType.XML, EValidationBaseType.getFromIDOrNull ("xml"));
    assertSame (EValidationBaseType.XSD, EValidationBaseType.getFromIDOrNull ("xsd"));
    assertSame (EValidationBaseType.SCHEMATRON, EValidationBaseType.getFromIDOrNull ("sch"));
  }

  @Test
  public void testTypeChecks ()
  {
    assertTrue (EValidationBaseType.XML.isXML ());
    assertFalse (EValidationBaseType.XML.isXSD ());
    assertFalse (EValidationBaseType.XML.isSchematron ());
    assertFalse (EValidationBaseType.XML.isEdifact ());

    assertFalse (EValidationBaseType.XSD.isXML ());
    assertTrue (EValidationBaseType.XSD.isXSD ());

    assertFalse (EValidationBaseType.SCHEMATRON.isXML ());
    assertTrue (EValidationBaseType.SCHEMATRON.isSchematron ());

    assertTrue (EValidationBaseType.EDIFACT.isEdifact ());
    assertFalse (EValidationBaseType.EDIFACT.isXML ());
  }
}
