package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.WillClose;

import org.w3c.dom.Node;

import com.helger.bdve.result.ValidationResult;

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
   * @param aNode
   *        Node to be validated.
   * @return Never <code>null</code>.
   */
  @Nonnull
  default ValidationResult applyValidation (@Nonnull @WillClose final Node aNode)
  {
    return applyValidation (aNode, (ClassLoader) null);
  }

  /**
   * Perform validation
   *
   * @param aNode
   *        Node to be validated.
   * @param aClassLoader
   *        Optional class loader to use. May be <code>null</code> to use the
   *        default context class loader.
   * @return Never <code>null</code>.
   */
  @Nonnull
  ValidationResult applyValidation (@Nonnull @WillClose Node aNode, @Nullable ClassLoader aClassLoader);
}
