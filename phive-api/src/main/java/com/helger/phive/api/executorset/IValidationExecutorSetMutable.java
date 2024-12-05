package com.helger.phive.api.executorset;

import javax.annotation.Nonnull;

import com.helger.commons.annotation.ChangeNextMajorRelease;
import com.helger.commons.state.EChange;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.source.IValidationSource;

/**
 * Define a common interface for {@link IValidationExecutorSet} with modifying
 * methods.
 *
 * @author Philip Helger
 * @param <SOURCETYPE>
 *        The validation source type to be used.
 * @since 10.0.4
 */
public interface IValidationExecutorSetMutable <SOURCETYPE extends IValidationSource> extends
                                               IValidationExecutorSet <SOURCETYPE>
{
  /**
   * Add a single executor.
   *
   * @param aExecutor
   *        The executor to be added. May not be <code>null</code>.
   * @return this for chaining
   */
  @Nonnull
  IValidationExecutorSetMutable <SOURCETYPE> addExecutor (@Nonnull IValidationExecutor <SOURCETYPE> aExecutor);

  /**
   * Set the cache status to all contained validation executors, that implement
   * the <code>IValidationExecutorCacheSupport</code> interface.
   *
   * @param bCache
   *        <code>true</code> to enable caching, <code>false</code> to disable
   *        it.
   */
  @ChangeNextMajorRelease ("Change return type to this type")
  void setValidationExecutorDoCache (boolean bCache);

  /**
   * As some {@link IValidationExecutor} instances may contain a hard reference
   * to a {@link ClassLoader} this methods removes all executors and allows for
   * them to be garbage collected.<br>
   * New executors may be added afterwards but this method is mainly meant for
   * safe cleanup.
   *
   * @return {@link EChange}
   */
  @Nonnull
  EChange removeAllExecutors ();
}
