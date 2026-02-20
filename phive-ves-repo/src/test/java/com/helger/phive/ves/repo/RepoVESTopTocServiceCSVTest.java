/*
 * Copyright (C) 2026 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.phive.ves.repo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.util.concurrent.ThreadLocalRandom;

import org.junit.Test;

import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersion;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.diver.repo.ERepoDeletable;
import com.helger.diver.repo.ERepoWritable;
import com.helger.diver.repo.RepoStorageContentByteArray;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;

/**
 * Test class for class {@link RepoVESTopTocServiceCSV}.
 *
 * @author Philip Helger
 */
public final class RepoVESTopTocServiceCSVTest
{
  @Test
  public void testUpdates () throws DVRVersionException
  {
    final MockRepoStorageLocalFileSystem aRepo = new MockRepoStorageLocalFileSystem (ERepoWritable.WITH_WRITE,
                                                                                     ERepoDeletable.WITH_DELETE);
    final String sUploadedPayload = "bla-" + ThreadLocalRandom.current ().nextInt ();

    // Service not yet initialized
    assertEquals (-1, aRepo.getVESTopTocService ().getCount ());

    final DVRCoordinate aCoord1 = DVRCoordinate.create ("com.ecosio.test", "fs-written", "1");
    final RepoStorageKeyOfArtefact aKey1 = RepoStorageKeyOfArtefact.of (aCoord1, ".ves");
    try
    {
      // Ensure not existing
      assertFalse (aRepo.exists (aKey1));

      // Write - should trigger update of VES
      assertTrue (aRepo.write (aKey1, RepoStorageContentByteArray.ofUtf8 (sUploadedPayload)).isSuccess ());

      assertEquals (1, aRepo.getVESTopTocService ().getCount ());

      final RepoStorageKeyOfArtefact aKey2 = RepoStorageKeyOfArtefact.of (aCoord1.getWithVersion (DVRVersion.parseOrThrow ("2")),
                                                                          ".ves");
      try
      {
        // Ensure not existing
        assertFalse (aRepo.exists (aKey2));

        // Write - should trigger update of VES
        assertTrue (aRepo.write (aKey2, RepoStorageContentByteArray.ofUtf8 (sUploadedPayload)).isSuccess ());

        assertEquals (2, aRepo.getVESTopTocService ().getCount ());
      }
      finally
      {
        aRepo.delete (aKey2);
      }
    }
    finally
    {
      aRepo.delete (aKey1);
    }
  }
}
