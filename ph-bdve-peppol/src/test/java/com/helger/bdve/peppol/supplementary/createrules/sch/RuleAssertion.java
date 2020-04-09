/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.peppol.supplementary.createrules.utils.Utils;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;

@Immutable
final class RuleAssertion
{
  private final String m_sRuleID;
  private final String m_sMessage;
  private final String m_sSeverity;

  public RuleAssertion (@Nonnull @Nonempty final String sRuleID,
                        @Nonnull @Nonempty final String sMessage,
                        @Nonnull @Nonempty final String sSeverity)
  {
    ValueEnforcer.notEmpty (sRuleID, "RuleID");
    ValueEnforcer.notEmpty (sMessage, "Message");
    ValueEnforcer.notEmpty (sSeverity, "Severity");

    m_sRuleID = Utils.makeID (sRuleID);
    m_sMessage = sMessage;
    m_sSeverity = sSeverity;
  }

  @Nonnull
  @Nonempty
  public String getRuleID ()
  {
    return m_sRuleID;
  }

  @Nonnull
  @Nonempty
  public String getMessage ()
  {
    return m_sMessage;
  }

  @Nonnull
  @Nonempty
  public String getSeverity ()
  {
    return m_sSeverity;
  }
}
