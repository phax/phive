/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillNotClose;

import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.classic.methods.HttpPut;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.http.io.entity.ByteArrayEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.stream.NonBlockingByteArrayInputStream;
import com.helger.commons.state.ESuccess;
import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.response.ResponseHandlerByteArray;
import com.helger.phive.engine.repo.IRepoStorage;
import com.helger.phive.engine.repo.RepoStorageKey;
import com.helger.phive.engine.repo.RepoStorageType;

/**
 * Base implementation of {@link IRepoStorage} for arbitrary HTTP connections.
 * Read-only.
 *
 * @author Philip Helger
 */
public class RepoStorageHttp extends AbstractRepoStorage <RepoStorageHttp>
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageHttp.class);

  protected final HttpClientManager m_aHttpClient;
  protected final String m_sURLPrefix;
  private final boolean m_bWritable;

  public RepoStorageHttp (@Nonnull @WillNotClose final HttpClientManager aHttpClient,
                          @Nonnull @Nonempty final String sURLPrefix,
                          final boolean bWritable)
  {
    super (RepoStorageType.HTTP);
    ValueEnforcer.notNull (aHttpClient, "HttpClient");
    ValueEnforcer.notEmpty (sURLPrefix, "URLPrefix");
    m_aHttpClient = aHttpClient;
    m_sURLPrefix = sURLPrefix;
    m_bWritable = bWritable;
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
      final byte [] aResponse = m_aHttpClient.execute (aGet, new ResponseHandlerByteArray ());
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

  @Override
  public boolean canWrite ()
  {
    return m_bWritable;
  }

  @Override
  @Nonnull
  protected ESuccess putObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    if (!m_bWritable)
    {
      LOGGER.error ("Trying putObject on a read-only RepoStorage HTTP");
      throw new UnsupportedOperationException ("putObject is not enabled");
    }

    final String sURL = FilenameHelper.getCleanConcatenatedUrlPath (m_sURLPrefix, aKey.getPath ());
    if (LOGGER.isInfoEnabled ())
      LOGGER.info ("Writing to HTTP '" + sURL + "'");

    try
    {
      final HttpPut aPost = new HttpPut (sURL);
      aPost.setEntity (new ByteArrayEntity (aPayload, ContentType.APPLICATION_OCTET_STREAM));
      final byte [] aResponse = m_aHttpClient.execute (aPost, new ResponseHandlerByteArray ());
      // Ignore the response
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("HTTP Post result: " +
                      (aResponse == null ? null : new String (aResponse, StandardCharsets.UTF_8)));
    }
    catch (final IOException ex)
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to write to HTTP '" + sURL + "': " + ex.getMessage ());
      return ESuccess.FAILURE;
    }

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Successfully wrote to HTTP '" + sURL + "'");
    return ESuccess.SUCCESS;
  }
}
