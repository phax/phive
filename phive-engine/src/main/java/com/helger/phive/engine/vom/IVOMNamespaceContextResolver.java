package com.helger.phive.engine.vom;

import javax.annotation.Nullable;

import com.helger.xml.namespace.MapBasedNamespaceContext;

/**
 * Generic interface to resolve namespace mappings via ID.
 *
 * @author Philip Helger
 */
public interface IVOMNamespaceContextResolver
{
  @Nullable
  MapBasedNamespaceContext getNamespaceContextOfID (@Nullable String sID);
}
