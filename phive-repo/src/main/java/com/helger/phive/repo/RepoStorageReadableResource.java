package com.helger.phive.repo;

import java.io.File;
import java.io.InputStream;
import java.net.URL;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.UnsupportedOperation;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.string.ToStringGenerator;

/**
 * Implementation of {@link IReadableResource} for {@link RepoStorageKey} and
 * {@link RepoStorageItem}.,
 *
 * @author Philip Helger
 */
public class RepoStorageReadableResource implements IReadableResource
{
  private final RepoStorageKey m_aKey;
  private final RepoStorageItem m_aItem;

  public RepoStorageReadableResource (@Nonnull final RepoStorageKey aKey, @Nonnull final RepoStorageItem aItem)
  {
    ValueEnforcer.notNull (aKey, "Key");
    ValueEnforcer.notNull (aItem, "Item");
    m_aKey = aKey;
    m_aItem = aItem;
  }

  @Nonnull
  public final RepoStorageKey getRepoStorageKey ()
  {
    return m_aKey;
  }

  @Nonnull
  public final RepoStorageItem getRepoStorageItem ()
  {
    return m_aItem;
  }

  @Nonnull
  public InputStream getInputStream ()
  {
    return m_aItem.data ().getBufferedInputStream ();
  }

  public boolean isReadMultiple ()
  {
    return true;
  }

  @Nonnull
  @Nonempty
  public String getResourceID ()
  {
    return getPath ();
  }

  @Nonnull
  @Nonempty
  public String getPath ()
  {
    return m_aKey.getPath ();
  }

  public boolean exists ()
  {
    return true;
  }

  @Nullable
  public URL getAsURL ()
  {
    // Not applicable atm
    return null;
  }

  @Nullable
  public File getAsFile ()
  {
    // Not applicable atm
    return null;
  }

  @UnsupportedOperation
  public IReadableResource getReadableCloneForPath (final String sPath)
  {
    throw new UnsupportedOperationException ("Clone not supported");
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (null).append ("Key", m_aKey).append ("Item", m_aItem).getToString ();
  }
}
