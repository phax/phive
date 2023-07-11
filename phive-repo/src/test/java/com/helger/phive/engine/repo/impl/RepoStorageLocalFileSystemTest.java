/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.commons.state.ESuccess;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;

import org.junit.Test;

import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

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
    return new MockRepoStorageLocalFileSystem ();
  }

  @Test
  public void testRead ()
  {
    final RepoStorageLocalFileSystem aRepo = _createRepo ();

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/a.txt"));
    assertNotNull (aItem);
    assertEquals ("A", aItem.getDataAsString (StandardCharsets.UTF_8));
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/b.txt"));
    assertNotNull (aItem);
    assertEquals ("B", aItem.getDataAsString (StandardCharsets.UTF_8));
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

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

    try
    {
      // Write
      final ESuccess eSuccess = aRepo.write (aKey, RepoStorageItem.of ("bla".getBytes (StandardCharsets.ISO_8859_1)));
      assertTrue (eSuccess.isSuccess ());

      // Read again
      final RepoStorageItem aItem = aRepo.read (aKey);
      assertNotNull (aItem);
      assertEquals ("bla", aItem.getDataAsString (StandardCharsets.UTF_8));
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Cleanup
      aRepo.delete (aKey);
      aRepo.delete (aKey.getKeyHashSha256 ());
    }
  }
}
