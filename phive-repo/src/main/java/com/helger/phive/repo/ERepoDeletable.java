/*
 * Copyright (C) 2023 Philip Helger & ecosio
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
package com.helger.phive.repo;

import javax.annotation.Nonnull;

/**
 * Defines if a repository supports the action of deleting elements or not.
 *
 * @author Philip Helger
 */
public enum ERepoDeletable
{
  WITH_DELETE,
  WITHOUT_DELETE;

  public boolean isDeleteEnabled ()
  {
    return this == WITH_DELETE;
  }

  public boolean isDeleteDisabled ()
  {
    return this == WITHOUT_DELETE;
  }

  @Nonnull
  public static ERepoDeletable valueOf (final boolean b)
  {
    return b ? WITH_DELETE : WITHOUT_DELETE;
  }
}
