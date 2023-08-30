package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

/**
 * Specific exception when VES loading fails (e.g. on lazy requirement
 * resolution)
 *
 * @author Philip Helger
 */
public class VESLoadingException extends RuntimeException
{
  public VESLoadingException (@Nonnull final String sMsg)
  {
    super (sMsg);
  }

  public VESLoadingException (@Nonnull final String sMsg, @Nonnull final Exception aCause)
  {
    super (sMsg, aCause);
  }
}
