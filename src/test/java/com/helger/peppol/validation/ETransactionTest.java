/**
 * Version: MPL 1.1/EUPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at:
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Copyright The PEPPOL project (http://www.peppol.eu)
 *
 * Alternatively, the contents of this file may be used under the
 * terms of the EUPL, Version 1.1 or - as soon they will be approved
 * by the European Commission - subsequent versions of the EUPL
 * (the "Licence"); You may not use this work except in compliance
 * with the Licence.
 * You may obtain a copy of the Licence at:
 * http://joinup.ec.europa.eu/software/page/eupl/licence-eupl
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Licence is distributed on an "AS IS" basis,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the Licence for the specific language governing permissions and
 * limitations under the Licence.
 *
 * If you wish to allow use of your version of this file only
 * under the terms of the EUPL License and not to allow others to use
 * your version of this file under the MPL, indicate your decision by
 * deleting the provisions above and replace them with the notice and
 * other provisions required by the EUPL License. If you do not delete
 * the provisions above, a recipient may use your version of this file
 * under either the MPL or the EUPL License.
 */
package com.helger.peppol.validation;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.helger.commons.string.StringHelper;

/**
 * Test class for class {@link ETransaction}.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public final class ETransactionTest
{
  @Test
  public void testBasic ()
  {
    // Add one for the MLR which has no transaction ID!
    assertEquals (33 + 1, ETransaction.values ().length);

    for (final ETransaction eTransaction : ETransaction.values ())
    {
      assertTrue (StringHelper.hasText (eTransaction.getID ()));
      assertTrue (StringHelper.hasText (eTransaction.getName ()));
      assertTrue (eTransaction.getNumber () > 0);
      assertTrue (eTransaction.getTransactionID ().length () > 0);

      assertSame (eTransaction, ETransaction.valueOf (eTransaction.name ()));
      assertSame (eTransaction, ETransaction.getFromIDOrNull (eTransaction.getID ()));
    }

    // Compare with
    // http://www.cenbii.eu/wp-content/uploads/TransactionCustomisationID.pdf
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns001:ver2.0", ETransaction.T01.getTransactionID ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns001:ver2.0", ETransaction.T01.getTransactionID ());
    assertEquals ("2.0", ETransaction.T01.getVersionNumber ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns064A:ver1.0", ETransaction.T64A.getTransactionID ());
    assertEquals ("1.0", ETransaction.T64A.getVersionNumber ());
    assertEquals ("urn:www.cenbii.eu:transaction:biitrns064C:ver1.0", ETransaction.T64C.getTransactionID ());
    assertEquals ("1.0", ETransaction.T64C.getVersionNumber ());
  }
}
