/**
 * Copyright (C) 2014-2017 Philip Helger (www.helger.com)
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
package com.helger.bdve.peppol.supplementary.createrules.util;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import org.odftoolkit.odfdom.dom.element.office.OfficeAnnotationElement;
import org.odftoolkit.odfdom.pkg.OdfElement;
import org.odftoolkit.simple.Component;
import org.odftoolkit.simple.common.TextExtractor;

/**
 * Extract all texts except annotations
 *
 * @author philip
 */
@Immutable
public final class SimpleTextExtractor extends TextExtractor
{
  public SimpleTextExtractor (@Nonnull final OdfElement aElement)
  {
    super (aElement);
  }

  @Override
  public void visit (@Nonnull final OdfElement aElement)
  {
    // Ignore all notes
    if (!(aElement instanceof OfficeAnnotationElement))
      super.visit (aElement);
  }

  @Nonnull
  public static String getText (@Nonnull final Component aComponent)
  {
    return new SimpleTextExtractor (aComponent.getOdfElement ()).getText ();
  }
}
