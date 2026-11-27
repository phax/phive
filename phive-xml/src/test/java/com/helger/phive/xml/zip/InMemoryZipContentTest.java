/*
 * Copyright (C) 2014-2026 Philip Helger (www.helger.com)
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
package com.helger.phive.xml.zip;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.jspecify.annotations.NonNull;
import org.junit.Test;

import com.helger.base.io.nonblocking.NonBlockingByteArrayInputStream;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.io.stream.StreamHelper;
import com.helger.collection.commons.CommonsArrayList;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;

/**
 * Test class for class {@link InMemoryZipContent}.
 *
 * @author Philip Helger
 */
public final class InMemoryZipContentTest
{
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
  private static ErrorList _readError (final byte @NonNull [] aZip, final long nMaxUnzippedSize, final int nMaxEntryCount)
  {
    final ErrorList aErrorList = new ErrorList ();
    assertNull (InMemoryZipContent.readZip (new NonBlockingByteArrayInputStream (aZip),
                                            nMaxUnzippedSize,
                                            nMaxEntryCount,
                                            "Test ZIP",
                                            aErrorList));
    assertEquals (aErrorList.toString (), 1, aErrorList.size ());
    return aErrorList;
  }

  @Test
  public void testGetUnifiedPath ()
  {
    assertNull (InMemoryZipContent.getUnifiedPath (null));
    assertEquals ("/a.xsd", InMemoryZipContent.getUnifiedPath ("a.xsd"));
    assertEquals ("/a.xsd", InMemoryZipContent.getUnifiedPath ("/a.xsd"));
    assertEquals ("/dir/a.xsd", InMemoryZipContent.getUnifiedPath ("dir\\a.xsd"));
  }

  @Test
  public void testRead () throws IOException
  {
    final ErrorList aErrorList = new ErrorList ();
    final InMemoryZipContent aZip = InMemoryZipContent.readZip (new NonBlockingByteArrayInputStream (_zip ("b.txt",
                                                                                                           "bb",
                                                                                                           "dir/a.txt",
                                                                                                           "a")),
                                                                InMemoryZipContent.DEFAULT_MAX_UNZIPPED_SIZE,
                                                                InMemoryZipContent.DEFAULT_MAX_ZIP_ENTRY_COUNT,
                                                                "Test ZIP",
                                                                aErrorList);
    assertNotNull (aErrorList.toString (), aZip);
    assertTrue (aErrorList.isEmpty ());
    assertEquals (2, aZip.getEntryCount ());
    assertEquals (3, aZip.getTotalUncompressedBytes ());
    // ZIP order is kept
    assertEquals (new CommonsArrayList <> ("/b.txt", "/dir/a.txt"), new CommonsArrayList <> (aZip.getAllEntryPaths ()));

    // Lookup paths are unified
    assertTrue (aZip.containsEntry ("dir\\a.txt"));
    assertTrue (aZip.containsEntry ("/dir/a.txt"));
    assertFalse (aZip.containsEntry ("a.txt"));
    assertNull (aZip.getEntryInputStream ("a.txt"));
    assertNull (aZip.getEntryAsResource ("a.txt"));
    assertEquals ("a",
                  StreamHelper.getAllBytesAsString (aZip.getEntryInputStream ("dir/a.txt"), StandardCharsets.UTF_8));

    final ReadableResourceByteArray aRes = aZip.getEntryAsResource ("dir/a.txt");
    assertNotNull (aRes);
    assertEquals ("/dir/a.txt", aRes.getPath ());
    assertEquals ("/dir/a.txt", aRes.getResourceID ());
    assertEquals ("a", StreamHelper.getAllBytesAsString (aRes, StandardCharsets.UTF_8));
  }

  @Test
  public void testErrors () throws IOException
  {
    assertTrue (_readError ("not a zip".getBytes (StandardCharsets.UTF_8), 100, 10).toString ()
                                                                                .contains ("Test ZIP is not a ZIP archive"));

    // Both names unify to "/dir/a.txt"
    assertTrue (_readError (_zip ("dir/a.txt", "a", "dir\\a.txt", "a"), 100, 10).toString ()
                                                                              .contains ("Test ZIP contains the entry '/dir/a.txt' more than once"));

    assertTrue (_readError (_zip ("a.txt", "a", "b.txt", "b"), 100, 1).toString ()
                                                                    .contains ("Test ZIP contains more than 1 entries"));

    assertTrue (_readError (_zip ("a.txt", "aaa"), 2, 10).toString ()
                                                       .contains ("Test ZIP exceeds maximum unzipped size of"));
  }
}
