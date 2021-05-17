package com.helger.phive.engine.vom;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.jaxb.GenericJAXBMarshaller;
import com.helger.phive.engine.vom.v10.ObjectFactory;
import com.helger.phive.engine.vom.v10.VOMType;

/**
 * A marshaller to read Validation Object Model v1 declarations.
 *
 * @author Philip Helger
 */
public class VOM1Marshaller extends GenericJAXBMarshaller <VOMType>
{
  public static final ClassPathResource XSD = new ClassPathResource ("schemas/vom/vom-1.0.xsd",
                                                                     VOM1Marshaller.class.getClassLoader ());

  public VOM1Marshaller ()
  {
    super (VOMType.class, new CommonsArrayList <> (XSD), new ObjectFactory ()::createVom);
  }
}
