/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.state.ESuccess;
import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.response.ResponseHandlerByteArray;
import com.helger.phive.engine.repo.RepoStorageKey;

import org.apache.hc.client5.http.classic.methods.HttpPut;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.http.io.entity.ByteArrayEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;
import javax.annotation.WillNotClose;

/**
 * Repo Storage for HTTP using "PUT" as an example implementation for writing
 * objects.
 *
 * @author Philip Helger
 */
public class RepoStorageHttpWithPut extends RepoStorageHttp
{
  private static final Logger LOGGER = LoggerFactory.getLogger (RepoStorageHttpWithPut.class);

  public RepoStorageHttpWithPut (@Nonnull @WillNotClose final HttpClientManager aHttpClient,
                                 @Nonnull @Nonempty final String sURLPrefix)
  {
    super (aHttpClient, sURLPrefix);
  }

  @Override
  public boolean canWrite ()
  {
    return true;
  }

  @Override
  @Nonnull
  protected ESuccess putObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    final String sURL = FilenameHelper.getCleanConcatenatedUrlPath (m_sURLPrefix, aKey.getPath ());
    if (LOGGER.isInfoEnabled ())
      LOGGER.info ("Writing to HTTP '" + sURL + "'");

    try
    {
      final HttpPut aPost = new HttpPut (sURL);
      aPost.setEntity (new ByteArrayEntity (aPayload, ContentType.APPLICATION_OCTET_STREAM));
      final byte [] aResponse = m_aHttpClient.execute (aPost, new ResponseHandlerByteArray());
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
