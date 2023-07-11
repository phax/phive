/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.commons.state.EEnabled;
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.engine.repo.impl.MockRepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.impl.RepoStorageHttp;
import com.helger.phive.engine.repo.impl.RepoStorageInMemory;
import com.helger.phive.engine.repo.impl.RepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.util.JettyHelper;

public final class RepoStorageChainTest
{
  private static final JettyHelper JETTY_HELPER = JettyHelper.createDefaultTestInstance (EEnabled.ENABLED);

  @BeforeClass
  public static void beforeClass () throws Exception
  {
    JETTY_HELPER.startJetty ();
  }

  @AfterClass
  public static void afterClass () throws Exception
  {
    JETTY_HELPER.stopJetty ();
  }

  @Test
  public void testReadAndCacheAndRead ()
  {
    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/http-only/http-only.txt");

    final RepoStorageInMemory aInMemory = new RepoStorageInMemory ();
    final RepoStorageLocalFileSystem aLocal = new MockRepoStorageLocalFileSystem ();
    final RepoStorageHttp aHttp = new RepoStorageHttp (new HttpClientManager (), "http://localhost/", false);
    final RepoStorageChain aChain = RepoStorageChain.of (new CommonsArrayList <> (aInMemory, aLocal, aHttp),
                                                         new CommonsArrayList <> (aInMemory, aLocal));
    assertTrue (aChain.isCacheRemoteContent ());
    assertEquals (3, aChain.internalGetStorages ().size ());
    assertEquals (2, aChain.internalGetWritableStorages ().size ());

    // Ensure it does not exist locally
    assertNull (aInMemory.read (aKey));
    assertNull (aLocal.read (aKey));

    try
    {
      // Read from chain, ending up with the item from HTTP
      RepoStorageItem aItem = aChain.read (aKey);
      assertNotNull (aItem);
      assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
      assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

      // Now it should be present in memory as well
      aItem = aInMemory.read (aKey);
      assertNotNull (aItem);
      assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());

      // Now it should be present locally as well
      aItem = aLocal.read (aKey);
      assertNotNull (aItem);
      assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Delete local files again
      aLocal.delete (aKey);
      aLocal.delete (aKey.getKeyHashSha256 ());
    }
  }

  @Test
  public void testReadNoCacheAndRead ()
  {
    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/http-only/http-only.txt");

    final RepoStorageInMemory aInMemory = new RepoStorageInMemory ();
    final RepoStorageLocalFileSystem aLocal = new MockRepoStorageLocalFileSystem ();
    final RepoStorageHttp aHttp = new RepoStorageHttp (new HttpClientManager (), "http://localhost/", false);
    final RepoStorageChain aChain = RepoStorageChain.of (new CommonsArrayList <> (aInMemory, aLocal, aHttp),
                                                         new CommonsArrayList <> (aInMemory, aLocal))
                                                    .setCacheRemoteContent (false);
    assertFalse (aChain.isCacheRemoteContent ());
    assertEquals (3, aChain.internalGetStorages ().size ());
    assertEquals (2, aChain.internalGetWritableStorages ().size ());

    // Ensure it does not exist locally
    assertNull (aInMemory.read (aKey));
    assertNull (aLocal.read (aKey));

    // Read from chain, ending up with the item from HTTP
    RepoStorageItem aItem = aChain.read (aKey);
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

    // Now it should be present in memory as well
    aItem = aInMemory.read (aKey);
    assertNull (aItem);

    // Now it should be present locally as well
    aItem = aLocal.read (aKey);
    assertNull (aItem);
  }
}
