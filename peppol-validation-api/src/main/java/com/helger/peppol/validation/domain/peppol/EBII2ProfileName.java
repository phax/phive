/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.domain.peppol;

import java.util.Locale;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Translatable;
import com.helger.commons.text.IMultilingualText;
import com.helger.commons.text.display.IHasDisplayText;
import com.helger.commons.text.resolve.DefaultTextResolver;
import com.helger.commons.text.util.TextHelper;

/**
 * Contains the names of the CEN BII2 profiles for later translation.
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
@Translatable
public enum EBII2ProfileName implements IHasDisplayText
{
  BII_MLR ("Message Level Response", "Message Level Response"),
  BII01 ("Nur Katalog", "Catalogue Only"),
  BII02 ("Katalogänderung", "Catalogue Update"),
  BII03 ("Nur Bestellung", "Order Only"),
  BII04 ("Nur Rechnung", "Invoice Only"),
  BII05 ("Rechnung", "Billing"),
  BII06 ("Beschaffung", "Procurement"),
  BII10 ("e-Notifikation", "eNotification"),
  BII11 ("Qualifikation", "Qualification"),
  BII12 ("Einfache Ausschreibung", "Tendering Simple"),
  BII16 ("Katalog löschen", "Catalogue Deletion"),
  BII17 ("Mehrpartei Katalog", "Multi Party Catalogue"),
  BII21 ("Anweisung", "Statement"),
  BII22 ("Ausschreibung", "Call for Tender"),
  BII27 ("Erweiterte Bestellung", "Advanced Ordering"),
  BII28 ("Bestellung", "Ordering"),
  BII30 ("Nur Lieferschein", "Dispatch Only"),
  BII31 ("Nur Mahnung", "Reminder Only"),
  BII32 ("Einfache Bestellung", "Simple Ordering"),
  BII33 ("Katalog Anmeldung", "Catalogue Subscription"),
  BII34 ("Ausschreibung mit Katalogsvorlage", "Call for Tender with Catalogue Template"),
  BII35 ("Einfache Ausschreibung mit Katalog", "Tendering Simple with Catalogue");

  private final IMultilingualText m_aTP;

  private EBII2ProfileName (@Nonnull final String sDE, @Nonnull final String sEN)
  {
    m_aTP = TextHelper.create_DE_EN (sDE, sEN);
  }

  @Nullable
  public String getDisplayText (@Nonnull final Locale aContentLocale)
  {
    return DefaultTextResolver.getTextStatic (this, m_aTP, aContentLocale);
  }
}
