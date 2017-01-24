package com.helger.bdve.execute;

import java.util.Iterator;

import javax.annotation.Nonnull;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.string.ToStringGenerator;

/**
 * Default implementation of {@link IValidationExecutorSet}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSet implements IValidationExecutorSet
{
  private final String m_sID;
  private final String m_sDisplayName;
  private final ICommonsList <IValidationExecutor> m_aList = new CommonsArrayList <> ();

  public ValidationExecutorSet (@Nonnull @Nonempty final String sID, @Nonnull @Nonempty final String sDisplayName)
  {
    m_sID = ValueEnforcer.notEmpty (sID, "ID");
    m_sDisplayName = ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  @Nonnull
  @Nonempty
  public String getDisplayName ()
  {
    return m_sDisplayName;
  }

  public void addExecutor (@Nonnull final IValidationExecutor aExecutor)
  {
    ValueEnforcer.notNull (aExecutor, "Executor");
    m_aList.add (aExecutor);
  }

  @Nonnull
  public Iterator <IValidationExecutor> iterator ()
  {
    return m_aList.iterator ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationExecutorSet rhs = (ValidationExecutorSet) o;
    return m_sID.equals (rhs.m_sID) && m_sDisplayName.equals (rhs.m_sDisplayName) && m_aList.equals (rhs.m_aList);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_sID).append (m_sDisplayName).append (m_aList).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ())
                            .append ("ID", m_sID)
                            .append ("DisplayName", m_sDisplayName)
                            .append ("List", m_aList)
                            .toString ();
  }
}
