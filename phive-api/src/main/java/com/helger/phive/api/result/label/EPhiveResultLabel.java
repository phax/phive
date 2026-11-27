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
package com.helger.phive.api.result.label;

import java.util.EnumMap;
import java.util.Locale;
import java.util.Map;

import org.jspecify.annotations.NonNull;

import com.helger.annotation.Nonempty;
import com.helger.annotation.style.ReturnsMutableCopy;
import com.helger.collection.commons.CommonsEnumMap;
import com.helger.text.IMultilingualText;
import com.helger.text.display.IHasDisplayText;
import com.helger.text.resolve.DefaultTextResolver;
import com.helger.text.util.TextHelper;

/**
 * Enumeration of all label keys used in the human readable phive validation result reports (e.g.
 * HTML and PDF). Each enum constant carries a default German and English text. Use
 * {@link #createLabelMap(Locale)} to get a mutable map that can be customised for any language.
 *
 * @author Philip Helger
 * @since 12.4.0
 */
public enum EPhiveResultLabel implements IHasDisplayText
{
  /** Overall page/section title */
  VALIDATION_RESULT ("Validierungsergebnis", "Validation Result"),
  /** "Validation Executor Set" heading */
  VALIDATION_EXECUTOR_SET ("Angewendete Validierung", "Applied Validation Executor Set"),
  /** VESID field label */
  VESID ("VESID", "VESID"),
  /** Name field label */
  NAME ("Name", "Name"),
  /** Overall result heading */
  OVERALL_RESULT ("Gesamtergebnis", "Overall Result"),
  /** "Warnings" label */
  WARNINGS ("Warnungen", "Warnings"),
  /** "Errors" label */
  ERRORS ("Fehler", "Errors"),
  /** "Duration" label */
  DURATION ("Dauer", "Duration"),
  /** Validation layer heading */
  VALIDATION_LAYER ("Validierungsebene", "Validation Layer"),
  /** "Artifact Type" label */
  ARTIFACT_TYPE ("Artifakttyp", "Artifact Type"),
  /** "Artifact Path" label */
  ARTIFACT_PATH ("Artifaktpfad", "Artifact Path"),
  /** "Severity" table header */
  SEVERITY ("Schweregrad", "Severity"),
  /** "Highest Severity" table header */
  HIGHEST_SEVERITY ("Höchster Schweregrad", "Highest Severity"),
  SEVERITY_SUCCESS ("Erfolgreich", "Success"),
  SEVERITY_WARNING ("Warnung", "Warning"),
  SEVERITY_ERROR ("Fehler", "Error"),
  /** "Error ID" table header */
  ERROR_ID ("Fehler-ID", "Error ID"),
  /** "Field" table header */
  FIELD ("Feld", "Field"),
  /** "Location" table header */
  LOCATION ("Ort", "Location"),
  /** "Error Text" table header */
  ERROR_TEXT ("Fehlermeldung", "Error Text"),
  /** "Test" table header (Schematron test expression) */
  TEST ("Test", "Test"),
  /** "Skipped" label */
  SKIPPED ("Übersprungen", "Skipped"),
  /** "Interrupted" label */
  INTERRUPTED ("Abgebrochen", "Interrupted"),
  /** "Line" label */
  LINE ("Zeile", "Line"),
  /** "Column" label */
  COLUMN ("Spalte", "Column"),
  /** "Deprecated" label */
  DEPRECATED ("Veraltet", "Deprecated"),
  TRUE ("Wahr", "True"),
  FALSE ("Falsch", "False"),
  MILLISECONDS_SUFFIX (" ms", " ms"),
  /** "Source Data" section heading */
  SOURCE_DATA ("Quelldaten", "Source Data"),
  /** "Created at" label for the report creation timestamp */
  VALIDATED_AT ("Validiert am", "Validated at"),
  /** "Validated by" label for the vendor that performed the validation */
  VALIDATED_BY ("Validiert durch", "Validated by"),
  /** "Page" label, used in paged output like PDF */
  PAGE ("Seite", "Page"),
  /** The "of" between the current page number and the page count, used in paged output like PDF */
  PAGE_OF ("von", "of"),
  /** Footer text before the phive link */
  FOOTER_PREFIX ("Dieser Bericht wurde mit der ", "This report was created with the "),
  /** Footer text after the phive link */
  FOOTER_SUFFIX (" Opensource Bibliothek erstellt", " open source library");

  private final IMultilingualText m_aTP;

  EPhiveResultLabel (@NonNull final String sDE, @NonNull final String sEN)
  {
    m_aTP = TextHelper.create_DE_EN (sDE, sEN);
  }

  @NonNull
  @Nonempty
  public String getDisplayText (@NonNull final Locale aContentLocale)
  {
    return DefaultTextResolver.getTextStatic (this, m_aTP, aContentLocale);
  }

  /**
   * Create a mutable {@link EnumMap} pre-filled with the default German texts for all labels. Use
   * {@link Map#put(Object, Object)} to override individual labels for localisation.
   *
   * @return A new mutable map with all labels set to the German texts. Never <code>null</code>.
   */
  @NonNull
  @ReturnsMutableCopy
  public static CommonsEnumMap <EPhiveResultLabel, String> createLabelMapDE ()
  {
    final CommonsEnumMap <EPhiveResultLabel, String> ret = new CommonsEnumMap <> (EPhiveResultLabel.class);
    for (final EPhiveResultLabel e : values ())
      ret.put (e, e.getDisplayText (TextHelper.DE));
    return ret;
  }

  /**
   * Create a mutable {@link EnumMap} pre-filled with the default English texts for all labels. Use
   * {@link Map#put(Object, Object)} to override individual labels for localisation.
   *
   * @return A new mutable map with all labels set to the English texts. Never <code>null</code>.
   */
  @NonNull
  @ReturnsMutableCopy
  public static CommonsEnumMap <EPhiveResultLabel, String> createLabelMapEN ()
  {
    final CommonsEnumMap <EPhiveResultLabel, String> ret = new CommonsEnumMap <> (EPhiveResultLabel.class);
    for (final EPhiveResultLabel e : values ())
      ret.put (e, e.getDisplayText (TextHelper.EN));
    return ret;
  }

  /**
   * Create a mutable {@link EnumMap} pre-filled with the default texts for the provided display
   * locale: German for the language "de", English otherwise.
   *
   * @param aDisplayLocale
   *        The display locale to use. May not be <code>null</code>.
   * @return A new mutable map with all labels set. Never <code>null</code>.
   */
  @NonNull
  @ReturnsMutableCopy
  public static CommonsEnumMap <EPhiveResultLabel, String> createLabelMap (@NonNull final Locale aDisplayLocale)
  {
    if ("de".equals (aDisplayLocale.getLanguage ()))
      return createLabelMapDE ();
    return createLabelMapEN ();
  }
}
