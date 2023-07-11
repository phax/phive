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

import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.helger.commons.state.EEnabled;
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.util.JettyHelper;

public final class RepoStorageHttpTest
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

  @Nonnull
  private static RepoStorageHttp _createRepo ()
  {
    return new RepoStorageHttp (new HttpClientManager (), "http://localhost/");
  }

  @Test
  public void testRead ()
  {
    final RepoStorageHttp aRepo = _createRepo ();

    // Existing only in "local fs" repo
    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/http.txt"));
    assertNull (aItem);

    // This one exists
    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/http-only/http.txt"));
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsString (StandardCharsets.UTF_8));
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());
  }
}
