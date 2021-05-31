package com.helger.phive.engine.vom;

import java.util.List;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

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
import com.helger.phive.engine.vom.v10.VOMEdifactType;
import com.helger.phive.engine.vom.v10.VOMOptionType;
import com.helger.phive.engine.vom.v10.VOMSchematronType;
import com.helger.phive.engine.vom.v10.VOMType;
import com.helger.phive.engine.vom.v10.VOMValidationType;
import com.helger.phive.engine.vom.v10.VOMXSDType;

@Immutable
public final class VOMValidator
{
  public enum EVOMErrorCode
  {
    REQUIRED ("The element must be provided."),
    REQUIRED_NOT_EMPTY ("The element must be provided and not empty."),
    NO_VALIDATION_RULES ("No validation rules are contained."),
    BUILTIN_RESOURCE_NOT_FOUND ("The built-in resource ''{0}'' could not be found."),
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
                                  @Nonnull final IVOMResourceResolver aResourceResolver,
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
        final IReadableResource aRes = aResourceResolver.getResourceOfID (sBuiltIn);
        if (aRes == null)
          aErrorList.add (_createError (EVOMErrorCode.BUILTIN_RESOURCE_NOT_FOUND.getErrorMessage (sBuiltIn), sXPath + "/builtin"));
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
      // TODO
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
          validateXSD (sXPath + "/xsd[" + nIndex + "]", aXSD, aResourceResolver, aErrorList);
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
