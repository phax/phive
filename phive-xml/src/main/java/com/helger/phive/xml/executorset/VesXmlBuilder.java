/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.executorset;

import java.time.OffsetDateTime;
import java.util.Collection;
import java.util.List;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.annotation.concurrent.NotThreadSafe;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.string.StringReplace;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.collection.commons.CommonsHashMap;
import com.helger.collection.commons.ICommonsList;
import com.helger.collection.commons.ICommonsMap;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.EValidationType;
import com.helger.phive.api.artefact.ValidationArtefact;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.IValidationExecutorSetRegistry;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSetAlias;
import com.helger.phive.api.executorset.status.EValidationExecutorStatusType;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatusHistoryItem;
import com.helger.phive.xml.schematron.CustomErrorDetails;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.xml.schema.XMLSchemaCache;

/**
 * Fluent builder for creating and registering
 * {@link IValidationExecutorSet}&lt;{@link IValidationSourceXML}&gt; objects.
 *
 * @author Philip Helger
 * @since 12.0.2
 */
@NotThreadSafe
public class VesXmlBuilder
{
  /**
   * An alias definition for registering the same {@link ValidationExecutorSet} under an additional
   * {@link DVRCoordinate} with a different display name (e.g. ZUGFeRD / Factur-X dual branding).
   *
   * @param vesID
   *        The alias VES ID. May not be <code>null</code>.
   * @param displayName
   *        The alias display name. May neither be <code>null</code> nor empty.
   */
  public static record Alias (@NonNull DVRCoordinate vesID, @NonNull @Nonempty String displayName)
  {
    public Alias
    {
      ValueEnforcer.notNull (vesID, "VESID");
      ValueEnforcer.notEmpty (displayName, "DisplayName");
    }
  }

  public static final String VERSION_PLACEHOLDER = "{ver}";

  private DVRCoordinate m_aVESID;
  private String m_sDisplayName;
  private boolean m_bIsDeprecated = false;
  private OffsetDateTime m_aValidFrom;
  private OffsetDateTime m_aValidTo;
  private IValidationExecutorSet <IValidationSourceXML> m_aBaseVES;
  private ICommonsMap <String, CustomErrorDetails> m_aCustomErrorLevels;
  private final ICommonsList <IValidationExecutor <IValidationSourceXML>> m_aExecutors = new CommonsArrayList <> ();
  private final ICommonsList <Alias> m_aAliases = new CommonsArrayList <> ();

  /**
   * Constructor. Use {@link #builder()} as the preferred entry point.
   */
  protected VesXmlBuilder ()
  {}

  /**
   * Create a new builder instance.
   *
   * @return A new {@link VesXmlBuilder}. Never <code>null</code>.
   */
  @NonNull
  public static VesXmlBuilder builder ()
  {
    return new VesXmlBuilder ();
  }

  /**
   * Set the VES ID (validation executor set coordinate). This is required.
   *
   * @param aVESID
   *        The VES ID to use. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder vesID (@NonNull final DVRCoordinate aVESID)
  {
    m_aVESID = ValueEnforcer.notNull (aVESID, "VESID");
    return this;
  }

  /**
   * Set the display name for the VES. Either this or {@link #displayNamePrefix(String)} must be
   * called.
   *
   * @param sDisplayName
   *        The display name. May neither be <code>null</code> nor empty.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder displayName (@NonNull @Nonempty final String sDisplayName)
  {
    m_sDisplayName = ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    return this;
  }

  /**
   * Set a display name prefix that will be combined with {@link DVRCoordinate#getVersionString()}
   * to form the full display name. Either this or {@link #displayName(String)} must be called.
   *
   * @param sDisplayNamePrefix
   *        The display name prefix. May neither be <code>null</code> nor empty.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder displayNamePrefix (@NonNull @Nonempty final String sDisplayNamePrefix)
  {
    ValueEnforcer.notEmpty (sDisplayNamePrefix, "DisplayNamePrefix");
    return displayName (sDisplayNamePrefix + VERSION_PLACEHOLDER);
  }

  /**
   * Remember the status property "deprecated".
   *
   * @param bIsDeprecated
   *        <code>true</code> to mark as deprecated, <code>false</code> for active.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder deprecated (final boolean bIsDeprecated)
  {
    m_bIsDeprecated = bIsDeprecated;
    return this;
  }

  /**
   * Mark the VES as deprecated. Shorthand for <code>deprecated (true)</code>.
   *
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder deprecated ()
  {
    return deprecated (true);
  }

  /**
   * Mark the VES as not deprecated. Shorthand for <code>deprecated (false)</code>.
   *
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder notDeprecated ()
  {
    return deprecated (false);
  }

  /**
   * Remember the status property "valid from".
   *
   * @param aValidFrom
   *        Define the date and time from which on this VES is valid. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder validFrom (@Nullable final OffsetDateTime aValidFrom)
  {
    m_aValidFrom = aValidFrom;
    return this;
  }

  /**
   * Remember the status property "valid to".
   *
   * @param aValidTo
   *        Define the date and time until which on this VES is valid. May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder validTo (@Nullable final OffsetDateTime aValidTo)
  {
    m_aValidTo = aValidTo;
    return this;
  }

  /**
   * Derive this VES from an existing base VES. When set, the executors from the base VES are copied
   * first, then the executors added via {@link #addSchematron(ValidationExecutorSchematron)} etc.
   * are appended.
   *
   * @param aBaseVES
   *        The base VES to derive from. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder basedOn (@NonNull final IValidationExecutorSet <IValidationSourceXML> aBaseVES)
  {
    return basedOn (aBaseVES, null);
  }

  /**
   * Derive this VES from an existing base VES, optionally applying custom error details to copied
   * Schematron executors.
   *
   * @param aBaseVES
   *        The base VES to derive from. May not be <code>null</code>.
   * @param aCustomErrorLevels
   *        Optional custom error details to apply to Schematron executors copied from the base VES.
   *        May be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder basedOn (@NonNull final IValidationExecutorSet <IValidationSourceXML> aBaseVES,
                                @Nullable final ICommonsMap <String, CustomErrorDetails> aCustomErrorLevels)
  {
    m_aBaseVES = ValueEnforcer.notNull (aBaseVES, "BaseVES");
    m_aCustomErrorLevels = aCustomErrorLevels != null ? new CommonsHashMap <> (aCustomErrorLevels) : null;
    return this;
  }

  /**
   * Add an XSD validation executor for a single XSD resource.
   *
   * @param aXSDRes
   *        The XSD resource. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addXSD (@NonNull final IReadableResource aXSDRes)
  {
    ValueEnforcer.notNull (aXSDRes, "XSDRes");
    return _addXSD (ValidationExecutorXSD.create (aXSDRes));
  }

  /**
   * Add an XSD validation executor for multiple XSD resources.
   *
   * @param aXSDRes
   *        The XSD resources. May neither be <code>null</code> nor empty, and no element may be
   *        <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addXSD (@NonNull final IReadableResource... aXSDRes)
  {
    ValueEnforcer.notEmptyNoNullValue (aXSDRes, "XSDRes");
    return _addXSD (ValidationExecutorXSD.create (aXSDRes));
  }

  /**
   * Add an XSD validation executor for multiple XSD resources provided as a list.
   *
   * @param aXSDRes
   *        The XSD resources. May neither be <code>null</code> nor empty, and no element may be
   *        <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addXSD (@NonNull final List <? extends IReadableResource> aXSDRes)
  {
    ValueEnforcer.notEmptyNoNullValue (aXSDRes, "XSDRes");
    return _addXSD (ValidationExecutorXSD.create (aXSDRes));
  }

  /**
   * Add an XSD validation executor for multiple XSD resources provided as a list. For KSeF this
   * special overload with a custom XML Schema cache is needed.
   *
   * @param aXSDRes
   *        The XSD resources. May neither be <code>null</code> nor empty, and no element may be
   *        <code>null</code>.
   * @param aCustomSchemaCache
   *        Custom XML Schema cache to be used. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addXSD (@NonNull final ICommonsList <? extends IReadableResource> aXSDRes,
                               @NonNull final XMLSchemaCache aCustomSchemaCache)
  {
    ValueEnforcer.notEmptyNoNullValue (aXSDRes, "XSDRes");
    ValueEnforcer.notNull (aCustomSchemaCache, "CustomSchemaCache");
    return _addXSD (new ValidationExecutorXSD (new ValidationArtefact (EValidationType.XSD, aXSDRes.getLastOrNull ()),
                                               () -> aCustomSchemaCache.getSchema (aXSDRes)));
  }

  /**
   * Add an XSD validation executor.
   *
   * @param aXSD
   *        The XSD validation executor. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  private VesXmlBuilder _addXSD (@NonNull final ValidationExecutorXSD aXSD)
  {
    ValueEnforcer.notNull (aXSD, "XSD");
    m_aExecutors.add (aXSD);
    return this;
  }

  /**
   * Add a Schematron validation executor.
   *
   * @param aSchematron
   *        The Schematron executor, typically created via
   *        {@link PhiveRulesUBLHelper#createXSLT_UBL21(IReadableResource)},
   *        {@link PhiveRulesCIIHelper#createXSLT_CII_D16B(IReadableResource)} or similar helper
   *        methods. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addSchematron (@NonNull final ValidationExecutorSchematron aSchematron)
  {
    ValueEnforcer.notNull (aSchematron, "Schematron");
    m_aExecutors.add (aSchematron);
    return this;
  }

  /**
   * Add a pre-built collection of validation executors. Use this when executor lists are assembled
   * manually (e.g. with partial XSD validation or custom insertion order).
   *
   * @param aExecutors
   *        The executors to add. May neither be <code>null</code> nor empty, and no element may be
   *        <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addExecutorsManually (@NonNull final Collection <? extends IValidationExecutor <IValidationSourceXML>> aExecutors)
  {
    ValueEnforcer.notEmptyNoNullValue (aExecutors, "Executors");
    m_aExecutors.addAll (aExecutors);
    return this;
  }

  /**
   * Add an alias registration that will be created when
   * {@link #registerInto(IValidationExecutorSetRegistry)} is called. The alias is a
   * {@link ValidationExecutorSetAlias} pointing to the same VES under a different ID and display
   * name.
   *
   * @param aAlias
   *        The alias definition. May not be <code>null</code>.
   * @return this for chaining
   */
  @NonNull
  public VesXmlBuilder addAlias (@NonNull final Alias aAlias)
  {
    ValueEnforcer.notNull (aAlias, "Alias");
    m_aAliases.add (aAlias);
    return this;
  }

  @NonNull
  private String _resolveDisplayName ()
  {
    return StringReplace.replaceAll (m_sDisplayName, VERSION_PLACEHOLDER, m_aVESID.getVersionString ());
  }

  /**
   * Build the {@link ValidationExecutorSet} from the configured properties without registering it.
   * Requires that {@link #vesID(DVRCoordinate)}, a display name (via {@link #displayName(String)}
   * or {@link #displayNamePrefix(String)}), and a status have been set.
   *
   * @return The newly created VES. Never <code>null</code>.
   * @throws IllegalStateException
   *         if required properties are missing.
   */
  @NonNull
  public ValidationExecutorSet <IValidationSourceXML> createVES ()
  {
    if (m_aVESID == null)
      throw new IllegalStateException ("VESID is missing");

    final String sName = _resolveDisplayName ();

    // Build the status
    final IValidationExecutorSetStatus aStatus = new ValidationExecutorSetStatus (PDTFactory.getCurrentOffsetDateTime (),
                                                                                  m_bIsDeprecated ? EValidationExecutorStatusType.DEPRECATED
                                                                                                  : EValidationExecutorStatusType.VALID,
                                                                                  m_aValidFrom,
                                                                                  m_aValidTo,
                                                                                  (String) null,
                                                                                  (DVRCoordinate) null,
                                                                                  (ICommonsList <ValidationExecutorSetStatusHistoryItem>) null);
    final ValidationExecutorSet <IValidationSourceXML> aVES = new ValidationExecutorSet <> (m_aVESID, sName, aStatus);

    if (m_aBaseVES != null)
    {
      // If derived, copy all executors from the base VES first
      for (final IValidationExecutor <IValidationSourceXML> aVE : m_aBaseVES)
      {
        if (aVE instanceof final ValidationExecutorSchematron aSch)
        {
          if (m_aCustomErrorLevels != null && m_aCustomErrorLevels.isNotEmpty ())
          {
            // Explicitly apply the custom error levels
            aVES.addExecutor (aSch.getClone ().addCustomErrorDetails (m_aCustomErrorLevels));
          }
          else
            aVES.addExecutor (aSch);
        }
        else
          aVES.addExecutor (aVE);
      }
    }

    // Add all configured executors
    for (final IValidationExecutor <IValidationSourceXML> aVE : m_aExecutors)
    {
      aVES.addExecutor (aVE);
    }

    return aVES;
  }

  /**
   * Build the VES via {@link #createVES()}, register it in the provided registry, and also register
   * any aliases added via {@link #addAlias(Alias)}.
   *
   * @param aRegistry
   *        The registry to register the VES into. May not be <code>null</code>.
   */
  public void registerInto (@NonNull final IValidationExecutorSetRegistry <IValidationSourceXML> aRegistry)
  {
    ValueEnforcer.notNull (aRegistry, "Registry");

    final ValidationExecutorSet <IValidationSourceXML> aVES = createVES ();
    aRegistry.registerValidationExecutorSet (aVES);

    // Finally register also all aliases (e.g. for Zugferd)
    for (final Alias aAlias : m_aAliases)
    {
      aRegistry.registerValidationExecutorSet (new ValidationExecutorSetAlias <> (aAlias.vesID (),
                                                                                  aAlias.displayName (),
                                                                                  aVES));
    }
  }
}
