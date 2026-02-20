/*
 * Copyright (C) 2026 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.repo;

import org.jspecify.annotations.NonNull;

import com.helger.diver.repo.RepoStorageKey;

/**
 * Helper interface to determine if a specific path is a VES or a Status file relevant for updating
 * the VES top ToC
 *
 * @author Philip Helger
 */
public interface IRepoVESTopTocObjectTypeDeterminator
{
  /**
   * Check if the the provided repo storage key is a VES XML or not.
   *
   * @param aKey
   *        The key to check. Never <code>null</code>.
   * @return <code>true</code> if it is a VES XML, <code>false</code> if not.
   */
  boolean isVES (@NonNull RepoStorageKey aKey);

  /**
   * Check if the the provided repo storage key is a VES Status XML or not.
   *
   * @param aKey
   *        The key to check. Never <code>null</code>.
   * @return <code>true</code> if it is a VES Status XML, <code>false</code> if not.
   */
  boolean isStatus (@NonNull RepoStorageKey aKey);
}
