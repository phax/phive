/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.phive.engine.repo.impl.MockRepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.impl.RepoStorageInMemory;

import java.nio.charset.StandardCharsets;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

/**
 * Test class for class {@link RepoStorageChain}.
 *
 * @author Philip Helger
 */
public final class MainRepoStorageChainTest
{
  public static void main (final String [] args)
  {
    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/test/s3-only.txt");
    final RepoStorageInMemory aInMemory = new RepoStorageInMemory ();
    final MockRepoStorageLocalFileSystem aLocal = new MockRepoStorageLocalFileSystem ();
    final RepoStorageChain aChain = RepoStorageChain.of (new CommonsArrayList <> (aInMemory, aLocal),
                                                         new CommonsArrayList <> (aInMemory, aLocal));

    // Ensure it does not exist locally
    assertNull (aLocal.read (aKey));

    try
    {
      // Read from chain, ending up with the item from S3
      RepoStorageItem aItem = aChain.read (aKey);
      assertNotNull (aItem);
      assertEquals ("This file is on S3 native", aItem.getDataAsString (StandardCharsets.UTF_8));
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());

      // Now it should be present locally only
      aItem = aLocal.read (aKey);
      assertEquals ("This file is on S3 native", aItem.getDataAsString (StandardCharsets.UTF_8));
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Delete local files again
      aLocal.delete (aKey);
      aLocal.delete (aKey.getKeyHashSha256 ());
    }
  }
}
