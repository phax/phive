package com.helger.bdve.execute;

import java.util.function.Predicate;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.CommonsHashMap;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.collection.ext.ICommonsMap;
import com.helger.commons.concurrent.SimpleReadWriteLock;
import com.helger.commons.string.StringHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * A registry for {@link IValidationExecutorSet} objects. The default instance
 * can be accessed via {@link #INSTANCE}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSetRegistry
{
  public static final ValidationExecutorSetRegistry INSTANCE = new ValidationExecutorSetRegistry ();

  protected final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  @GuardedBy ("m_aRWLock")
  protected final ICommonsMap <String, IValidationExecutorSet> m_aMap = new CommonsHashMap <> ();

  public ValidationExecutorSetRegistry ()
  {}

  /**
   * Register a validation executor set into this registry.
   *
   * @param aVES
   *        The object to register. MAy not be <code>null</code>.
   * @return The passed parameter
   * @throws IllegalStateException
   *         If another object with the same ID is already registered in this
   *         registry.
   */
  @Nonnull
  public <T extends IValidationExecutorSet> T registerValidationExecutorSet (@Nonnull final T aVES) throws IllegalStateException
  {
    ValueEnforcer.notNull (aVES, "VES");

    final String sKey = aVES.getID ();
    m_aRWLock.writeLocked ( () -> {
      if (m_aMap.containsKey (sKey))
        throw new IllegalStateException ("Another validation executor set with the ID '" +
                                         sKey +
                                         "' is already registered!");
      m_aMap.put (sKey, aVES);
    });
    return aVES;
  }

  /**
   * @return A list of all contained validation executor sets in this registry.
   *         Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutorSet> getAll ()
  {
    return m_aRWLock.readLocked ( () -> m_aMap.copyOfValues ());
  }

  /**
   * Final all validation executor sets that match the provided filter.
   *
   * @param aFilter
   *        The filter to be used. May be <code>null</code> in which case the
   *        result is the same as {@link #getAll()}.
   * @return Never <code>null</code> but maybe empty.
   */
  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutorSet> findAll (@Nonnull final Predicate <? super IValidationExecutorSet> aFilter)
  {
    return m_aRWLock.readLocked ( () -> m_aMap.copyOfValues (aFilter));
  }

  /**
   * Final all validation executor sets that match the provided filter.
   *
   * @param aFilter
   *        The filter to be used. May be <code>null</code> in which case the
   *        result is the same as {@link #getAll()}.
   * @return Never <code>null</code> but maybe empty.
   */
  @Nullable
  public IValidationExecutorSet findFirst (@Nonnull final Predicate <? super IValidationExecutorSet> aFilter)
  {
    return m_aRWLock.readLocked ( () -> m_aMap.findFirstValue (e -> aFilter.test (e.getValue ())));
  }

  /**
   * Find the validation executor set with the specified ID.
   *
   * @param sID
   *        The ID to search. May be <code>null</code>.
   * @return <code>null</code> if no such validation executor set is registered.
   */
  @Nullable
  public IValidationExecutorSet getOfID (@Nullable final String sID)
  {
    if (StringHelper.hasNoText (sID))
      return null;

    return m_aRWLock.readLocked ( () -> m_aMap.get (sID));
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Map", m_aMap).toString ();
  }
}
