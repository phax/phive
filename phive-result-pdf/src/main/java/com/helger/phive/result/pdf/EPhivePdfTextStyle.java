/*
 * Copyright (C) 2026 Philip Helger (www.helger.com)
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
package com.helger.phive.result.pdf;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonnegative;

/**
 * All text styles used in the phive PDF output, each with a default font type, font size (in
 * points) and colour. Override {@link PhivePdfHelper#getFontSpec(EPhivePdfTextStyle)} to use
 * different text styles.
 *
 * @author Philip Helger
 * @since 12.4.0
 */
public enum EPhivePdfTextStyle
{
  /** The document title */
  TITLE (EPhivePdfFontType.BOLD, 18, EPhivePdfColor.HEADING),
  /** Section headings like VES and overall result */
  HEADING (EPhivePdfFontType.BOLD, 12, EPhivePdfColor.HEADING_SECONDARY),
  /** Validation layer headings */
  SUBHEADING (EPhivePdfFontType.BOLD, 10.5f, EPhivePdfColor.HEADING_SECONDARY),
  /** Labels in front of values */
  LABEL (EPhivePdfFontType.BOLD, 9, EPhivePdfColor.LABEL),
  /** Values next to labels */
  VALUE (EPhivePdfFontType.REGULAR, 9, EPhivePdfColor.TEXT),
  /** Technical values next to labels, like the artefact path */
  VALUE_MONO (EPhivePdfFontType.MONO, 8.5f, EPhivePdfColor.TEXT),
  /** Less important information, like the validation timestamp */
  MUTED (EPhivePdfFontType.REGULAR, 8.5f, EPhivePdfColor.MUTED),
  /** Header cells of the error tables */
  TABLE_HEADER (EPhivePdfFontType.BOLD, 8, EPhivePdfColor.HEADING_SECONDARY),
  /** Body cells of the error tables */
  TABLE_CELL (EPhivePdfFontType.REGULAR, 8, EPhivePdfColor.TEXT),
  /** Severity cells of the error tables (the colour is set per severity) */
  TABLE_CELL_SEVERITY (EPhivePdfFontType.BOLD, 8, EPhivePdfColor.TEXT),
  /** Technical body cells of the error tables, like the error ID, field, location and test */
  TABLE_CELL_MONO (EPhivePdfFontType.MONO, 7.5f, EPhivePdfColor.TEXT),
  /** Line numbers of the source data */
  SOURCE_LINE_NUMBER (EPhivePdfFontType.MONO, 7, EPhivePdfColor.LINE_NUMBER),
  /** Lines of the source data */
  SOURCE_LINE (EPhivePdfFontType.MONO, 7, EPhivePdfColor.TEXT),
  /** The page footer */
  FOOTER (EPhivePdfFontType.REGULAR, 7.5f, EPhivePdfColor.MUTED);

  private final EPhivePdfFontType m_eFontType;
  private final float m_fFontSize;
  private final EPhivePdfColor m_eColor;

  EPhivePdfTextStyle (@NonNull final EPhivePdfFontType eFontType,
                      @Nonnegative final float fFontSize,
                      @NonNull final EPhivePdfColor eColor)
  {
    m_eFontType = eFontType;
    m_fFontSize = fFontSize;
    m_eColor = eColor;
  }

  /**
   * @return The default font type. Never <code>null</code>.
   */
  @NonNull
  public EPhivePdfFontType getFontType ()
  {
    return m_eFontType;
  }

  /**
   * @return The default font size in points. Always &gt; 0.
   */
  @Nonnegative
  public float getFontSize ()
  {
    return m_fFontSize;
  }

  /**
   * @return The default text colour. Never <code>null</code>.
   */
  @NonNull
  public EPhivePdfColor getColor ()
  {
    return m_eColor;
  }
}
