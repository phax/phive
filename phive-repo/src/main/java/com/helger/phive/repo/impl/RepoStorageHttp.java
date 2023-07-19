/*
 * Copyright (C) 2023 Philip Helger & ecosio
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
package com.helger.phive.repo.impl;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillNotClose;

import org.apache.hc.client5.http.classic.methods.HttpDelete;
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
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.IRepoStorage;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.RepoStorageType;

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

  public RepoStorageHttp (@Nonnull @WillNotClose final HttpClientManager aHttpClient,
                          @Nonnull @Nonempty final String sURLPrefix,
                          @Nonnull @Nonempty final String sID,
                          @Nonnull final ERepoWritable eWriteEnabled,
                          @Nonnull final ERepoDeletable eDeleteEnabled)
  {
    super (RepoStorageType.HTTP, sID, eWriteEnabled, eDeleteEnabled);
    ValueEnforcer.notNull (aHttpClient, "HttpClient");
    ValueEnforcer.notEmpty (sURLPrefix, "URLPrefix");
    m_aHttpClient = aHttpClient;
    m_sURLPrefix = sURLPrefix;
  }

  public boolean exists (@Nonnull final RepoStorageKey aKey)
  {
    ValueEnforcer.notNull (aKey, "Key");

    // Not ideal, but what shall we do :)
    return read (aKey) != null;
  }

  @Override
  @Nullable
  protected InputStream getInputStream (@Nonnull final RepoStorageKey aKey)
  {
    final String sURL = FilenameHelper.getCleanConcatenatedUrlPath (m_sURLPrefix, aKey.getPath ());
    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Reading from HTTP '" + sURL + "'");

    try
    {
      final HttpGet aGet = new HttpGet (sURL);
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
  @Nonnull
  protected ESuccess writeObject (@Nonnull final RepoStorageKey aKey, @Nonnull final byte [] aPayload)
  {
    final String sURL = FilenameHelper.getCleanConcatenatedUrlPath (m_sURLPrefix, aKey.getPath ());
    if (LOGGER.isInfoEnabled ())
      LOGGER.info ("Writing to HTTP '" + sURL + "'");

    try
    {
      final HttpPut aPut = new HttpPut (sURL);
      aPut.setEntity (new ByteArrayEntity (aPayload, ContentType.APPLICATION_OCTET_STREAM));

      final byte [] aResponse = m_aHttpClient.execute (aPut, new ResponseHandlerByteArray ());
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("HTTP PUT result: " +
                      (aResponse == null ? null : new String (aResponse, StandardCharsets.UTF_8)));
      // Ignore the response
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

  @Override
  @Nonnull
  protected ESuccess deleteObject (@Nonnull final RepoStorageKey aKey)
  {
    final String sURL = FilenameHelper.getCleanConcatenatedUrlPath (m_sURLPrefix, aKey.getPath ());
    if (LOGGER.isInfoEnabled ())
      LOGGER.info ("Deleting from HTTP '" + sURL + "'");

    try
    {
      final HttpDelete aDelete = new HttpDelete (sURL);
      final byte [] aResponse = m_aHttpClient.execute (aDelete, new ResponseHandlerByteArray ());
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("HTTP DELETE result: " +
                      (aResponse == null ? null : new String (aResponse, StandardCharsets.UTF_8)));
      // Ignore the response
    }
    catch (final IOException ex)
    {
      if (LOGGER.isDebugEnabled ())
        LOGGER.debug ("Failed to delete from HTTP '" + sURL + "': " + ex.getMessage ());
      return ESuccess.FAILURE;
    }

    if (LOGGER.isDebugEnabled ())
      LOGGER.debug ("Successfully deleted from HTTP '" + sURL + "'");
    return ESuccess.SUCCESS;
  }
}
