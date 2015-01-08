/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.domain;

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
public enum EBII2ProfileName implements IHasDisplayText
{
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

  private EBII2ProfileName (@Nonnull final String sEN)
  {
    m_aTP = TextProvider.create_EN (sEN);
  }

  @Nullable
  public String getDisplayText (@Nonnull final Locale aContentLocale)
  {
    return DefaultTextResolver.getText (this, m_aTP, aContentLocale);
  }
}
