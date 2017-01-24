package com.helger.bdve.execute;

import java.io.Serializable;

import javax.annotation.Nonnull;

import com.helger.commons.collection.ext.ICommonsIterable;
import com.helger.commons.id.IHasID;
import com.helger.commons.name.IHasDisplayName;

/**
 * Read-only interface for a named list of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 */
public interface IValidationExecutorSet extends
                                        Serializable,
                                        IHasID <String>,
                                        IHasDisplayName,
                                        ICommonsIterable <IValidationExecutor>
{
  @Nonnull
  default ValidationExecutionManager getExecutorManager ()
  {
    return new ValidationExecutionManager (this);
  }
}
