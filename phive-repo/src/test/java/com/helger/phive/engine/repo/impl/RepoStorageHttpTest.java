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

import javax.annotation.Nonnull;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.helger.commons.state.EEnabled;
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.util.JettyHelper;

public final class RepoStorageHttpTest
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

  @Nonnull
  private static RepoStorageHttp _createRepoReadOnly ()
  {
    return new RepoStorageHttp (new HttpClientManager (), "http://localhost/");
  }

  @Test
  public void testRead ()
  {
    final RepoStorageHttp aRepo = _createRepoReadOnly ();

    // Existing only in "local fs" repo
    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/http.txt"));
    assertNull (aItem);

    // This one exists
    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/http-only/http-only.txt"));
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());
  }
}
