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

import java.io.InputStream;
import java.util.Locale;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.annotation.Nonempty;
import com.helger.annotation.Nonnegative;
import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.io.nonblocking.NonBlockingByteArrayInputStream;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.state.EContinue;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsLinkedHashMap;
import com.helger.collection.commons.CommonsLinkedHashSet;
import com.helger.collection.commons.ICommonsMap;
import com.helger.collection.commons.ICommonsOrderedSet;
import com.helger.diagnostics.error.SingleError;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.file.FilenameHelper;
import com.helger.io.misc.SizeHelper;
import com.helger.io.resource.inmemory.ReadableResourceByteArray;
import com.helger.io.zip.IZipWalkerCallback;
import com.helger.io.zip.ZipWalkResult;
import com.helger.io.zip.ZipWalker;
import com.helger.io.zip.ZipWalkerSettings;

/**
 * The complete content of a ZIP file, read into memory. All entry paths are unified with
 * {@link #getUnifiedPath(String)}, so they use "/" as separator and start with a "/". Nested ZIP
 * files are not supported. Use {@link #readZip(InputStream, long, int, String, ErrorList)} to read
 * a ZIP file.
 *
 * @author Philip Helger
 * @since 12.4.0
 */
@Immutable
public final class InMemoryZipContent
{
  /** Default maximum unzipped size: 50 MB */
  public static final long DEFAULT_MAX_UNZIPPED_SIZE = 50L * 1024 * 1024;
  /** Default maximum number of entries of a ZIP file: 10.000 */
  public static final int DEFAULT_MAX_ZIP_ENTRY_COUNT = 10_000;

  private final ICommonsMap <String, byte []> m_aEntries;
  private final long m_nTotalUncompressedBytes;

  private InMemoryZipContent (@NonNull final ICommonsMap <String, byte []> aEntries,
                              @Nonnegative final long nTotalUncompressedBytes)
  {
    m_aEntries = aEntries;
    m_nTotalUncompressedBytes = nTotalUncompressedBytes;
  }

  /**
   * Unify the passed path to the format of the entry paths: all "\" are converted to "/" and a
   * leading "/" is added if missing.
   *
   * @param sPath
   *        The path to unify. May be <code>null</code>.
   * @return <code>null</code> if the passed path is <code>null</code>.
   */
  @Nullable
  public static String getUnifiedPath (@Nullable final String sPath)
  {
    // Convert any "\" to "/"
    String ret = FilenameHelper.getPathUsingUnixSeparator (sPath);
    if (ret != null)
    {
      // Make absolute to simply resource resolving
      if (!ret.startsWith ("/"))
        ret = '/' + ret;
    }
    return ret;
  }

  /**
   * @return The number of entries. Always &ge; 0.
   */
  @Nonnegative
  public int getEntryCount ()
  {
    return m_aEntries.size ();
  }

  /**
   * @return The unified paths of all entries in the order of the ZIP file. Never <code>null</code>.
   */
  @NonNull
  @ReturnsMutableCopy
  public ICommonsOrderedSet <String> getAllEntryPaths ()
  {
    return new CommonsLinkedHashSet <> (m_aEntries.keySet ());
  }

  /**
   * @param sPath
   *        The path to check. It is unified before the lookup. May be <code>null</code>.
   * @return <code>true</code> if an entry with this path is contained.
   */
  public boolean containsEntry (@Nullable final String sPath)
  {
    return m_aEntries.containsKey (getUnifiedPath (sPath));
  }

  /**
   * @param sPath
   *        The path of the entry. It is unified before the lookup. May be <code>null</code>.
   * @return The content of the entry as an input stream or <code>null</code> if no such entry is
   *         contained.
   */
  @Nullable
  public InputStream getEntryInputStream (@Nullable final String sPath)
  {
    final byte [] aBytes = m_aEntries.get (getUnifiedPath (sPath));
    return aBytes == null ? null : new NonBlockingByteArrayInputStream (aBytes);
  }

  /**
   * @param sPath
   *        The path of the entry. It is unified before the lookup. May be <code>null</code>.
   * @return The entry as a readable resource, that has the unified path as resource ID and path, or
   *         <code>null</code> if no such entry is contained.
   */
  @Nullable
  public ReadableResourceByteArray getEntryAsResource (@Nullable final String sPath)
  {
    final String sUnifiedPath = getUnifiedPath (sPath);
    final byte [] aBytes = m_aEntries.get (sUnifiedPath);
    if (aBytes == null)
      return null;
    final ReadableResourceByteArray ret = new ReadableResourceByteArray (sUnifiedPath, aBytes, false);
    ret.setPath (sUnifiedPath);
    return ret;
  }

  /**
   * @return The sum of the uncompressed sizes of all entries in bytes. Always &ge; 0.
   */
  @Nonnegative
  public long getTotalUncompressedBytes ()
  {
    return m_nTotalUncompressedBytes;
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("EntryCount", m_aEntries.size ())
                                       .append ("TotalUncompressedBytes", m_nTotalUncompressedBytes)
                                       .getToString ();
  }

  /**
   * Read the complete ZIP file into memory. Nested ZIP files are not supported. The same path must
   * not occur more than once after unification.
   *
   * @param aIS
   *        The input stream to read the ZIP file from. May not be <code>null</code>. It is not
   *        closed by this method.
   * @param nMaxUnzippedSize
   *        The maximum allowed unzipped size of all entries in bytes. This is a safeguard against
   *        ZIP bomb attacks. Must be &gt; 0.
   * @param nMaxEntryCount
   *        The maximum allowed number of entries. This is a safeguard against ZIP files with a huge
   *        number of (small) entries, because all entries are kept in memory. Must be &gt; 0.
   * @param sDisplayName
   *        The name of the ZIP file used at the start of all error messages, e.g.
   *        <code>XSD resource type 'zip'</code>. May neither be <code>null</code> nor empty.
   * @param aErrorList
   *        The error list to add the errors to. May not be <code>null</code>.
   * @return <code>null</code> if reading failed. In this case an error was added to the error list.
   */
  @Nullable
  public static InMemoryZipContent readZip (@NonNull final InputStream aIS,
                                            @Nonnegative final long nMaxUnzippedSize,
                                            @Nonnegative final int nMaxEntryCount,
                                            @NonNull @Nonempty final String sDisplayName,
                                            @NonNull final ErrorList aErrorList)
  {
    ValueEnforcer.notNull (aIS, "InputStream");
    ValueEnforcer.isGT0 (nMaxUnzippedSize, "MaxUnzippedSize");
    ValueEnforcer.isGT0 (nMaxEntryCount, "MaxEntryCount");
    ValueEnforcer.notEmpty (sDisplayName, "DisplayName");
    ValueEnforcer.notNull (aErrorList, "ErrorList");

    final ICommonsMap <String, byte []> aEntries = new CommonsLinkedHashMap <> ();
    // No nested ZIPs
    final ZipWalkerSettings aZipSettings = new ZipWalkerSettings ().setMaxNestingDepth (0)
                                                                   .setMaxEntryCount (nMaxEntryCount)
                                                                   .setMaxTotalUncompressedBytes (nMaxUnzippedSize);
    final IZipWalkerCallback aZipCallback = (sPath, aEntry, nDepth, aEntryIS) -> {
      final String sEntryNameUnified = getUnifiedPath (sPath);
      if (aEntries.containsKey (sEntryNameUnified))
      {
        // Would silently replace the previous entry
        aErrorList.add (SingleError.builderError ()
                                   .errorText (sDisplayName +
                                               " contains the entry '" +
                                               sEntryNameUnified +
                                               "' more than once")
                                   .build ());
        return EContinue.BREAK;
      }

      // Remember ZIP entry in map
      final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ();
      aEntryIS.transferTo (aBAOS);
      aEntries.put (sEntryNameUnified, aBAOS.toByteArray ());
      return EContinue.CONTINUE;
    };
    final ZipWalkResult aZipResult = ZipWalker.walk (aIS, aZipSettings, aZipCallback);
    switch (aZipResult.getResult ())
    {
      case SUCCESS:
        return new InMemoryZipContent (aEntries, aZipResult.getTotalUncompressedBytes ());
      case STOPPED_BY_CALLBACK:
        // Error was already added
        return null;
      case NOT_A_ZIP:
        aErrorList.add (SingleError.builderError ().errorText (sDisplayName + " is not a ZIP archive").build ());
        return null;
      case MAX_ENTRY_COUNT_EXCEEDED:
        aErrorList.add (SingleError.builderError ()
                                   .errorText (sDisplayName + " contains more than " + nMaxEntryCount + " entries")
                                   .build ());
        return null;
      case MAX_TOTAL_UNCOMPRESSED_BYTES_EXCEEDED:
        aErrorList.add (SingleError.builderError ()
                                   .errorText (sDisplayName +
                                               " exceeds maximum unzipped size of " +
                                               SizeHelper.getSizeHelperOfLocale (Locale.ROOT)
                                                         .getAsMatching (nMaxUnzippedSize))
                                   .build ());
        return null;
      default:
        // BROKEN, or a nested ZIP
        aErrorList.add (SingleError.builderError ()
                                   .errorText (sDisplayName + " seems to be a broken ZIP")
                                   .linkedException (aZipResult.getException ())
                                   .build ());
        return null;
    }
  }
}
