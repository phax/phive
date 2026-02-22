package com.helger.phive.api.severity;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.concurrent.Immutable;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.level.IErrorLevel;

/**
 * Helper class to deal with severities.
 *
 * @author Philip Helger
 * @since 11.2.0
 */
@Immutable
public final class PhiveSeverityHelper
{
  private PhiveSeverityHelper ()
  {}

  public static boolean isConsideredError (@NonNull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.ERROR);
  }

  public static boolean isConsideredWarning (@NonNull final IErrorLevel aErrorLevel)
  {
    return aErrorLevel.isGE (EErrorLevel.WARN);
  }
}
