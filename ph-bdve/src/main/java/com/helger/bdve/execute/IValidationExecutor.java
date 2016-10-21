package com.helger.bdve.execute;

import java.io.File;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;
import javax.xml.transform.Source;

import com.helger.bdve.result.ValidationResult;
import com.helger.commons.io.IHasInputStream;
import com.helger.xml.transform.TransformSourceFactory;

/**
 * Base interface for performing validation of a single document.
 *
 * @author Philip Helger
 */
public interface IValidationExecutor
{
  /**
   * Perform validation
   *
   * @param aSourceDocument
   *        Source document byte array
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull final byte [] aSourceDocument)
  {
    return applyValidation (TransformSourceFactory.create (aSourceDocument));
  }

  /**
   * Perform validation
   *
   * @param aSourceDocument
   *        Source file
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull final File aSourceDocument)
  {
    return applyValidation (TransformSourceFactory.create (aSourceDocument));
  }

  /**
   * Perform validation
   *
   * @param aSourceDocument
   *        Source input stream provider
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull final IHasInputStream aSourceDocument)
  {
    return applyValidation (TransformSourceFactory.create (aSourceDocument));
  }

  /**
   * Perform validation
   *
   * @param aSourceDocument
   *        Source to be validated
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull @WillClose final Source aSourceDocument)
  {
    return applyValidation (aSourceDocument, (ClassLoader) null);
  }

  /**
   * Perform validation
   *
   * @param aSourceDocument
   *        Source to be validated
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code> to use the
   *        default context class loader.
   * @return Never <code>null</code>.
   */
  @Nonnull
  ValidationResult applyValidation (@Nonnull @WillClose Source aSourceDocument, @Nullable ClassLoader aClassLoader);
}
