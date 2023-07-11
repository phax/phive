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

import java.io.File;
import java.util.concurrent.ThreadLocalRandom;

import javax.annotation.Nonnull;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.helger.commons.io.file.FileOperationManager;
import com.helger.commons.state.EEnabled;
import com.helger.commons.state.ESuccess;
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.util.JettyHelper;

public final class RepoStorageHttpWithPutTest
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
  private static RepoStorageHttpWithPut _createRepo ()
  {
    return new RepoStorageHttpWithPut (new HttpClientManager (), "http://localhost/");
  }

  @Test
  public void testRead ()
  {
    final RepoStorageHttpWithPut aRepo = _createRepo ();

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/http-only/http-only.txt"));
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());

    // Ensure the one written below, is not existing
    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/written/http-write.txt"));
    assertNull (aItem);
  }

  @Test
  public void testWrite ()
  {
    final RepoStorageHttpWithPut aRepo = _createRepo ();

    final RepoStorageKey aKey = RepoStorageKey.of ("com/ecosio/written/http-write.txt");

    // Ensure not existing
    assertNull (aRepo.read (aKey));

    final String sUploadedPayload = "bla-" + ThreadLocalRandom.current ().nextInt ();

    try
    {
      // Write
      final ESuccess eSuccess = aRepo.write (aKey, RepoStorageItem.ofUtf8 (sUploadedPayload));
      assertTrue (eSuccess.isSuccess ());

      // Read again
      final RepoStorageItem aItem = aRepo.read (aKey);
      assertNotNull (aItem);
      assertEquals (sUploadedPayload, aItem.getDataAsUtf8String ());
      assertSame (EHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Cleanup
      final File file1 = new File (JettyHelper.DEFAULT_TEST_BASE_DIR, "com/ecosio/written/http-write.txt");
      FileOperationManager.INSTANCE.deleteFile (file1);

      final File file2 = new File (JettyHelper.DEFAULT_TEST_BASE_DIR, "com/ecosio/written/http-write.txt.sha256");
      FileOperationManager.INSTANCE.deleteFile (file2);
    }
  }
}
