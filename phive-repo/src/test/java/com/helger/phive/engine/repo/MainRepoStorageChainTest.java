/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.nio.charset.StandardCharsets;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.helger.commons.state.EEnabled;
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.engine.repo.impl.MockRepoStorageLocalFileSystem;
import com.helger.phive.engine.repo.impl.RepoStorageHttp;
import com.helger.phive.engine.repo.impl.RepoStorageInMemory;
import com.helger.phive.engine.repo.util.JettyHelper;

public final class MainRepoStorageChainTest
{
  private final JettyHelper aJettyHelper = JettyHelper.createDefaultTestInstance (EEnabled.DISABLED);

  @Before
  public void startJetty () throws Exception
  {
    aJettyHelper.startJetty ();
  }

  @After
  public void stopJetty () throws Exception
  {
    aJettyHelper.stopJetty ();
  }

  @Test
  public void testChain ()
  {
    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/http-only/http-only.txt");
    final RepoStorageInMemory aInMemory = new RepoStorageInMemory ();
    final MockRepoStorageLocalFileSystem aLocal = new MockRepoStorageLocalFileSystem ();
    final RepoStorageHttp aHttp = new RepoStorageHttp (new HttpClientManager (), "http://localhost/");
    final RepoStorageChain aChain = RepoStorageChain.of (aInMemory, aLocal, aHttp);

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
