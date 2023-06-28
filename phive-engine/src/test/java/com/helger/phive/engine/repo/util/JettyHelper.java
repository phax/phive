package com.helger.phive.engine.repo.util;

import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.AbstractHandler;
import org.eclipse.jetty.server.handler.DefaultHandler;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.handler.ResourceHandler;

import java.io.FileOutputStream;
import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class JettyHelper
{

  private final Server server = init ();

  private Server init ()
  {
    Server svr = new Server(80);

    AbstractHandler post_handler = new AbstractHandler() {
      @Override
      public void handle(String target, Request baseRequest,
                         HttpServletRequest request, HttpServletResponse response)
          throws IOException {
        if (request.getMethod().equals("PUT"))
        {
          String fileName = "test-repo" + target;
          try (FileOutputStream outputStream = new FileOutputStream(fileName, false)) {
            int read;
            byte[] bytes = new byte[8192];
            while ((read = baseRequest.getInputStream().read(bytes)) != -1) {
              outputStream.write(bytes, 0, read);
            }
          }

          response.setStatus(HttpServletResponse.SC_OK);
          baseRequest.setHandled(true);
        }
      }
    };

    ResourceHandler resource_handler = new ResourceHandler();
    resource_handler.setResourceBase("test-repo");

    HandlerList handlers = new HandlerList();
    handlers.setHandlers(new Handler[]{post_handler, resource_handler, new DefaultHandler()});

    svr.setHandler(handlers);

    return svr;
  }

  public void startJetty () throws Exception
  {
    server.start();
  }

  public void stopJetty () throws Exception
  {
    server.stop();
  }

}
