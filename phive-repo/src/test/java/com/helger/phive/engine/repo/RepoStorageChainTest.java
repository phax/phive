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
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.engine.repo.impl.MockRepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.impl.RepoStorageHttp;
import com.helger.phive.engine.repo.impl.RepoStorageInMemory;
import com.helger.phive.engine.repo.impl.RepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.util.LocalJettyRunner;

public final class RepoStorageChainTest
{
  private static final LocalJettyRunner JETTY_HELPER = LocalJettyRunner.createDefaultTestInstance (ERepoWritable.WITH_WRITE,
                                                                                                   ERepoDeletable.WITH_DELETE);

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

    final RepoStorageInMemory aInMemory = RepoStorageInMemory.createDefault (ERepoWritable.WITH_WRITE,
                                                                             ERepoDeletable.WITHOUT_DELETE);
    final RepoStorageLocalFileSystem aLocalFS = new MockRepoStorageLocalFileSystem (ERepoWritable.WITH_WRITE,
                                                                                    ERepoDeletable.WITH_DELETE);
    final RepoStorageHttp aHttp = new RepoStorageHttp (new HttpClientManager (),
                                                       "http://localhost/",
                                                       ERepoWritable.WITHOUT_WRITE,
                                                       ERepoDeletable.WITHOUT_DELETE);

    final RepoStorageChain aChain = RepoStorageChain.of (new CommonsArrayList <> (aInMemory, aLocalFS, aHttp),
                                                         new CommonsArrayList <> (aInMemory, aLocalFS));
    assertTrue (aChain.isCacheRemoteContent ());
    assertEquals (3, aChain.internalGetStorages ().size ());
    assertEquals (2, aChain.internalGetWritableStorages ().size ());

    // Ensure it does not exist locally
    assertNull (aInMemory.read (aKey));
    assertNull (aLocalFS.read (aKey));

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
      aItem = aLocalFS.read (aKey);
      assertNotNull (aItem);
      assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Delete local files again
      aLocalFS.delete (aKey);
      aLocalFS.delete (aKey.getKeyHashSha256 ());
    }
  }

  @Test
  public void testReadNoCacheAndRead ()
  {
    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/http-only/http-only.txt");

    final RepoStorageInMemory aInMemory = RepoStorageInMemory.createDefault (ERepoWritable.WITH_WRITE,
                                                                             ERepoDeletable.WITHOUT_DELETE);
    final RepoStorageLocalFileSystem aLocalFS = new MockRepoStorageLocalFileSystem (ERepoWritable.WITH_WRITE,
                                                                                    ERepoDeletable.WITH_DELETE);
    final RepoStorageHttp aHttp = new RepoStorageHttp (new HttpClientManager (),
                                                       "http://localhost/",
                                                       ERepoWritable.WITHOUT_WRITE,
                                                       ERepoDeletable.WITHOUT_DELETE);
    final RepoStorageChain aChain = RepoStorageChain.of (new CommonsArrayList <> (aInMemory, aLocalFS, aHttp),
                                                         new CommonsArrayList <> (aInMemory, aLocalFS))
                                                    .setCacheRemoteContent (false);
    assertFalse (aChain.isCacheRemoteContent ());
    assertEquals (3, aChain.internalGetStorages ().size ());
    assertEquals (2, aChain.internalGetWritableStorages ().size ());

    // Ensure it does not exist locally
    assertNull (aInMemory.read (aKey));
    assertNull (aLocalFS.read (aKey));

    // Read from chain, ending up with the item from HTTP
    RepoStorageItem aItem = aChain.read (aKey);
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

    // Now it should be present in memory as well
    aItem = aInMemory.read (aKey);
    assertNull (aItem);

    // Now it should be present locally as well
    aItem = aLocalFS.read (aKey);
    assertNull (aItem);
  }
}
