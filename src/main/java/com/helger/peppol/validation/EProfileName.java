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

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotations.Translatable;
import com.helger.commons.name.IHasDisplayText;
import com.helger.commons.text.impl.TextProvider;
import com.helger.commons.text.resolve.DefaultTextResolver;

/**
 * Contains the names of the CEN BII2 profiles for later translation.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
@Translatable
public enum EProfileName implements IHasDisplayText {
  BII_MLR ("Message Level Response"),
  BII01 ("Catalogue Only"),
  BII02 ("Catalogue Update"),
  BII03 ("Order Only"),
  BII04 ("Invoice Only"),
  BII05 ("Billing"),
  BII06 ("Procurement"),
  BII10 ("eNotification"),
  BII11 ("Qualification"),
  BII12 ("Tendering Simple"),
  BII16 ("Catalogue Deletion"),
  BII17 ("Multi Party Catalogue"),
  BII21 ("Statement"),
  BII22 ("Call for Tender"),
  BII27 ("Advanced Ordering"),
  BII28 ("Ordering"),
  BII30 ("Dispatch Only"),
  BII31 ("Reminder Only"),
  BII32 ("Simple Ordering"),
  BII33 ("Catalogue Subscription"),
  BII34 ("Call for Tender with Catalogue Template"),
  BII35 ("Tendering Simple with Catalogue");

  private final TextProvider m_aTP;

  private EProfileName (@Nonnull final String sEN) {
    m_aTP = TextProvider.create_EN (sEN);
  }

  @Nullable
  public String getDisplayText (@Nonnull final Locale aContentLocale) {
    return DefaultTextResolver.getText (this, m_aTP, aContentLocale);
  }
}
