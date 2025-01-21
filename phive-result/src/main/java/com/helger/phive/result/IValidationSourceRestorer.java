/*
 * Copyright (C) 2014-2025 Philip Helger (www.helger.com)
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
package com.helger.phive.result;

import javax.annotation.Nullable;

import com.helger.phive.api.source.IValidationSource;

/**
 * Callback interface to restore a {@link IValidationSource} from deserialized
 * parameters.
 *
 * @author Philip Helger
 * @since 10.1.0
 */
public interface IValidationSourceRestorer
{
  /**
   * Restore a validation source
   *
   * @param sValidationSourceTypeID
   *        The validation source type ID. Must be non-<code>null</code> to be
   *        able to restore something.
   * @param sSystemID
   *        The system ID of the validation source. May be <code>null</code>.
   * @param bIsPartialSource
   *        <code>true</code> if it is a partial source, <code>false</code> if
   *        it is complete.
   * @param aPayloadBytes
   *        The payload bytes to restore the source from. Must be
   *        non-<code>null</code> to be able to restore something.
   * @return <code>null</code> if restore failed
   */
  @Nullable
  IValidationSource restoreValidationSource (@Nullable String sValidationSourceTypeID,
                                             @Nullable String sSystemID,
                                             boolean bIsPartialSource,
                                             @Nullable byte [] aPayloadBytes);
}
