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
package com.helger.bdve.spec;

import javax.annotation.Nonnegative;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.collection.ext.ICommonsList;
import com.helger.commons.text.display.IHasDisplayText;

/**
 * Defines a predefined specification profile. Each profile consists of a set of
 * transactions ({@link ISpecificationTransaction}).
 *
 * @author PEPPOL.AT, BRZ, Philip Helger
 */
public interface ISpecificationProfile extends IHasDisplayText
{
  /**
   * @return The numeric value of this profile (e.g. BII04 returns 4, BII22
   *         returns 22 etc.). Some special profiles (like BII2 MLR) return 0!
   */
  @Nonnegative
  int getNumber ();

  /**
   * @return A non-<code>null</code> non empty list of all transactions
   *         contained in this profile.
   */
  @Nonnull
  @Nonempty
  @ReturnsMutableCopy
  ICommonsList <? extends ISpecificationTransaction> getAllTransactions ();

  /**
   * Check if the passed transaction is contained in this profile.
   *
   * @param aTransaction
   *        The transaction to query. May be <code>null</code>.
   * @return <code>true</code> if the passed transaction is contained in this
   *         profile, <code>false</code> otherwise.
   */
  boolean containsTransaction (@Nullable ISpecificationTransaction aTransaction);
}
