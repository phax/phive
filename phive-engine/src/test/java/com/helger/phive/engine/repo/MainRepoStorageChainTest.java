/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import com.helger.commons.collection.impl.CommonsArrayList;
import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.HttpClientSettings;
import com.helger.phive.engine.repo.impl.MockRepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.impl.RepoStorageHttp;
import com.helger.phive.engine.repo.impl.RepoStorageInMemory;
import com.helger.phive.engine.repo.util.JettyHelper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

public final class MainRepoStorageChainTest
{
  private final JettyHelper aJettyHelper = new JettyHelper("test-http");

  @Before
  public void startJetty() throws Exception
  {
    aJettyHelper.startJetty();
  }

  @After
  public void stopJetty() throws Exception
  {
    aJettyHelper.stopJetty();
  }

  @Nonnull
  private static RepoStorageHttp _createHttpRepo ()
  {
    HttpClientManager aHttpClientManager = HttpClientManager.create(new HttpClientSettings());
    return new RepoStorageHttp(aHttpClientManager, "http://localhost/");
  }

  @Test
  public void testChain()
  {
    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/http-only/http-only.txt");
    final RepoStorageInMemory aInMemory = new RepoStorageInMemory ();
    final MockRepoStorageLocalFileSystem aLocal = new MockRepoStorageLocalFileSystem ();
    final RepoStorageHttp aHttp = _createHttpRepo ();
    final RepoStorageChain aChain = RepoStorageChain.of (new CommonsArrayList <> (aInMemory, aLocal, aHttp),
                                                         new CommonsArrayList <> (aInMemory, aLocal));

    // Ensure it does not exist locally
    assertNull (aLocal.read (aKey));

    try
    {
      // Read from chain, ending up with the item from HTTP
      RepoStorageItem aItem = aChain.read (aKey);
      assertNotNull (aItem);
      assertEquals ("This file is on HTTP native", aItem.getDataAsString (StandardCharsets.UTF_8));
      assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

      // Now it should be present locally only
      aItem = aLocal.read (aKey);
      assertEquals ("This file is on HTTP native", aItem.getDataAsString (StandardCharsets.UTF_8));
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
