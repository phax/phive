/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.spec;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.bdve.spec.EBIITransaction;
import com.helger.commons.string.StringHelper;

/**
 * Test class for class {@link EBIITransaction}.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class EBIITransactionTest
{
  @Test
  public void testBasic ()
  {
    // Add one for the MLR which has no transaction ID!
    assertEquals (35 + 1, EBIITransaction.values ().length);

    for (final EBIITransaction eTransaction : EBIITransaction.values ())
    {
      assertTrue (StringHelper.hasText (eTransaction.getID ()));
      assertTrue (StringHelper.hasText (eTransaction.getName ()));
      assertTrue (eTransaction.getNumber () > 0);
      assertNotNull (eTransaction.getSubNumber ());
      assertTrue (StringHelper.hasText (eTransaction.getTransactionKey ()));
      assertTrue (StringHelper.hasText (eTransaction.getTransactionKeyShort ()));
      assertNotNull (eTransaction.getJAXBDocumentType ());

      assertSame (eTransaction, EBIITransaction.valueOf (eTransaction.name ()));
      assertSame (eTransaction, EBIITransaction.getFromIDOrNull (eTransaction.getID ()));
    }

    // Compare with
    // http://www.cenbii.eu/wp-content/uploads/TransactionCustomisationID.pdf
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns001:ver2.0", EBIITransaction.T01.getID ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns001:ver2.0", EBIITransaction.T01.getID ());
    assertEquals ("2.0", EBIITransaction.T01.getVersionNumber ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns064A:ver1.0", EBIITransaction.T64A.getID ());
    assertEquals ("1.0", EBIITransaction.T64A.getVersionNumber ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns064C:ver1.0", EBIITransaction.T64C.getID ());
    assertEquals ("1.0", EBIITransaction.T64C.getVersionNumber ());
  }
}
