package com.helger.phive.engine.vom;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.commons.builder.IBuilder;

@NotThreadSafe
public class VOMValidationSettings
{
  public static final boolean DEFAULT_ALLOW_EDIFACT = false;
  private final boolean m_bAllowEdifact;

  public VOMValidationSettings (final boolean bAllowEdifact)
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

  public static class Builder implements IBuilder <VOMValidationSettings>
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
    public VOMValidationSettings build ()
    {
      return new VOMValidationSettings (m_bAllowEdifact);
    }
  }
}
