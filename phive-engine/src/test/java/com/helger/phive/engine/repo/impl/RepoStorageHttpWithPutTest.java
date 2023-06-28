/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.commons.state.ESuccess;
import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.HttpClientSettings;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.util.JettyHelper;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.File;
import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public final class RepoStorageHttpWithPutTest
{
  private final JettyHelper aJettyHelper = new JettyHelper();

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
  private static RepoStorageHttpWithPut _createRepo ()
  {
    HttpClientManager aHttpClientManager = HttpClientManager.create(new HttpClientSettings());
    return new RepoStorageHttpWithPut(aHttpClientManager, "http://localhost/");
  }

  @Test
  public void testRead()
  {
    final RepoStorageHttpWithPut aRepo = _createRepo ();

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/http.txt"));
    assertNotNull (aItem);
    assertEquals ("bla", aItem.getDataAsString (StandardCharsets.UTF_8));
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());
  }

  @Test
  public void testWrite() {
    final RepoStorageHttpWithPut aRepo = _createRepo();

    final RepoStorageKey aKey = RepoStorageKey.of("com/ecosio/written/http_write.txt");
    // Ensure not existing
    assertNull(aRepo.read(aKey));

    try {
      // Write
      final ESuccess eSuccess = aRepo.write(aKey, RepoStorageItem.of("bla".getBytes(StandardCharsets.ISO_8859_1)));
      assertTrue(eSuccess.isSuccess());

      // Read again
      final RepoStorageItem aItem = aRepo.read(aKey);
      assertNotNull(aItem);
      assertEquals("bla", aItem.getDataAsString(StandardCharsets.UTF_8));
      assertSame(EHashState.VERIFIED_MATCHING, aItem.getHashState());
    } finally {
      // Cleanup
      File file1 = new File ("test-repo/com/ecosio/written/http_write.txt");
      file1.delete();
      File file2 = new File ("test-repo/com/ecosio/written/http_write.txt.sha256");
      file2.delete();
    }
  }
}
