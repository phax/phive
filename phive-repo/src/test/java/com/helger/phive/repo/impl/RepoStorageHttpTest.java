/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.repo.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
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
import com.helger.commons.state.ESuccess;
import com.helger.httpclient.HttpClientManager;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoHashState;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.impl.RepoStorageHttp;
import com.helger.phive.repo.util.LocalJettyRunner;

public final class RepoStorageHttpTest
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

  @Nonnull
  private static RepoStorageHttp _createRepoReadOnly ()
  {
    return new RepoStorageHttp (new HttpClientManager (),
                                "http://localhost/",
                                ERepoWritable.WITHOUT_WRITE,
                                ERepoDeletable.WITHOUT_DELETE);
  }

  @Test
  public void testReadOnlyRead ()
  {
    final RepoStorageHttp aRepo = _createRepoReadOnly ();
    assertFalse (aRepo.canWrite ());

    // Existing only in "local fs" repo
    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/test/http.txt"));
    assertNull (aItem);

    // This one exists
    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/http-only/http-only.txt"));
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
    assertSame (ERepoHashState.NOT_VERIFIED, aItem.getHashState ());
  }

  @Nonnull
  private static RepoStorageHttp _createRepoWritable ()
  {
    return new RepoStorageHttp (new HttpClientManager (),
                                "http://localhost/",
                                ERepoWritable.WITH_WRITE,
                                ERepoDeletable.WITH_DELETE);
  }

  @Test
  public void testWritableRead ()
  {
    final RepoStorageHttp aRepo = _createRepoWritable ();
    assertTrue (aRepo.canWrite ());

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/http-only/http-only.txt"));
    assertNotNull (aItem);
    assertEquals ("This file is on HTTP native", aItem.getDataAsUtf8String ());
    assertSame (ERepoHashState.NOT_VERIFIED, aItem.getHashState ());

    // Ensure the one written below, is not existing
    aItem = aRepo.read (RepoStorageKey.of ("com/ecosio/written/http-write.txt"));
    assertNull (aItem);
  }

  @Test
  public void testWritableWriteAndRead ()
  {
    final RepoStorageHttp aRepo = _createRepoWritable ();
    assertTrue (aRepo.canWrite ());

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
      assertSame (ERepoHashState.VERIFIED_MATCHING, aItem.getHashState ());
    }
    finally
    {
      // Cleanup
      final File file1 = new File (LocalJettyRunner.DEFAULT_TEST_BASE_DIR, "com/ecosio/written/http-write.txt");
      FileOperationManager.INSTANCE.deleteFile (file1);

      final File file2 = new File (LocalJettyRunner.DEFAULT_TEST_BASE_DIR, "com/ecosio/written/http-write.txt.sha256");
      FileOperationManager.INSTANCE.deleteFile (file2);
    }
  }
}
