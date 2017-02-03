/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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

import com.helger.bdve.EValidationType;
import com.helger.bdve.artefact.ValidationArtefact;
import com.helger.bdve.execute.IValidationExecutor;
import com.helger.bdve.execute.ValidationExecutorSchematron;
import com.helger.bdve.execute.ValidationExecutorXSD;
import com.helger.bdve.key.ValidationArtefactKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.collection.ext.CommonsArrayList;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.hashcode.HashCodeGenerator;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;
import com.helger.jaxb.builder.IJAXBDocumentType;

/**
 * Default implementation of {@link IValidationExecutorSet}.
 *
 * @author Philip Helger
 */
public class ValidationExecutorSet implements IValidationExecutorSet
{
  private final VESID m_aID;
  private final String m_sDisplayName;
  private final ValidationArtefactKey m_aValidationArtefactKey;
  private final ICommonsList <IValidationExecutor> m_aList = new CommonsArrayList<> ();

  public ValidationExecutorSet (@Nonnull final VESID aID,
                                @Nonnull @Nonempty final String sDisplayName,
                                @Nonnull final ValidationArtefactKey aValidationArtefactKey)
  {
    m_aID = ValueEnforcer.notNull (aID, "ID");
    m_sDisplayName = ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    m_aValidationArtefactKey = ValueEnforcer.notNull (aValidationArtefactKey, "ValidationArtefactKey");
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

  @Nonnull
  public ValidationArtefactKey getValidationArtefactKey ()
  {
    return m_aValidationArtefactKey;
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

  /**
   * Shortcut method to add all XSD executors of a single JAXB document type.
   * The validation artefact key passed in the constructor is used for the XSD
   * executors.
   *
   * @param aDocType
   *        The JAXB document type. May not be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  public ValidationExecutorSet addAllXSDExecutors (@Nonnull final IJAXBDocumentType aDocType)
  {
    ValueEnforcer.notNull (aDocType, "DocType");
    for (final IReadableResource aXSDRes : aDocType.getAllXSDResources ())
      addExecutor (new ValidationExecutorXSD (ValidationArtefact.createXSD (aXSDRes, m_aValidationArtefactKey)));
    return this;
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
                            .toString ();
  }

  @Nonnull
  public static ValidationExecutorSet create (@Nonnull final VESID aID,
                                              @Nonnull @Nonempty final String sDisplayName,
                                              @Nonnull final ValidationArtefactKey aValidationArtefactKey,
                                              @Nonnull final IReadableResource... aSchematrons)
  {
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aValidationArtefactKey, "ValidationArtefactKey");
    ValueEnforcer.notEmptyNoNullValue (aSchematrons, "Schematrons");

    final ValidationExecutorSet ret = new ValidationExecutorSet (aID, sDisplayName, aValidationArtefactKey);

    // Add XSDs at the beginning
    ret.addAllXSDExecutors (aValidationArtefactKey.getJAXBDocumentType ());

    // Add Schematrons
    for (final IReadableResource aRes : aSchematrons)
      ret.addExecutor (new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE,
                                                                                 aRes,
                                                                                 aValidationArtefactKey)));

    return ret;
  }

  @Nonnull
  public static ValidationExecutorSet createDerived (@Nonnull final IValidationExecutorSet aBaseVES,
                                                     @Nonnull final VESID aID,
                                                     @Nonnull @Nonempty final String sDisplayName,
                                                     @Nonnull final ValidationArtefactKey aValidationArtefactKey,
                                                     @Nonnull final IReadableResource... aSchematrons)
  {
    ValueEnforcer.notNull (aBaseVES, "BaseVES");
    ValueEnforcer.notNull (aID, "ID");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aValidationArtefactKey, "ValidationArtefactKey");
    ValueEnforcer.notEmptyNoNullValue (aSchematrons, "Schematrons");

    final ValidationExecutorSet ret = new ValidationExecutorSet (aID, sDisplayName, aValidationArtefactKey);

    // Copy all existing ones
    for (final IValidationExecutor aVE : aBaseVES)
      ret.addExecutor (aVE);

    // Add Schematrons
    for (final IReadableResource aRes : aSchematrons)
      ret.addExecutor (new ValidationExecutorSchematron (new ValidationArtefact (EValidationType.SCHEMATRON_PURE,
                                                                                 aRes,
                                                                                 aValidationArtefactKey)));

    return ret;
  }
}
