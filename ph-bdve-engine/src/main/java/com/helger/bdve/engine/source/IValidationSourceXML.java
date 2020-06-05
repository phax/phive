/**
 * Copyright (C) 2014-2020 Philip Helger (www.helger.com)
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
package com.helger.bdve.engine.source;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.transform.Source;

import org.w3c.dom.Node;

import com.helger.bdve.api.source.IValidationSource;
import com.helger.xml.XMLHelper;
import com.helger.xml.transform.TransformSourceFactory;

/**
 * Abstract validation source.
 *
 * @author Philip Helger
 */
public interface IValidationSourceXML extends IValidationSource
{
  /**
   * @return The source node to be validated. May be <code>null</code>.
   */
  @Nullable
  Node getNode ();

  /**
   * @return This validation source as a `javax.xml.transform.Source`. Never
   *         <code>null</code>.
   * @throws IllegalStateException
   *         If no transform source object can be created.
   */
  @Nonnull
  default Source getAsTransformSource ()
  {
    final Node aNode = getNode ();
    if (aNode == null)
      throw new IllegalStateException ("No input Node is present!");

    Source ret = null;
    if (isPartialSource ())
      ret = TransformSourceFactory.create (aNode);
    else
    {
      // Always use the Document node! Otherwise this may lead to weird XSLT
      // errors
      ret = TransformSourceFactory.create (XMLHelper.getOwnerDocument (aNode));
    }
    if (ret == null)
      throw new IllegalStateException ("No valid input Node is present!");

    ret.setSystemId (getSystemID ());
    return ret;
  }
}
