/*
 * Copyright (C) 2023-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.ves.engine.load;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.jspecify.annotations.NonNull;
import org.junit.Test;

import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.ERepoDeletable;
import com.helger.diver.repo.ERepoWritable;
import com.helger.diver.repo.RepoStorageContentByteArray;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.impl.RepoStorageInMemory;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.ves.v10.VesResourceType;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.source.IValidationSourceXML;

/**
 * Test class for class {@link DefaultVESLoaderXSD} with ZIP resources.
 *
 * @author Philip Helger
 */
public final class DefaultVESLoaderXSDTest
{
  private static final String MAIN_XSD = "<xs:schema xmlns:xs='http://www.w3.org/2001/XMLSchema'>" +
                                         "<xs:element name='root' type='xs:string' />" +
                                         "</xs:schema>";

  private static byte @NonNull [] _zip (@NonNull final String... aNamesAndContents) throws IOException
  {
    final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ();
    try (final ZipOutputStream aZOS = new ZipOutputStream (aBAOS))
    {
      for (int i = 0; i < aNamesAndContents.length; i += 2)
      {
        aZOS.putNextEntry (new ZipEntry (aNamesAndContents[i]));
        aZOS.write (aNamesAndContents[i + 1].getBytes (StandardCharsets.UTF_8));
        aZOS.closeEntry ();
      }
    }
    return aBAOS.toByteArray ();
  }

  @NonNull
  private static ErrorList _load (final byte @NonNull [] aZip, final boolean bExpectSuccess)
  {
    final RepoStorageInMemory aRepo = RepoStorageInMemory.createDefault ("test",
                                                                        ERepoWritable.WITH_WRITE,
                                                                        ERepoDeletable.WITHOUT_DELETE);
    final DVRCoordinate aCoord = DVRCoordinate.parseOrNull ("com.helger.phive.test:zip:1.0");
    assertTrue (aRepo.write (RepoStorageKeyOfArtefact.of (aCoord, DefaultVESLoaderXSD.FILE_EXT_ZIP),
                             RepoStorageContentByteArray.of (aZip))
                     .isSuccess ());

    final VesResourceType aResource = new VesResourceType ();
    aResource.setGroupId (aCoord.getGroupID ());
    aResource.setArtifactId (aCoord.getArtifactID ());
    aResource.setVersion (aCoord.getVersionString ());
    aResource.setType (DefaultVESLoaderXSD.RESOURCE_TYPE_ZIP);
    final VesXsdType aXSD = new VesXsdType ();
    aXSD.setResource (aResource);
    aXSD.setMain ("main.xsd");

    final ErrorList aErrorList = new ErrorList ();
    final IValidationExecutor <IValidationSourceXML> aExecutor = new DefaultVESLoaderXSD ().loadXSD (aRepo,
                                                                                                      aXSD,
                                                                                                      null,
                                                                                                      aErrorList,
                                                                                                      (v, e) -> null);
    if (bExpectSuccess)
    {
      assertNotNull (aErrorList.toString (), aExecutor);
      assertTrue (aErrorList.toString (), aErrorList.containsNoError ());
    }
    else
    {
      assertNull (aExecutor);
      assertEquals (aErrorList.toString (), 1, aErrorList.getAllFailures ().size ());
    }
    return aErrorList;
  }

  @Test
  public void testValid () throws IOException
  {
    _load (_zip ("main.xsd", MAIN_XSD, "other.xsd", MAIN_XSD), true);
  }

  @Test
  public void testNotAZip ()
  {
    final ErrorList aErrorList = _load ("not a zip".getBytes (StandardCharsets.UTF_8), false);
    assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("is not a ZIP archive"));
  }

  @Test
  public void testMainMissing () throws IOException
  {
    final ErrorList aErrorList = _load (_zip ("other.xsd", MAIN_XSD), false);
    assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("does not contain the main element"));
  }

  @Test
  public void testDuplicateEntry () throws IOException
  {
    // Both names unify to "/dir/main.xsd"
    final ErrorList aErrorList = _load (_zip ("main.xsd", MAIN_XSD, "dir/a.xsd", MAIN_XSD, "dir\\a.xsd", MAIN_XSD),
                                        false);
    assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("more than once"));
  }

  @Test
  public void testMaxZipEntryCount () throws IOException
  {
    final byte [] aZip = _zip ("main.xsd", MAIN_XSD, "a.xsd", MAIN_XSD, "b.xsd", MAIN_XSD);
    final int nOld = DefaultVESLoaderXSD.getMaxZipEntryCount ();
    try
    {
      DefaultVESLoaderXSD.setMaxZipEntryCount (3);
      _load (aZip, true);

      DefaultVESLoaderXSD.setMaxZipEntryCount (2);
      final ErrorList aErrorList = _load (aZip, false);
      assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("more than 2 entries"));
    }
    finally
    {
      DefaultVESLoaderXSD.setMaxZipEntryCount (nOld);
    }
  }

  @Test
  public void testMaxUnzippedSize () throws IOException
  {
    final byte [] aZip = _zip ("main.xsd", MAIN_XSD);
    final long nOld = DefaultVESLoaderXSD.getMaxUnzippedSize ();
    try
    {
      DefaultVESLoaderXSD.setMaxUnzippedSize (MAIN_XSD.length ());
      _load (aZip, true);

      DefaultVESLoaderXSD.setMaxUnzippedSize (MAIN_XSD.length () - 1);
      final ErrorList aErrorList = _load (aZip, false);
      assertTrue (aErrorList.toString (), aErrorList.toString ().contains ("exceeds maximum unzipped size"));
    }
    finally
    {
      DefaultVESLoaderXSD.setMaxUnzippedSize (nOld);
    }
  }
}
