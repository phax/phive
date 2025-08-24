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
package com.helger.phive.api.config;

import com.helger.annotation.style.IsSPIImplementation;
import com.helger.annotation.style.UsedViaReflection;
import com.helger.base.version.Version;
import com.helger.diver.api.version.DVRPseudoVersion;
import com.helger.diver.api.version.DVRPseudoVersionRegistry;
import com.helger.diver.api.version.IDVRPseudoVersion;
import com.helger.diver.api.version.IDVRPseudoVersionComparable;
import com.helger.diver.api.version.IDVRPseudoVersionRegistry;
import com.helger.diver.api.version.spi.IDVRPseudoVersionRegistrarSPI;

import jakarta.annotation.Nonnull;

/**
 * Default pseudo version registrar
 *
 * @author Philip Helger
 */
@IsSPIImplementation
public final class PhivePseudoVersionRegistrarSPIImpl implements IDVRPseudoVersionRegistrarSPI
{
  /**
   * Latest active indicates the latest version that is valid at a provided point in time (including
   * snapshots).
   */
  public static final IDVRPseudoVersion LATEST_ACTIVE;
  static
  {
    LATEST_ACTIVE = new DVRPseudoVersion ("latest-active", new IDVRPseudoVersionComparable ()
    {
      public int compareToPseudoVersion (@Nonnull final IDVRPseudoVersion aOtherPseudoVersion)
      {
        // Only LATEST and LATEST_RELEASE are greater
        if (aOtherPseudoVersion.equals (DVRPseudoVersionRegistry.LATEST) ||
            aOtherPseudoVersion.equals (DVRPseudoVersionRegistry.LATEST_RELEASE))
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
   * Latest active release indicates the latest version that is valid at a provided point in time
   * (excluding snapshots).
   */
  public static final IDVRPseudoVersion LATEST_RELEASE_ACTIVE;
  static
  {
    LATEST_RELEASE_ACTIVE = new DVRPseudoVersion ("latest-release-active", new IDVRPseudoVersionComparable ()
    {
      public int compareToPseudoVersion (@Nonnull final IDVRPseudoVersion aOtherPseudoVersion)
      {
        // Only LATEST, LATEST_RELEASE and LATEST_ACTIVE are greater
        if (aOtherPseudoVersion.equals (DVRPseudoVersionRegistry.LATEST) ||
            aOtherPseudoVersion.equals (DVRPseudoVersionRegistry.LATEST_RELEASE) ||
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

  public void registerPseudoVersions (@Nonnull final IDVRPseudoVersionRegistry aRegistry)
  {
    aRegistry.registerPseudoVersion (LATEST_ACTIVE);
    aRegistry.registerPseudoVersion (LATEST_RELEASE_ACTIVE);
  }
}
