package com.helger.phive.xml.schematron;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;

public enum ESchematronEngine implements IHasID <String>
{
  PURE ("pure"),
  ISO_SCHEMATRON ("iso-schematron"),
  SCHXSLT ("schxslt");

  private final String m_sID;

  ESchematronEngine (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nullable
  public static ESchematronEngine getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (ESchematronEngine.class, sID);
  }
}
