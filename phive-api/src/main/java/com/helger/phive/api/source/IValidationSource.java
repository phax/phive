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
package com.helger.phive.api.source;

import java.io.IOException;
import java.io.OutputStream;

import com.helger.annotation.Nonempty;
import com.helger.annotation.WillNotClose;
import com.helger.base.string.StringHelper;

import jakarta.annotation.Nonnull;
import jakarta.annotation.Nullable;

/**
 * Abstract validation source interface. This represents an object to be validated.
 *
 * @author Philip Helger
 */
public interface IValidationSource
{
  /**
   * @return The validation source type ID. Neither <code>null</code> nor empty.
   * @since 10.1.0
   */
  @Nonnull
  @Nonempty
  String getValidationSourceTypeID ();

  /**
   * @return <code>true</code> if a system ID is present, <code>false</code> if not.
   * @since 10.1.0
   */
  default boolean hasSystemID ()
  {
    return StringHelper.isNotEmpty (getSystemID ());
  }

  /**
   * @return The system ID (e.g. filename) of the source to be validated. May be <code>null</code>.
   */
  @Nullable
  String getSystemID ();

  /**
   * @return <code>true</code> if this source is partial and <code>false</code> if the whole
   *         Document should be used. If it is partial there must be a way to define the necessary
   *         part(s) in the implementation.
   */
  boolean isPartialSource ();

  /**
   * Write the content of the validation source to the provided OutputStream.
   *
   * @param aOS
   *        The output stream to write to. May not be <code>null</code>.
   * @throws IOException
   *         In case writing fails
   * @since 10.1.0
   */
  void writeTo (@Nonnull @WillNotClose OutputStream aOS) throws IOException;
}
