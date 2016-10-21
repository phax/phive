/**
 * Copyright (C) 2014-2016 Philip Helger (www.helger.com)
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
package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;

import org.w3c.dom.Node;

import com.helger.bdve.result.ValidationResult;

/**
 * Base interface for performing validation of a single document.
 *
 * @author Philip Helger
 */
public interface IValidationExecutor
{
  /**
   * Perform validation
   *
   * @param aNode
   *        Node to be validated.
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull @WillClose final Node aNode)
  {
    return applyValidation (aNode, (ClassLoader) null);
  }

  /**
   * Perform validation
   *
   * @param aNode
   *        Node to be validated.
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code> to use the
   *        default context class loader.
   * @return Never <code>null</code>.
   */
  @Nonnull
  ValidationResult applyValidation (@Nonnull @WillClose Node aNode, @Nullable ClassLoader aClassLoader);
}
