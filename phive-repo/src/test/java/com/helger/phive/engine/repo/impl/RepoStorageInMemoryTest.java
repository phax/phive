/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.util.concurrent.ThreadLocalRandom;

import org.junit.Test;

import com.helger.commons.state.ESuccess;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;

public final class RepoStorageInMemoryTest
{
  @Test
  public void testWrite ()
  {
    final RepoStorageInMemory aRepo = new RepoStorageInMemory ();

    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/written/inmemory");
    // Ensure not existing
    assertNull (aRepo.read (aKey));

    final String sUploadedPayload = "bla-" + ThreadLocalRandom.current ().nextInt ();

    try
    {
      // Write
      final ESuccess eSuccess = aRepo.write (aKey,
                                             RepoStorageItem.of (sUploadedPayload.getBytes (StandardCharsets.UTF_8)));
      assertTrue (eSuccess.isSuccess ());

      // Read again
      final RepoStorageItem aItem = aRepo.read (aKey);
      assertNotNull (aItem);
      assertEquals (sUploadedPayload, aItem.getDataAsString (StandardCharsets.UTF_8));
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
