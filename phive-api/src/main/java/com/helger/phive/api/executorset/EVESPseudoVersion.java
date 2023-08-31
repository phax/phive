package com.helger.phive.api.executorset;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;

/**
 * VES supported pseudo versions.
 *
 * @author Philip Helger
 */
public enum EVESPseudoVersion implements IHasID <String>
{
  /**
   * Indicates the latest version.
   */
  LATEST ("latest");

  private final String m_sID;

  EVESPseudoVersion (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  public int compareToSemantically (@Nonnull final EVESPseudoVersion eOtherPseudoVersion)
  {
    if (this == eOtherPseudoVersion)
      return 0;

    // Add implementation if other pseudo versions are contained in the future
    throw new UnsupportedOperationException ();
  }

  @Nullable
  public static EVESPseudoVersion getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (EVESPseudoVersion.class, sID);
  }
}
