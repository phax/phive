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

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.util.Comparator;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Function;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.annotation.concurrent.GuardedBy;
import com.helger.annotation.concurrent.Immutable;
import com.helger.annotation.concurrent.ThreadSafe;
import com.helger.annotation.style.MustImplementEqualsAndHashcode;
import com.helger.base.array.bytes.ByteArrayWrapper;
import com.helger.base.concurrent.SimpleReadWriteLock;
import com.helger.base.enforce.ValueEnforcer;
import com.helger.base.equals.EqualsHelper;
import com.helger.base.hashcode.HashCodeGenerator;
import com.helger.base.io.nonblocking.NonBlockingByteArrayOutputStream;
import com.helger.base.state.EChange;
import com.helger.base.state.ESuccess;
import com.helger.base.string.StringParser;
import com.helger.base.tostring.ToStringGenerator;
import com.helger.collection.commons.CommonsConcurrentHashMap;
import com.helger.csv.CSVReader;
import com.helger.csv.CSVWriter;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.IRepoStorageReadItem;
import com.helger.diver.repo.RepoStorageContentByteArray;
import com.helger.diver.repo.RepoStorageKey;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.phive.api.executorset.status.IValidationExecutorSetStatus;

/**
 * An implementation of {@link IRepoVESTopTocService} based on a backing CSV file located in the
 * repo.
 *
 * @author Philip Helger
 */
public class RepoVESTopTocServiceCSV implements IRepoVESTopTocService
{
  /**
   * Represents a single VES top ToC item (aka CSV row)
   *
   * @author Philip Helger
   */
  @Immutable
  @MustImplementEqualsAndHashcode
  private static final class Item
  {
    private final DVRCoordinate m_aCoord;
    private final boolean m_bDeprecated;
    private final String m_sDisplayName;

    public Item (@NonNull final DVRCoordinate aCoord, final boolean bDeprecated, @Nullable final String sDisplayName)
    {
      m_aCoord = aCoord;
      m_bDeprecated = bDeprecated;
      m_sDisplayName = sDisplayName;
    }

    @Override
    public boolean equals (final Object o)
    {
      if (o == this)
        return true;
      if (o == null || !getClass ().equals (o.getClass ()))
        return false;
      final Item rhs = (Item) o;
      return m_aCoord.equals (rhs.m_aCoord) &&
             m_bDeprecated == rhs.m_bDeprecated &&
             EqualsHelper.equals (m_sDisplayName, rhs.m_sDisplayName);
    }

    @Override
    public int hashCode ()
    {
      return new HashCodeGenerator (this).append (m_aCoord)
                                         .append (m_bDeprecated)
                                         .append (m_sDisplayName)
                                         .getHashCode ();
    }
  }

  /**
   * Represents the complete ToC as present in the CSV
   *
   * @author Philip Helger
   */
  @ThreadSafe
  private static final class Toc
  {
    private final CommonsConcurrentHashMap <String, Item> m_aItems = new CommonsConcurrentHashMap <> ();

    @NonNull
    private EChange _update (@NonNull final Item aNewItem)
    {
      ValueEnforcer.notNull (aNewItem, "Item");

      final String sKey = aNewItem.m_aCoord.getAsSingleID ();

      final Item aOldItem = m_aItems.get (sKey);
      if (aOldItem != null && aOldItem.equals (aNewItem))
        return EChange.UNCHANGED;

      m_aItems.put (sKey, aNewItem);
      return EChange.CHANGED;
    }

    @NonNull
    public EChange update (@NonNull final DVRCoordinate aCoord,
                           final boolean bDeprecated,
                           @Nullable final String sDisplayName)
    {
      ValueEnforcer.notNull (aCoord, "Coord");
      ValueEnforcer.isFalse (aCoord.hasClassifier (), "Coordinates are not allowed to have a Classifier");

      return _update (new Item (aCoord, bDeprecated, sDisplayName));
    }

    @NonNull
    public EChange updateStatus (@NonNull final DVRCoordinate aCoord,
                                 @NonNull final IValidationExecutorSetStatus aStatus)
    {
      return update (aCoord, aStatus.isDeprecated (), aStatus.getDisplayName ());
    }

    @NonNull
    public EChange remove (@NonNull final DVRCoordinate aCoord)
    {
      ValueEnforcer.notNull (aCoord, "Coord");
      ValueEnforcer.isFalse (aCoord.hasClassifier (), "Coordinates are not allowed to have a Classifier");

      final String sKey = aCoord.getAsSingleID ();
      return m_aItems.removeObject (sKey);
    }
  }

  /** The default filename for the VES top-level table of contents. */
  public static final String FILENAME_VES_TOP_TOC_CSV = "toptoc-ves.csv";

  /** By default entries are not deprecated */
  public static final boolean DEFAULT_DEPRECATED = false;

  private static final Logger LOGGER = LoggerFactory.getLogger (RepoVESTopTocServiceCSV.class);

  private static final RepoStorageKey RSK_TOP_TOC = new RepoStorageKey (FILENAME_VES_TOP_TOC_CSV);

  private final SimpleReadWriteLock m_aRWLock = new SimpleReadWriteLock ();
  private final AtomicBoolean m_aInitialized = new AtomicBoolean (false);
  private IRepoStorageWithToc m_aRepo;
  @GuardedBy ("m_aRWLock")
  private Toc m_aToc;

  @NonNull
  private Toc _readTopToc (final boolean bVerbose)
  {
    final Toc ret = new Toc ();

    // Read existing VES Top ToC from repository
    final IRepoStorageReadItem aItem = m_aRepo.read (RSK_TOP_TOC);
    if (aItem != null)
    {
      try (final CSVReader aCSVReader = new CSVReader (aItem.getContent ()
                                                            .getBufferedReader (StandardCharsets.ISO_8859_1)))
      {
        aCSVReader.<Exception> forEachThrowing (aLine -> {
          if (aLine.size () == 5)
          {
            ret.update (DVRCoordinate.create (aLine.get (0), aLine.get (1), aLine.get (2)),
                        StringParser.parseBool (aLine.get (3), DEFAULT_DEPRECATED),
                        aLine.get (4));
          }
          throw new IllegalStateException ("The CSV line has an invalid amount of columns");
        });
      }
      catch (final IOException ex)
      {
        throw new UncheckedIOException ("Failed to open CSV file for reading", ex);
      }
      catch (final Exception ex)
      {
        throw new IllegalStateException ("Failed to read CSV file", ex);
      }
    }
    else
    {
      if (bVerbose)
        LOGGER.info ("Repository does not have a VES Top-ToC yet");
    }
    return ret;
  }

  @NonNull
  private ESuccess _writeTopToc (@NonNull final Toc aToc)
  {
    ValueEnforcer.notNull (aToc, "Toc");

    try (final NonBlockingByteArrayOutputStream aBAOS = new NonBlockingByteArrayOutputStream ())
    {
      try (final CSVWriter aCSV = new CSVWriter (new OutputStreamWriter (aBAOS, StandardCharsets.ISO_8859_1)))
      {
        // Sort by key for deterministic result
        for (final Item aItem : aToc.m_aItems.getSortedByKey (Comparator.naturalOrder ()).values ())
        {
          aCSV.writeNext (aItem.m_aCoord.getGroupID (),
                          aItem.m_aCoord.getArtifactID (),
                          aItem.m_aCoord.getVersionString (),
                          Boolean.toString (aItem.m_bDeprecated),
                          aItem.m_sDisplayName);
        }
      }
      catch (final IOException ex)
      {
        throw new IllegalStateException ("Failed to create CSW writer", ex);
      }

      // Write the CSV to the repo
      return m_aRepo.write (RSK_TOP_TOC, new RepoStorageContentByteArray (ByteArrayWrapper.create (aBAOS, false)));
    }
  }

  public void initForRepo (@NonNull final IRepoStorageWithToc aRepo)
  {
    ValueEnforcer.notNull (aRepo, "Repo");

    if (m_aInitialized.getAndSet (true))
      throw new IllegalStateException ("This service is already initialized - can't do it again, sorry.");
    m_aRepo = aRepo;

    // Initial read
    final Toc aTmpToc = _readTopToc (true);
    m_aRWLock.writeLocked ( () -> m_aToc = aTmpToc);
  }

  private void _checkInited ()
  {
    if (!m_aInitialized.get ())
      throw new IllegalStateException ("This service was not properly initialized");
  }

  public void refreshFromRepo ()
  {
    _checkInited ();

    // Re-read and atomic assign
    final Toc aTmpToc = _readTopToc (true);
    m_aRWLock.writeLocked ( () -> m_aToc = aTmpToc);
  }

  public void iterateAllItems (@NonNull final IIterationCallback aCallback)
  {
    ValueEnforcer.notNull (aCallback, "Callback");

    m_aRWLock.readLocked ( () -> {
      for (final Item aItem : m_aToc.m_aItems.values ())
        aCallback.onItem (aItem.m_aCoord, aItem.m_bDeprecated, aItem.m_sDisplayName);
    });
  }

  public void iterateAllItemsBreakable (@NonNull final IIterationCallbackBreakable aCallback)
  {
    ValueEnforcer.notNull (aCallback, "Callback");

    m_aRWLock.readLocked ( () -> {
      for (final Item aItem : m_aToc.m_aItems.values ())
        if (aCallback.onItem (aItem.m_aCoord, aItem.m_bDeprecated, aItem.m_sDisplayName).isBreak ())
          break;
    });
  }

  @NonNull
  private ESuccess _writeActionOnToc (final Function <? super Toc, EChange> aAction)
  {
    return m_aRWLock.writeLockedGet ( () -> {
      if (aAction.apply (m_aToc).isChanged ())
      {
        try
        {
          // Read the data again, to make sure to have the latest version
          m_aToc = _readTopToc (false);
        }
        catch (final RuntimeException ex)
        {
          LOGGER.error ("Failed to read VES Top-ToC", ex);
          return ESuccess.FAILURE;
        }

        // Register again, because data structure changed
        // Maybe it was modified in the meantime already?
        if (aAction.apply (m_aToc).isChanged ())
        {
          // Write updated version on server
          // Pass instance to avoid it changes while writing
          if (_writeTopToc (m_aToc).isFailure ())
            return ESuccess.FAILURE;
        }
      }
      return ESuccess.SUCCESS;
    });
  }

  public @NonNull ESuccess createVES (@NonNull final DVRCoordinate aCoord)
  {
    ValueEnforcer.notNull (aCoord, "Coord");
    _checkInited ();

    return _writeActionOnToc (toc -> toc.update (aCoord, DEFAULT_DEPRECATED, null));
  }

  public @NonNull ESuccess deleteVES (@NonNull final DVRCoordinate aCoord)
  {
    ValueEnforcer.notNull (aCoord, "Coord");
    _checkInited ();

    return _writeActionOnToc (toc -> toc.remove (aCoord));
  }

  public @NonNull ESuccess changeVESStatus (@NonNull final DVRCoordinate aCoord,
                                            @NonNull final IValidationExecutorSetStatus aStatus)
  {
    ValueEnforcer.notNull (aCoord, "Coord");
    ValueEnforcer.notNull (aStatus, "Status");
    _checkInited ();

    return _writeActionOnToc (toc -> toc.updateStatus (aCoord, aStatus));
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).getToString ();
  }
}
