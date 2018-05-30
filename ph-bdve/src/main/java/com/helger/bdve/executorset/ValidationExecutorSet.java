/**
 * Copyright (C) 2014-2018 Philip Helger (www.helger.com)
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
package com.helger.bdve.executorset;

import java.util.Iterator;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.concurrent.NotThreadSafe;

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.IValidationArtefact;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.execute.ValidationExecutorXSDPartial;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.collection.impl.ICommonsList;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.state.EChange;
import com.helger.commons.string.ToStringGenerator;

/**
 * Default implementation of {@link IValidationExecutorSet}.
 *
 * @author Philip Helger
 */
@NotThreadSafe
public class ValidationExecutorSet implements IValidationExecutorSet
{
  private final VESID m_aID;
  private final String m_sDisplayName;
  private final ICommonsList <IValidationExecutor> m_aList = new CommonsArrayList <> ();
  private final boolean m_bDeprecated;

  public ValidationExecutorSet (@Nonnull final VESID aID,
                                @Nonnull @Nonempty final String sDisplayName,
                                final boolean bDeprecated)
  {
    m_aID = ValueEnforcer.notNull (aID, "ID");
    m_sDisplayName = ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    m_bDeprecated = bDeprecated;
  }

  @Nonnull
  public VESID getID ()
  {
    return m_aID;
  }

  @Nonnull
  @Nonempty
  public String getDisplayName ()
  {
    return m_sDisplayName;
  }

  @Nonnegative
  public int getExecutorCount ()
  {
    return m_aList.size ();
  }

  @Nonnull
  public Iterator <IValidationExecutor> iterator ()
  {
    return m_aList.iterator ();
  }

  @Nonnull
  @ReturnsMutableCopy
  public ICommonsList <IValidationExecutor> getAllExecutors ()
  {
    return m_aList.getClone ();
  }

  public boolean isDeprecated ()
  {
    return m_bDeprecated;
  }

  /**
   * Add a single executor.
   *
   * @param aExecutor
   *        The executor to be added. May not be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public ValidationExecutorSet addExecutor (@Nonnull final IValidationExecutor aExecutor)
  {
    ValueEnforcer.notNull (aExecutor, "Executor");
    m_aList.add (aExecutor);
    return this;
  }

  @Nonnull
  public ValidationExecutorSet addMatchingExecutor (@Nonnull final IValidationArtefact aVA,
                                                    @Nonnull final ValidationArtefactKey aVAKey)
  {
    ValueEnforcer.notNull (aVA, "ValidationArtefact");
    ValueEnforcer.notNull (aVAKey, "ValidationArtefactKey");

    switch (aVA.getValidationArtefactType ())
    {
      case XML:
        // Nothing to do
        break;
      case XSD:
        addExecutor (new ValidationExecutorXSD (aVA, aCL -> aVAKey.getSchema (aCL)));
        break;
      case PARTIAL_XSD:
        addExecutor (new ValidationExecutorXSDPartial (aVA, aVAKey.getXSDPartialContext ()));
        break;
      case SCHEMATRON_PURE:
      case SCHEMATRON_SCH:
      case SCHEMATRON_XSLT:
      case SCHEMATRON_OIOUBL:
        addExecutor (new ValidationExecutorSchematron (aVA,
                                                       aVAKey.getPrerequisiteXPath (),
                                                       aVAKey.getNamespaceContext ()));
        break;
      default:
        throw new IllegalArgumentException ("Unsupported validation type " + aVA.getValidationArtefactType ());
    }
    return this;
  }

  public void setValidationExecutorDoCache (final boolean bCache)
  {
    for (final IValidationExecutor aExecutor : m_aList)
      if (aExecutor instanceof IValidationExecutor.ICacheSupport)
        ((IValidationExecutor.ICacheSupport) aExecutor).setCacheArtefact (bCache);
  }

  /**
   * As some {@link IValidationExecutor} instances may contain a hard reference
   * to a {@link ClassLoader} this methods removes all executors and allows for
   * them to be garbage collected.<br>
   * New executors may be added afterwards but this method is mainly meant for
   * safe cleanup.
   *
   * @return {@link EChange}
   */
  @Nonnull
  public EChange removeAllExecutors ()
  {
    return m_aList.removeAll ();
  }

  @Override
  public boolean equals (final Object o)
  {
    if (o == this)
      return true;
    if (o == null || !getClass ().equals (o.getClass ()))
      return false;
    final ValidationExecutorSet rhs = (ValidationExecutorSet) o;
    return m_aID.equals (rhs.m_aID) && m_sDisplayName.equals (rhs.m_sDisplayName) && m_aList.equals (rhs.m_aList);
  }

  @Override
  public int hashCode ()
  {
    return new HashCodeGenerator (this).append (m_aID).append (m_sDisplayName).append (m_aList).getHashCode ();
  }

  @Override
  public String toString ()
  {
    return ToStringGenerator.getDerived (super.toString ())
                            .append ("ID", m_aID)
                            .append ("DisplayName", m_sDisplayName)
                            .append ("List", m_aList)
                            .getToString ();
  }

  /**
   * Create a new validation executor set (VES). It uses all XML Schema
   * Definitions (XSDs) defined in the validation artefact key.
   *
   * @param aID
   *        The ID to use. May not be <code>null</code>.
   * @param sDisplayName
   *        The name of the VES. May neither be <code>null</code> nor empty.
   * @param aValidationArtefactKey
   *        The validation artefact key to use (defining the business
   *        requirements). May not be <code>null</code>. This key contains the
   *        references to the XSDs.
   * @param bIsDeprecated
   *        <code>true</code> if this VES is considered deprecated,
   *        <code>false</code> if not.
   * @param aValidationArtefacts
   *        The schematron resources to be associated with the VES. May not be
   *        <code>null</code> but maybe empty (for e.g. XSD only layers).
   * @return The newly created VES. Never <code>null</code>.
   */
  @Nonnull
  public static ValidationExecutorSet create (@Nonnull final VESID aID,
                                              @Nonnull @Nonempty final String sDisplayName,
                                              @Nonnull final ValidationArtefactKey aValidationArtefactKey,
                                              final boolean bIsDeprecated,
                                              @Nonnull final IValidationArtefact... aValidationArtefacts)
  {
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aValidationArtefactKey, "ValidationArtefactKey");
    ValueEnforcer.noNullValue (aValidationArtefacts, "ValidationArtefacts");

    final ValidationExecutorSet ret = new ValidationExecutorSet (aID, sDisplayName, bIsDeprecated);

    // Add XSDs at the beginning
    final ClassLoader aClassLoader = aValidationArtefactKey.getClassLoader ();
    for (final IReadableResource aXSDRes : aValidationArtefactKey.getAllXSDResources ())
      ret.addExecutor (new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aClassLoader, aXSDRes),
                                                  aCL -> aValidationArtefactKey.getSchema (aCL)));

    // Add Schematrons
    for (final IValidationArtefact aItem : aValidationArtefacts)
      ret.addMatchingExecutor (aItem, aValidationArtefactKey);

    return ret;
  }

  /**
   * Create a derived VES from an existing VES. This means that only Schematrons
   * can be added, but the XSDs are taken from the base VES only.
   *
   * @param aBaseVES
   *        The base VES to copy from. May not be <code>null</code>.
   * @param aID
   *        The ID to use. May not be <code>null</code>.
   * @param sDisplayName
   *        The name of the VES. May neither be <code>null</code> nor empty.
   * @param aValidationArtefactKey
   *        The validation artefact key to use (defining the business
   *        requirements). May not be <code>null</code>.
   * @param bIsDeprecated
   *        <code>true</code> if this VES is considered deprecated,
   *        <code>false</code> if not.
   * @param aValidationArtefacts
   *        The schematron resources to be associated with the VES. May not be
   *        <code>null</code>.
   * @return The newly created VES. Never <code>null</code>.
   */
  @Nonnull
  public static ValidationExecutorSet createDerived (@Nonnull final IValidationExecutorSet aBaseVES,
                                                     @Nonnull final VESID aID,
                                                     @Nonnull @Nonempty final String sDisplayName,
                                                     @Nonnull final ValidationArtefactKey aValidationArtefactKey,
                                                     final boolean bIsDeprecated,
                                                     @Nonnull final IValidationArtefact... aValidationArtefacts)
  {
    ValueEnforcer.notNull (aBaseVES, "BaseVES");
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aValidationArtefactKey, "ValidationArtefactKey");
    ValueEnforcer.notEmptyNoNullValue (aValidationArtefacts, "ValidationArtefacts");

    final ValidationExecutorSet ret = new ValidationExecutorSet (aID,
                                                                 sDisplayName,
                                                                 bIsDeprecated || aBaseVES.isDeprecated ());

    // Copy all existing ones
    for (final IValidationExecutor aVE : aBaseVES)
      ret.addExecutor (aVE);

    // Add Schematrons
    for (final IValidationArtefact aItem : aValidationArtefacts)
      ret.addMatchingExecutor (aItem, aValidationArtefactKey);

    return ret;
  }
}
