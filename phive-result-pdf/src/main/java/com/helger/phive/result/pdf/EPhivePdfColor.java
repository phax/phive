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

import com.helger.pdflayout.base.PLColor;

/**
 * All colours used in the phive PDF output. The default values match the default stylesheet of the
 * HTML output. Override {@link PhivePdfHelper#getColor(EPhivePdfColor)} to use different colours.
 *
 * @author Philip Helger
 * @since 12.4.0
 */
public enum EPhivePdfColor
{
  TEXT (0x333333),
  HEADING (0x222222),
  HEADING_SECONDARY (0x444444),
  LABEL (0x555555),
  MUTED (0x666666),
  LINE_NUMBER (0x999999),
  BORDER (0xdddddd),
  BG_SUBTLE (0xf5f5f5),
  BG_VES (0xf0f4f8),
  BORDER_VES (0xd0d8e0),
  BG_DEPRECATED (0xfef6e8),
  BORDER_DEPRECATED (0xe8d5a8),
  BG_SUCCESS (0xe8f5e9),
  BORDER_SUCCESS (0xa5d6a7),
  ACCENT_SUCCESS (0x81c784),
  BG_SUCCESS_ROW (0xf0faf0),
  BG_FAILURE (0xfdecea),
  BORDER_FAILURE (0xf5c6cb),
  ACCENT_FAILURE (0xe57373),
  BG_ERROR_ROW (0xfef0f0),
  ERROR_TEXT (0xc62828),
  BG_WARNING_ROW (0xfef9e7),
  WARNING_TEXT (0xe65100),
  BG_SKIPPED (0xf9f9f9),
  ACCENT_SKIPPED (0xbbbbbb),
  LINK (0x1a5fb4);

  private final PLColor m_aDefaultColor;

  EPhivePdfColor (final int nRGB)
  {
    m_aDefaultColor = new PLColor ((nRGB >> 16) & 0xff, (nRGB >> 8) & 0xff, nRGB & 0xff);
  }

  /**
   * @return The default colour. Never <code>null</code>.
   */
  @NonNull
  public PLColor getDefaultColor ()
  {
    return m_aDefaultColor;
  }
}
