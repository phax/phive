/*
 * Copyright (C) 2023 Philip Helger & ecosio
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
package com.helger.phive.repo;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.name.IHasDisplayName;

public enum ERepoHashState implements IHasDisplayName
{
  VERIFIED_MATCHING ("verified and matching"),
  VERIFIED_NON_MATCHING ("verified and NOT matching"),
  NOT_VERIFIED ("not verified");

  private final String m_sDisplayName;

  ERepoHashState (@Nonnull @Nonempty final String sDisplayName)
  {
    m_sDisplayName = sDisplayName;
  }

  @Nonnull
  @Nonempty
  public String getDisplayName ()
  {
    return m_sDisplayName;
  }
}
