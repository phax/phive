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
package com.helger.phive.repo.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.concurrent.ThreadLocalRandom;

import javax.annotation.Nonnull;

import org.junit.Test;

import com.helger.commons.state.ESuccess;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoHashState;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.impl.RepoStorageLocalFileSystem;

/**
 * Test class for class {@link RepoStorageLocalFileSystem}.
 *
 * @author Philip Helger
 */
public final class RepoStorageLocalFileSystemTest
{
  @Nonnull
  private static RepoStorageLocalFileSystem _createRepo ()
  {
    return new MockRepoStorageLocalFileSystem (ERepoWritable.WITH_WRITE, ERepoDeletable.WITH_DELETE);
  }

  @Test
  public void testRead ()
  {
    final RepoStorageLocalFileSystem aRepo = _createRepo ();

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/a.txt"));
    assertNotNull (aItem);
    assertEquals ("A", aItem.getDataAsUtf8String ());
    assertSame (ERepoHashState.NOT_VERIFIED, aItem.getHashState ());

    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/b.txt"));
    assertNotNull (aItem);
    assertEquals ("B", aItem.getDataAsUtf8String ());
    assertSame (ERepoHashState.NOT_VERIFIED, aItem.getHashState ());

    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/c.txt"));
    assertNull (aItem);
  }

  @Test
  public void testWrite ()
  {
    final RepoStorageLocalFileSystem aRepo = _createRepo ();

    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/written/a1");
    // Ensure not existing
    assertNull (aRepo.read (aKey));

    final String sUploadedPayload = "bla-" + ThreadLocalRandom.current ().nextInt ();

    try
    {
      // Write
      final ESuccess eSuccess = aRepo.write (aKey, RepoStorageItem.ofUtf8 (sUploadedPayload));
      assertTrue (eSuccess.isSuccess ());

      // Read again
      final RepoStorageItem aItem = aRepo.read (aKey);
      assertNotNull (aItem);
      assertEquals (sUploadedPayload, aItem.getDataAsUtf8String ());
      assertSame (ERepoHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Cleanup
      aRepo.delete (aKey);
      aRepo.delete (aKey.getKeyHashSha256 ());
    }
  }
}
