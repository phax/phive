/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.api.executorset.status;

import com.helger.annotation.Nonempty;
import com.helger.base.id.IHasID;
import com.helger.base.lang.EnumHelper;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;

/**
 * Defines the overall status of a validation executor.
 *
 * @author Philip Helger
 * @since 9.2.0
 */
public enum EValidationExecutorStatusType implements IHasID <String>
{
  /**
   * The executor is explicitly deprecated. Most likely a replacement is
   * available.
   */
  DEPRECATED ("deprecated"),
  /**
   * The executor has a validity period that starts in the future.
   */
  NOT_YET_ACTIVE ("notyetactive"),
  /**
   * The executor has a validity period that ended in the past.
   */
  EXPIRED ("expired"),
  /**
   * The executor is valid.
   */
  VALID ("valid");

  private final String m_sID;

  EValidationExecutorStatusType (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  /**
   * @return <code>true</code> if the status type is deprecated,
   *         <code>false</code> if not.
   */
  public boolean isDeprecated ()
  {
    return this == DEPRECATED;
  }

  public boolean isValid ()
  {
    return this == VALID;
  }

  @Nullable
  public static EValidationExecutorStatusType getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EValidationExecutorStatusType.class, sID);
  }
}
