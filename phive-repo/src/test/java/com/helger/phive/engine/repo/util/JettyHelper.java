package com.helger.phive.engine.repo.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.annotation.Nonnull;

import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.AbstractHandler;
import org.eclipse.jetty.server.handler.DefaultHandler;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.handler.ResourceHandler;
import org.eclipse.jetty.util.resource.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.commons.http.EHttpMethod;
import com.helger.commons.io.file.FileHelper;
import com.helger.commons.state.EEnabled;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JettyHelper
{
  public static final File DEFAULT_TEST_BASE_DIR = new File ("src/test/resources/test-http");
  private static final Logger LOGGER = LoggerFactory.getLogger (JettyHelper.class);

  private final Server m_aServer;

  public JettyHelper (@Nonnull final File resourceBase, final boolean bPUTEnabled)
  {
    LOGGER.info ("Starting Jetty with resource base dir '" + resourceBase.getAbsolutePath () + "'");
    m_aServer = new Server (80);

    final AbstractHandler putHandler = new AbstractHandler ()
    {
      @Override
      public void handle (final String target,
                          final Request baseRequest,
                          final HttpServletRequest request,
                          final HttpServletResponse response) throws IOException
      {
        if (request.getMethod ().equals (EHttpMethod.PUT.getName ()))
        {
          final File targetFile = new File (resourceBase, target);
          LOGGER.info ("Jetty PUTtin '" + targetFile.getAbsolutePath () + "'");

          FileHelper.ensureParentDirectoryIsPresent (targetFile);
          try (FileOutputStream outputStream = new FileOutputStream (targetFile, false))
          {
            int nBytesWritten = 0;
            int nBytesRead;
            final byte [] aBuffer = new byte [8192];
            while ((nBytesRead = baseRequest.getInputStream ().read (aBuffer)) != -1)
            {
              outputStream.write (aBuffer, 0, nBytesRead);
              nBytesWritten += nBytesRead;
            }
            LOGGER.info ("Jetty successfully PUT " +
                         nBytesWritten +
                         " bytes to file '" +
                         targetFile.getAbsolutePath () +
                         "'");
          }

          response.setStatus (HttpServletResponse.SC_OK);
          baseRequest.setHandled (true);
        }
      }
    };

    final ResourceHandler resourceHandler = new ResourceHandler ();
    resourceHandler.setBaseResource (Resource.newResource (resourceBase));

    final HandlerList handlers = new HandlerList ();
    if (bPUTEnabled)
      handlers.setHandlers (new Handler [] { putHandler, resourceHandler, new DefaultHandler () });
    else
      handlers.setHandlers (new Handler [] { resourceHandler, new DefaultHandler () });

    m_aServer.setHandler (handlers);
  }

  public void startJetty () throws Exception
  {
    m_aServer.start ();
  }

  public void stopJetty () throws Exception
  {
    m_aServer.stop ();
  }

  @Nonnull
  public static JettyHelper createDefaultTestInstance (@Nonnull final EEnabled ePutEnabled)
  {
    return new JettyHelper (DEFAULT_TEST_BASE_DIR, ePutEnabled.isEnabled ());
  }
}
