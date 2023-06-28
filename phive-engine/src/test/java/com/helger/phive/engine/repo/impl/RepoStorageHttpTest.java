/*
 * Copyright (C) 2019-2023 Philip Helger & ecosio
 *
 * All rights reserved.
 */
package com.helger.phive.engine.repo.impl;

import com.helger.httpclient.HttpClientManager;
import com.helger.httpclient.HttpClientSettings;
import com.helger.phive.engine.repo.EHashState;
import com.helger.phive.engine.repo.RepoStorageItem;
import com.helger.phive.engine.repo.RepoStorageKey;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.AbstractHandler;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import javax.annotation.Nonnull;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertSame;

public final class RepoStorageHttpTest {
  private Server server;

  @Before
  public void startJetty() throws Exception
  {
    server = new Server(80);

    AbstractHandler handler = new AbstractHandler() {
      @Override
      public void handle(String target, Request baseRequest,
                         HttpServletRequest request, HttpServletResponse response)
          throws IOException
      {
        if(target.equals("/com/ecosio/test/http.txt"))
        {
          response.setContentType("text/html;charset=utf-8");
          response.setStatus(HttpServletResponse.SC_OK);
          baseRequest.setHandled(true);
          response.getWriter().print("bla");
        }
        else
        {
          response.setStatus(HttpServletResponse.SC_NOT_FOUND);
          baseRequest.setHandled(true);
          response.getWriter().print("");
        }
      }

    };
    server.setHandler(handler);
    server.start();
  }

  @After
  public void stopJetty()
  {
    try
    {
      server.stop();
    }
    catch (Exception e)
    {
      e.printStackTrace();
    }
  }

  @Nonnull
  private static RepoStorageHttp _createRepo ()
  {
    HttpClientManager aHttpClientManager = HttpClientManager.create(new HttpClientSettings());
    return new RepoStorageHttp(aHttpClientManager, "http://");
  }

  @Test
  public void testRead()
  {
    final RepoStorageHttp aRepo = _createRepo ();

    RepoStorageItem aItem = aRepo.read (RepoStorageKey.of ("localhost/com/ecosio/test/http.txt"));
    assertNotNull (aItem);
    assertEquals ("bla", aItem.getDataAsString (StandardCharsets.UTF_8));
    assertSame (EHashState.NOT_VERIFIED, aItem.getHashState ());
  }
}
