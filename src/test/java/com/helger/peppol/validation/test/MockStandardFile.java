/**
 * Copyright (C) 2014-2015 Philip Helger (www.helger.com)
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
package com.helger.peppol.validation.test;

import java.util.Set;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.io.resource.ClassPathResource;
import com.helger.peppol.validation.domain.ExtendedTransactionKey;
import com.helger.peppol.validation.domain.TransactionKey;

/**
 * A special standard test file that ships with this library. It just contains a
 * default path resolution based on a filename.
 *
 * @author Philip Helger
 */
@Immutable
public class MockStandardFile
{
  public static final String STANDARD_PATH = "/xml/standard/";

  @Nonnull
  public static MockFile createGoodCase (@Nonnull final String sPath, @Nonnull final TransactionKey aTransactionKey)
  {
    return new MockFile (new ClassPathResource (STANDARD_PATH + sPath),
                         new ExtendedTransactionKey (aTransactionKey),
                         (Set <String>) null);
  }
}
