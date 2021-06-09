/**
 * Copyright (C) 2014-2021 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.vom;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.builder.IBuilder;

/**
 * Specific compliance settings applicable for VOM v1.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class VOM1ComplianceSettings
{
  public static final boolean DEFAULT_ALLOW_EDIFACT = false;
  private final boolean m_bAllowEdifact;

  public VOM1ComplianceSettings (final boolean bAllowEdifact)
  {
    m_bAllowEdifact = bAllowEdifact;
  }

  public boolean isAllowEdifact ()
  {
    return m_bAllowEdifact;
  }

  @Nonnull
  public static Builder builder ()
  {
    return new Builder ();
  }

  public static class Builder implements IBuilder <VOM1ComplianceSettings>
  {
    private boolean m_bAllowEdifact = DEFAULT_ALLOW_EDIFACT;

    public Builder ()
    {}

    @Nonnull
    public Builder allowEdifact (final boolean b)
    {
      m_bAllowEdifact = b;
      return this;
    }

    @Nonnull
    public VOM1ComplianceSettings build ()
    {
      return new VOM1ComplianceSettings (m_bAllowEdifact);
    }
  }
}
