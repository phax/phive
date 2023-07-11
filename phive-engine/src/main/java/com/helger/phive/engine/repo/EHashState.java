/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.name.IHasDisplayName;

public enum EHashState implements IHasDisplayName
{
  VERIFIED_MATCHING ("verified and matching"),
  VERIFIED_NON_MATCHING ("verified and NOT matching"),
  NOT_VERIFIED ("not verified");

  private final String m_sDisplayName;

  EHashState (@Nonnull @Nonempty final String sDisplayName)
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
