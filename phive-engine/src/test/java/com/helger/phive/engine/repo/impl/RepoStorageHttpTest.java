/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.HttpClientSettings;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.util.JettyHelper;

import java.nio.charset.StandardCharsets;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import javax.annotation.Nonnull;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;

public final class RepoStorageHttpTest
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
  private static RepoStorageHttp _createRepo ()
  {
    HttpClientManager aHttpClientManager = HttpClientManager.create(new HttpClientSettings());
    return new RepoStorageHttp(aHttpClientManager, "http://");
  }

  @Test
  public void testRead()
  {
    final RepoStorageHttp aRepo = _createRepo ();

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("localhost/com/ecosio/test/http.txt"));
    assertNotNull (aItem);
    assertEquals ("bla", aItem.getDataAsString (StandardCharsets.UTF_8));
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());
  }
}
