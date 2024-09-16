/*
 * Copyright (C) 2014-2024 Philip Helger (www.helger.com)
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
package com.helger.phive.api.validity;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;

/**
 * Extended validity to indicate whether a result is either
 * <ul>
 * <li>The rule set was not executed, it was ignored</li>
 * <li>The rule set is 100% valid</li>
 * <li>The rule set is 100% invalid</li>
 * <li>It's not clear and it needs later evaluation</li>
 * </ul>
 *
 * @author Philip Helger
 * @since 10.0.0
 */
public enum EExtendedValidity implements IHasID <String>
{
  /** Validation layer was skipped/ignored */
  SKIPPED ("skipped"),
  /** Document matches rules on this layer */
  VALID ("valid"),
  /** Document does not match rules on this layer */
  INVALID ("invalid"),
  /**
   * It's not clear whether the document matches the rules on this layer or not
   */
  UNCLEAR ("unclear");

  private final String m_sID;

  EExtendedValidity (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  public boolean isSkipped ()
  {
    return this == SKIPPED;
  }

  public boolean isValid ()
  {
    return this == VALID;
  }

  public boolean isInvalid ()
  {
    return this == INVALID;
  }

  public boolean isUnclear ()
  {
    return this == UNCLEAR;
  }

  public boolean isDefined ()
  {
    return this == VALID || this == INVALID;
  }

  @Nullable
  public static EExtendedValidity getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EExtendedValidity.class, sID);
  }
}
