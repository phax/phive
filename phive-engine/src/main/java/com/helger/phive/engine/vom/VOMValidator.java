/**
 * Copyright (C) 2014-2021 Philip Helger (www.helger.com)
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
package com.helger.phive.engine.vom;

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;
import javax.xml.validation.Schema;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.collection.impl.CommonsHashSet;
import com.helger.commons.collection.impl.ICommonsSet;
import com.helger.commons.error.IError;
import com.helger.commons.error.SingleError;
import com.helger.commons.error.list.ErrorList;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.StringHelper;
import com.helger.commons.text.util.TextHelper;
import com.helger.phive.engine.vom.v10.VOMCoordinatesType;
import com.helger.phive.engine.vom.v10.VOMCustomError;
import com.helger.phive.engine.vom.v10.VOMEdifactType;
import com.helger.phive.engine.vom.v10.VOMNamespaceMappingType;
import com.helger.phive.engine.vom.v10.VOMNamespacesType;
import com.helger.phive.engine.vom.v10.VOMOptionType;
import com.helger.phive.engine.vom.v10.VOMSchematronType;
import com.helger.phive.engine.vom.v10.VOMType;
import com.helger.phive.engine.vom.v10.VOMValidationType;
import com.helger.phive.engine.vom.v10.VOMXSDType;
import com.helger.xml.namespace.MapBasedNamespaceContext;

@Immutable
public final class VOMValidator
{
  public enum EVOMErrorCode
  {
    REQUIRED ("The element must be provided."),
    REQUIRED_NOT_EMPTY ("The element must be provided and not empty."),
    NO_VALIDATION_RULES ("No validation rules are contained."),
    BUILTIN_XML_SCHEMA_NOT_FOUND ("The built-in XML Schema ''{0}'' could not be found."),
    BUILTIN_RESOURCE_NOT_FOUND ("The built-in resource ''{0}'' could not be found."),
    BUILTIN_NAMESPACE_CONTEXT_NOT_FOUND ("The built-in namespace context ''{0}'' could not be found."),
    NAMESPACE_PREFIX_ALREADY_MAPPED ("The namespace prefix ''{0}'' is already mapped. Overiding it with ''{1}''."),
    NAMESPACE_CONTEXT_EMPTY ("The resulting namespace context will be empty and have no effect."),
    CUSTOM_ERROR_ALREADY_MAPPED ("The custom error ID ''{0}'' is already mapped. It will be overwritten."),
    CUSTOM_ERRORS_EMPTY ("The resulting custom error map will be empty and have no effect."),
    OPTION_NAME_NOT_UNIQUE ("The option name ''{0}'' is not unique in the scope of ''{1}''."),
    EDIFACT_NOT_ALLOWED ("The usage of Edifact validation artefacts is not allowed in the configuration.");

    private final String m_sMsg;

    EVOMErrorCode (@Nonnull final String sMsg)
    {
      m_sMsg = sMsg;
    }

    @Nonnull
    public String getErrorMessage ()
    {
      return m_sMsg;
    }

    @Nonnull
    public String getErrorMessage (@Nonnull final Object... aArgs)
    {
      return TextHelper.getFormattedText (m_sMsg, aArgs);
    }
  }

  private VOMValidator ()
  {}

  @Nonnull
  private static IError _createError (@Nonnull final String sErrorText, @Nonnull final String sXPath)
  {
    return SingleError.builderError ().errorLocation (sXPath).errorText (sErrorText).build ();
  }

  @Nonnull
  private static IError _createError (@Nonnull final EVOMErrorCode e, @Nonnull final String sXPath)
  {
    return _createError (e.getErrorMessage (), sXPath);
  }

  @Nonnull
  private static IError _createWarn (@Nonnull final String sWarnText, @Nonnull final String sXPath)
  {
    return SingleError.builderWarn ().errorLocation (sXPath).errorText (sWarnText).build ();
  }

  @Nonnull
  private static IError _createWarn (@Nonnull final EVOMErrorCode e, @Nonnull final String sXPath)
  {
    return _createWarn (e.getErrorMessage (), sXPath);
  }

  public static void validateCoordinates (@Nonnull final String sXPath,
                                          @Nullable final VOMCoordinatesType aCoords,
                                          @Nonnull final ErrorList aErrorList)
  {
    if (aCoords == null)
    {
      aErrorList.add (_createError (EVOMErrorCode.REQUIRED, sXPath));
    }
    else
    {
      // Coordinates element is present
      if (StringHelper.hasNoText (aCoords.getGroupId ()))
        aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + "/groupId"));
      if (StringHelper.hasNoText (aCoords.getArtifactId ()))
        aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + "/artifactId"));
      if (StringHelper.hasNoText (aCoords.getVersion ()))
        aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + "/version"));
      // classifier is optional
    }
  }

  public static void validateOptions (@Nonnull final String sXPath,
                                      @Nonnull final String sLocalXPath,
                                      @Nullable final List <VOMOptionType> aOptions,
                                      @Nonnull final ErrorList aErrorList)
  {
    if (aOptions != null)
    {
      int nIndex = 1;
      final ICommonsSet <String> aNames = new CommonsHashSet <> ();
      for (final VOMOptionType aOption : aOptions)
      {
        // Name must be neither null nor empty
        final String sName = aOption.getName ();
        if (StringHelper.hasNoText (sName))
          aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + sLocalXPath + '[' + nIndex + "]/name"));
        else
          if (!aNames.add (sName))
            aErrorList.add (_createError (EVOMErrorCode.OPTION_NAME_NOT_UNIQUE.getErrorMessage (sName, sXPath),
                                          sXPath + '[' + nIndex + "]/name"));

        // Value may be empty
        final String sValue = aOption.getValue ();
        if (sValue == null)
          aErrorList.add (_createError (EVOMErrorCode.REQUIRED, sXPath + sLocalXPath + '[' + nIndex + "]/value"));

        nIndex++;
      }
    }
  }

  public static void validateXSD (@Nonnull final String sXPath,
                                  @Nullable final VOMXSDType aXSD,
                                  @Nonnull final IVOMXmlSchemaResolver aXmlSchemaResolver,
                                  @Nonnull final ErrorList aErrorList)
  {
    if (aXSD == null)
    {
      aErrorList.add (_createError (EVOMErrorCode.REQUIRED, sXPath));
    }
    else
    {
      final String sBuiltIn = aXSD.getBuiltIn ();
      if (sBuiltIn != null)
      {
        final Schema aRes = aXmlSchemaResolver.getXmlSchemaOfID (sBuiltIn);
        if (aRes == null)
          aErrorList.add (_createError (EVOMErrorCode.BUILTIN_XML_SCHEMA_NOT_FOUND.getErrorMessage (sBuiltIn), sXPath + "/builtin"));
      }
      else
      {
        // Resource
        validateCoordinates (sXPath + "/resource", aXSD.getResource (), aErrorList);
      }
      validateOptions (sXPath, "/option", aXSD.getOption (), aErrorList);
    }
  }

  public static void validateEdifact (@Nonnull final String sXPath,
                                      @Nullable final VOMEdifactType aEdifact,
                                      @Nonnull final ErrorList aErrorList)
  {
    if (aEdifact == null)
    {
      aErrorList.add (_createError (EVOMErrorCode.REQUIRED, sXPath));
    }
    else
    {
      if (StringHelper.hasNoText (aEdifact.getDirectory ()))
        aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + "/directory"));
      if (StringHelper.hasNoText (aEdifact.getMessage ()))
        aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + "/message"));
      validateOptions (sXPath, "/option", aEdifact.getOption (), aErrorList);
    }
  }

  public static void validateNamespaces (@Nonnull final String sXPath,
                                         @Nullable final VOMNamespacesType aNamespaces,
                                         @Nonnull final IVOMNamespaceContextResolver aNamespaceContextResolver,
                                         @Nonnull final ErrorList aErrorList)
  {
    // Is optional
    if (aNamespaces != null)
    {
      final String sBuiltIn = aNamespaces.getBuiltIn ();
      final MapBasedNamespaceContext aNsCtx;
      if (sBuiltIn != null)
      {
        // Built-in
        final MapBasedNamespaceContext ret = aNamespaceContextResolver.getNamespaceContextOfID (sBuiltIn);
        if (ret == null)
        {
          aErrorList.add (_createError (EVOMErrorCode.BUILTIN_NAMESPACE_CONTEXT_NOT_FOUND.getErrorMessage (sBuiltIn), sXPath + "/builtin"));
          // Avoid NPE later on
          aNsCtx = new MapBasedNamespaceContext ();
        }
        else
          aNsCtx = ret.getClone ();
      }
      else
      {
        // Start empty
        aNsCtx = new MapBasedNamespaceContext ();
      }

      int nIndex = 1;
      int nErrors = 0;
      for (final VOMNamespaceMappingType aMapping : aNamespaces.getMapping ())
      {
        final String sLocalXPath = sXPath + "/mapping[" + nIndex + ']';

        // Default to the default namespace prefix
        final String sPrefix = StringHelper.getNotNull (aMapping.getPrefix (), "");
        final String sNamespaceURI = aMapping.getNamespace ();

        if (StringHelper.hasNoText (sNamespaceURI))
        {
          aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sLocalXPath + "/namespace"));
          nErrors++;
        }
        else
        {
          if (aNsCtx.isPrefixMapped (sPrefix))
            aErrorList.add (_createWarn (EVOMErrorCode.NAMESPACE_PREFIX_ALREADY_MAPPED.getErrorMessage (sPrefix, sNamespaceURI),
                                         sLocalXPath + "/prefix"));
          aNsCtx.setMapping (sPrefix, sNamespaceURI);
        }

        ++nIndex;
      }

      if (!aNsCtx.hasAnyMapping () && nErrors == 0)
        aErrorList.add (_createWarn (EVOMErrorCode.NAMESPACE_CONTEXT_EMPTY, sXPath));
    }
  }

  public static void validateSchematron (@Nonnull final String sXPath,
                                         @Nullable final VOMSchematronType aSchematron,
                                         @Nonnull final IVOMNamespaceContextResolver aNamespaceContextResolver,
                                         @Nonnull final IVOMResourceResolver aResourceResolver,
                                         @Nonnull final ErrorList aErrorList)
  {
    if (aSchematron == null)
    {
      aErrorList.add (_createError (EVOMErrorCode.REQUIRED, sXPath));
    }
    else
    {
      final String sBuiltIn = aSchematron.getBuiltIn ();
      if (sBuiltIn != null)
      {
        final IReadableResource aRes = aResourceResolver.getResourceOfID (sBuiltIn);
        if (aRes == null)
          aErrorList.add (_createError (EVOMErrorCode.BUILTIN_RESOURCE_NOT_FOUND.getErrorMessage (sBuiltIn), sXPath + "/builtin"));
      }
      else
      {
        // Resource
        validateCoordinates (sXPath + "/resource", aSchematron.getResource (), aErrorList);
      }

      // TODO prerequisite
      validateNamespaces (sXPath + "/namespaces", aSchematron.getNamespaces (), aNamespaceContextResolver, aErrorList);

      // Custom errors
      if (aSchematron.hasCustomErrorEntries ())
      {
        int nIndex = 1;
        int nErrors = 0;
        final ICommonsSet <String> aIDs = new CommonsHashSet <> ();
        for (final VOMCustomError aCustomError : aSchematron.getCustomError ())
        {
          final String sLocalXPath = sXPath + "/customError[" + nIndex + ']';

          final String sID = aCustomError.getId ();
          if (StringHelper.hasNoText (sID))
          {
            aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sLocalXPath + "/id"));
            ++nErrors;
          }
          else
          {
            if (aIDs.contains (sID))
              aErrorList.add (_createWarn (EVOMErrorCode.CUSTOM_ERROR_ALREADY_MAPPED.getErrorMessage (sID), sLocalXPath + "/id"));
            aIDs.add (sID);
          }

          ++nIndex;
        }

        if (aIDs.isEmpty () && nErrors == 0)
          aErrorList.add (_createWarn (EVOMErrorCode.CUSTOM_ERRORS_EMPTY, sXPath));
      }

      validateOptions (sXPath, "/option", aSchematron.getOption (), aErrorList);
    }
  }

  public static void validateValidation (@Nonnull final String sXPath,
                                         @Nullable final VOMValidationType aValidation,
                                         @Nonnull final IVOMXmlSchemaResolver aXmlSchemaResolver,
                                         @Nonnull final IVOMNamespaceContextResolver aNamespaceContextResolver,
                                         @Nonnull final IVOMResourceResolver aResourceResolver,
                                         @Nonnull final VOMValidationSettings aSettings,
                                         @Nonnull final ErrorList aErrorList)
  {
    if (aValidation == null)
    {
      aErrorList.add (_createError (EVOMErrorCode.REQUIRED, sXPath));
    }
    else
    {
      // validation element is present
      if (aValidation.getXsdCount () + aValidation.getEdifactCount () + aValidation.getSchematronCount () == 0)
        aErrorList.add (_createError (EVOMErrorCode.NO_VALIDATION_RULES, sXPath));
      else
      {
        // XSD
        // XML uses 1-based indices
        int nIndex = 1;
        for (final VOMXSDType aXSD : aValidation.getXsd ())
        {
          validateXSD (sXPath + "/xsd[" + nIndex + "]", aXSD, aXmlSchemaResolver, aErrorList);
          ++nIndex;
        }

        // Edifact
        if (aSettings.isAllowEdifact ())
        {
          nIndex = 1;
          for (final VOMEdifactType aEdifact : aValidation.getEdifact ())
          {
            validateEdifact (sXPath + "/edifact[" + nIndex + "]", aEdifact, aErrorList);
            ++nIndex;
          }
        }
        else
        {
          if (!aValidation.getEdifact ().isEmpty ())
            aErrorList.add (_createError (EVOMErrorCode.EDIFACT_NOT_ALLOWED, sXPath));
        }

        // Schematron
        nIndex = 1;
        for (final VOMSchematronType aSchematron : aValidation.getSchematron ())
        {
          validateSchematron (sXPath + "/schematron[" + nIndex + "]",
                              aSchematron,
                              aNamespaceContextResolver,
                              aResourceResolver,
                              aErrorList);
          ++nIndex;
        }
      }
    }
  }

  public static void validate (@Nonnull final VOMType aVOM,
                               @Nonnull final IVOMXmlSchemaResolver aXmlSchemaResolver,
                               @Nonnull final IVOMNamespaceContextResolver aNamespaceContextResolver,
                               @Nonnull final IVOMResourceResolver aResourceResolver,
                               @Nonnull final VOMValidationSettings aSettings,
                               @Nonnull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aVOM, "VOM");
    ValueEnforcer.notNull (aXmlSchemaResolver, "XmlSchemaResolver");
    ValueEnforcer.notNull (aNamespaceContextResolver, "NamespaceContextResolver");
    ValueEnforcer.notNull (aResourceResolver, "ResourceResolver");
    ValueEnforcer.notNull (aSettings, "Settings");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    final String sXPath = "/ves";
    validateCoordinates (sXPath + "/id", aVOM.getId (), aErrorList);
    if (StringHelper.hasNoText (aVOM.getName ()))
      aErrorList.add (_createError (EVOMErrorCode.REQUIRED_NOT_EMPTY, sXPath + "/name"));
    validateValidation (sXPath + "/validation",
                        aVOM.getValidation (),
                        aXmlSchemaResolver,
                        aNamespaceContextResolver,
                        aResourceResolver,
                        aSettings,
                        aErrorList);
  }

  @Nonnull
  public static ErrorList validate (@Nonnull final VOMType aVOM,
                                    @Nonnull final IVOMXmlSchemaResolver aXmlSchemaResolver,
                                    @Nonnull final IVOMNamespaceContextResolver aNamespaceContextResolver,
                                    @Nonnull final IVOMResourceResolver aResourceResolver,
                                    @Nonnull final VOMValidationSettings aSettings)
  {
    final ErrorList aErrorList = new ErrorList ();
    validate (aVOM, aXmlSchemaResolver, aNamespaceContextResolver, aResourceResolver, aSettings, aErrorList);
    return aErrorList;
  }
}
