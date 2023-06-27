/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.stream.NonBlockingByteArrayInputStream;
import com.helger.commons.state.ESuccess;
import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.response.ResponseHandlerByteArray;
import com.helger.phive.engine.repo.ERepoStorageType;
import com.helger.phive.engine.repo.IRepoStorage;
import com.helger.phive.engine.repo.RepoStorageKey;

import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillNotClose;

/**
 * Base implementation of {@link IRepoStorage} for arbitrary HTTP connections.
 * Read-only.
 *
 * @author Philip Helger
 */
public class RepoStorageHttp extends AbstractRepoStorage
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageHttp.class);

  protected final HttpClientManager m_aHttpClient;
  protected final String m_sURLPrefix;

  public RepoStorageHttp (@Nonnull @WillNotClose final HttpClientManager aHttpClient,
                          @Nonnull @Nonempty final String sURLPrefix)
  {
    super (ERepoStorageType.HTTP);
    ValueEnforcer.notNull (aHttpClient, "HttpClient");
    ValueEnforcer.notEmpty (sURLPrefix, "URLPrefix");
    m_aHttpClient = aHttpClient;
    m_sURLPrefix = sURLPrefix;
  }

  @Override
  @Nullable
  protected InputStream getInputStream (@Nonnull final RepoStorageKey aKey)
  {
    final String sURL = FilenameHelper.getCleanConcatenatedUrlPath (m_sURLPrefix, aKey.getPath ());
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Reading from HTTP '" + sURL + "'");

    final HttpGet aGet = new HttpGet (sURL);
    try
    {
      final byte [] aResponse = m_aHttpClient.execute (aGet, new ResponseHandlerByteArray());
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Found on HTTP '" + sURL + "'");
      return new NonBlockingByteArrayInputStream (aResponse);
    }
    catch (final IOException ex)
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to read from HTTP '" + sURL + "': " + ex.getMessage ());
      return null;
    }
  }

  public boolean canWrite ()
  {
    return false;
  }

  @Override
  @Nonnull
  protected ESuccess putObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    throw new UnsupportedOperationException ("putObject is not supported by default");
  }
}
