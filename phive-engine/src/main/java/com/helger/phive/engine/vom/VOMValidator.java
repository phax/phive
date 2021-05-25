package com.helger.phive.engine.vom;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.error.list.ErrorList;
import com.helger.phive.engine.vom.v10.VOMType;

@Immutable
public final class VOMValidator
{
  private VOMValidator ()
  {}

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

    // TODO
  }
}
