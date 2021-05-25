package com.helger.phive.engine.vom;

import javax.annotation.Nullable;
import javax.xml.validation.Schema;

/**
 * Resolver for VOM XML schemas that are referenced from the VOM.
 *
 * @author Philip Helger
 */
public interface IVOMXmlSchemaResolver
{
  /**
   * Find the XML schema with the provided ID.
   *
   * @param sID
   *        The XML schema ID to search. May be <code>null</code>.
   * @return The found XML schema or <code>null</code>.
   */
  @Nullable
  Schema getXmlSchemaOfID (@Nullable String sID);
}
