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
package com.helger.phive.api.config;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.IsSPIImplementation;
import com.helger.commons.annotation.UsedViaReflection;
import com.helger.commons.version.Version;
import com.helger.diver.api.version.IPseudoVersionComparable;
import com.helger.diver.api.version.IVESPseudoVersion;
import com.helger.diver.api.version.IVESPseudoVersionRegistry;
import com.helger.diver.api.version.VESPseudoVersion;
import com.helger.diver.api.version.VESPseudoVersionRegistry;
import com.helger.diver.api.version.spi.IVESPseudoVersionRegistrarSPI;

/**
 * Default pseudo version registrar
 *
 * @author Philip Helger
 */
@IsSPIImplementation
public final class PhivePseudoVersionRegistrarSPIImpl implements IVESPseudoVersionRegistrarSPI
{
  /**
   * Latest active indicates the latest version that is valid at a provided
   * point in time (including snapshots).
   */
  public static final IVESPseudoVersion LATEST_ACTIVE;
  static
  {
    LATEST_ACTIVE = new VESPseudoVersion ("latest-active", new IPseudoVersionComparable ()
    {
      public int compareToPseudoVersion (@Nonnull final IVESPseudoVersion aOtherPseudoVersion)
      {
        // Only LATEST and LATEST_RELEASE are greater
        if (aOtherPseudoVersion.equals (VESPseudoVersionRegistry.LATEST) ||
            aOtherPseudoVersion.equals (VESPseudoVersionRegistry.LATEST_RELEASE))
          return -1;

        // LATEST_ACTIVE is always greater
        return +1;
      }

      public int compareToVersion (@Nonnull final Version aStaticVersion)
      {
        // LATEST_ACTIVE is always greater
        return +1;
      }
    });
  }

  /**
   * Latest active release indicates the latest version that is valid at a
   * provided point in time (excluding snapshots).
   */
  public static final IVESPseudoVersion LATEST_RELEASE_ACTIVE;
  static
  {
    LATEST_RELEASE_ACTIVE = new VESPseudoVersion ("latest-release-active", new IPseudoVersionComparable ()
    {
      public int compareToPseudoVersion (@Nonnull final IVESPseudoVersion aOtherPseudoVersion)
      {
        // Only LATEST, LATEST_RELEASE and LATEST_ACTIVE are greater
        if (aOtherPseudoVersion.equals (VESPseudoVersionRegistry.LATEST) ||
            aOtherPseudoVersion.equals (VESPseudoVersionRegistry.LATEST_RELEASE) ||
            aOtherPseudoVersion.equals (LATEST_ACTIVE))
          return -1;

        // LATEST_RELEASE_ACTIVE is always greater
        return +1;
      }

      public int compareToVersion (@Nonnull final Version aStaticVersion)
      {
        // LATEST_RELEASE_ACTIVE is always greater
        return +1;
      }
    });
  }

  @Deprecated (forRemoval = false)
  @UsedViaReflection
  public PhivePseudoVersionRegistrarSPIImpl ()
  {}

  public void registerPseudoVersions (@Nonnull final IVESPseudoVersionRegistry aRegistry)
  {
    aRegistry.registerPseudoVersion (LATEST_ACTIVE);
    aRegistry.registerPseudoVersion (LATEST_RELEASE_ACTIVE);
  }
}
