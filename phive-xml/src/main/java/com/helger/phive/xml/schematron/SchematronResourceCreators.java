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
package com.helger.phive.xml.schematron;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;

import com.helger.diagnostics.error.list.ErrorList;
import com.helger.io.resource.IReadableResource;
import com.helger.schematron.AbstractSchematronResource;
import com.helger.schematron.errorhandler.WrappedCollectingPSErrorHandler;
import com.helger.schematron.pure.SchematronResourcePureXPath;
import com.helger.schematron.sch.SchematronResourceSCH;
import com.helger.schematron.schxslt.xslt2.SchematronResourceSchXslt_XSLT2;
import com.helger.schematron.schxslt2.xslt.SchematronResourceSchXslt2;
import com.helger.schematron.xslt.SchematronResourceXSLT;
import com.helger.xml.transform.WrappedCollectingTransformErrorListener;

final class SchematronResourceCreators
{
  private SchematronResourceCreators ()
  {}

  static final class Pure
  {
    private Pure ()
    {}

    @NonNull
    static AbstractSchematronResource create (@NonNull final IReadableResource aResource,
                                              @NonNull final ErrorList aErrorList,
                                              final boolean bUseCache)
    {
      return SchematronResourcePureXPath.builder (aResource)
                                        .errorHandler (new WrappedCollectingPSErrorHandler (aErrorList))
                                        .useCache (bUseCache)
                                        .build ();
    }
  }

  static final class ISO
  {
    private ISO ()
    {}

    @NonNull
    static AbstractSchematronResource create (@NonNull final IReadableResource aResource,
                                              @NonNull final ErrorList aErrorList,
                                              @Nullable final String sLanguageCode,
                                              final boolean bUseCache)
    {
      return SchematronResourceSCH.builder (aResource)
                                  .errorListener (new WrappedCollectingTransformErrorListener (aErrorList))
                                  .languageCode (sLanguageCode)
                                  .useCache (bUseCache)
                                  .build ();
    }
  }

  static final class SchXslt1
  {
    private SchXslt1 ()
    {}

    @NonNull
    static AbstractSchematronResource create (@NonNull final IReadableResource aResource,
                                              @NonNull final ErrorList aErrorList,
                                              @Nullable final String sLanguageCode,
                                              final boolean bUseCache)
    {
      return SchematronResourceSchXslt_XSLT2.builder (aResource)
                                            .errorListener (new WrappedCollectingTransformErrorListener (aErrorList))
                                            .languageCode (sLanguageCode)
                                            .useCache (bUseCache)
                                            .build ();
    }
  }

  static final class SchXslt2
  {
    private SchXslt2 ()
    {}

    @NonNull
    static AbstractSchematronResource create (@NonNull final IReadableResource aResource,
                                              @NonNull final ErrorList aErrorList,
                                              @Nullable final String sLanguageCode,
                                              final boolean bUseCache)
    {
      return SchematronResourceSchXslt2.builder (aResource)
                                       .errorListener (new WrappedCollectingTransformErrorListener (aErrorList))
                                       .languageCode (sLanguageCode)
                                       .useCache (bUseCache)
                                       .build ();
    }
  }

  static final class XSLT
  {
    private XSLT ()
    {}

    @NonNull
    static AbstractSchematronResource create (@NonNull final IReadableResource aResource,
                                              @NonNull final ErrorList aErrorList,
                                              final boolean bUseCache)
    {
      return SchematronResourceXSLT.builder (aResource)
                                   .errorListener (new WrappedCollectingTransformErrorListener (aErrorList))
                                   .useCache (bUseCache)
                                   .build ();
    }
  }
}
