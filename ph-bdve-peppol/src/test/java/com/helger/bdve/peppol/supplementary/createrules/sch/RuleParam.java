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
package com.helger.bdve.peppol.supplementary.createrules.sch;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

import com.helger.bdve.peppol.supplementary.createrules.util.CreateHelper;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.string.StringHelper;

@Immutable
final class RuleParam
{
  private final String m_sRuleID;
  private final String m_sTest;
  private final String m_sPrerequisite;
  private final String m_sPrerequisiteVarName;

  public RuleParam (@Nonnull @Nonempty final String sRuleID, @Nonnull @Nonempty final String sTest)
  {
    this (sRuleID, sTest, null, null);
  }

  public RuleParam (@Nonnull @Nonempty final String sRuleID,
                    @Nonnull @Nonempty final String sTest,
                    @Nullable final String sPrerequisite,
                    @Nullable final String sPrerequisiteVarName)
  {
    ValueEnforcer.notEmpty (sRuleID, "RuleID");
    ValueEnforcer.notEmpty (sTest, "Test");

    m_sRuleID = CreateHelper.makeID (sRuleID);
    m_sTest = sTest;
    m_sPrerequisite = sPrerequisite;
    m_sPrerequisiteVarName = sPrerequisiteVarName;
  }

  @Nonnull
  @Nonempty
  public String getRuleID ()
  {
    return m_sRuleID;
  }

  @Nullable
  public String getRulePrerequisiteVarName ()
  {
    return m_sPrerequisiteVarName;
  }

  public boolean hasPrerequisite ()
  {
    return StringHelper.hasText (m_sPrerequisite);
  }

  @Nullable
  public String getPrerequisite ()
  {
    return m_sPrerequisite;
  }

  @Nonnull
  @Nonempty
  public String getTestWithPrerequisiteInline ()
  {
    if (hasPrerequisite ())
      return "(" + m_sPrerequisite + " and " + m_sTest + ") or not (" + m_sPrerequisite + ")";
    return m_sTest;
  }

  @Nonnull
  @Nonempty
  public String getTestWithPrerequisiteParameter ()
  {
    if (hasPrerequisite ())
      return "($" +
             getRulePrerequisiteVarName () +
             " and " +
             m_sTest +
             ") or not ($" +
             getRulePrerequisiteVarName () +
             ")";
    return m_sTest;
  }
}
