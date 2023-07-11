/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.concurrent.ThreadLocalRandom;

import org.junit.Test;

import com.helger.commons.state.ESuccess;
import com.helger.phive.engine.repo.ERepoHashState;
import com.helger.phive.engine.repo.ERepoDeletable;
import com.helger.phive.engine.repo.ERepoWritable;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;

public final class RepoStorageInMemoryTest
{
  @Test
  public void testReadWriteReadDelete ()
  {
    final RepoStorageInMemory aRepo = RepoStorageInMemory.createDefault (ERepoWritable.WITH_WRITE,
                                                                         ERepoDeletable.WITH_DELETE);
    assertTrue (aRepo.canWrite ());
    assertTrue (aRepo.canDelete ());

    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/written/inmemory");
    // Ensure not existing
    assertNull (aRepo.read (aKey));

    final String sUploadedPayload = "bla-" + ThreadLocalRandom.current ().nextInt ();

    try
    {
      // Write
      ESuccess eSuccess = aRepo.write (aKey, RepoStorageItem.ofUtf8 (sUploadedPayload));
      assertTrue (eSuccess.isSuccess ());

      // Read again
      RepoStorageItem aItem = aRepo.read (aKey);
      assertNotNull (aItem);
      assertEquals (sUploadedPayload, aItem.getDataAsUtf8String ());
      assertSame (ERepoHashState.VERIFIED_MATCHING, aItem.getHashState ());

      // Delete
      eSuccess = aRepo.delete (aKey);
      assertTrue (eSuccess.isSuccess ());

      // Read again
      aItem = aRepo.read (aKey);
      assertNull (aItem);
    }
    finally
    {
      // Cleanup
      aRepo.delete (aKey);
    }
  }

  @Test (expected = UnsupportedOperationException.class)
  public void testReadOnly ()
  {
    final RepoStorageInMemory aRepo = RepoStorageInMemory.createDefault (ERepoWritable.WITHOUT_WRITE,
                                                                         ERepoDeletable.WITHOUT_DELETE);
    assertFalse (aRepo.canWrite ());
    assertFalse (aRepo.canDelete ());
    assertTrue (aRepo.isAllowOverwrite ());

    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/written/inmemory");
    final String sUploadedPayload = "bla-" + ThreadLocalRandom.current ().nextInt ();

    // Register only payload, but no hash
    aRepo.registerObject (aKey, sUploadedPayload.getBytes (StandardCharsets.UTF_8));

    // Read again
    final RepoStorageItem aItem = aRepo.read (aKey);
    assertNotNull (aItem);
    assertEquals (sUploadedPayload, aItem.getDataAsUtf8String ());
    assertSame (ERepoHashState.NOT_VERIFIED, aItem.getHashState ());

    // Throws exception
    aRepo.write (aKey, RepoStorageItem.ofUtf8 ("something else"));
  }
}
