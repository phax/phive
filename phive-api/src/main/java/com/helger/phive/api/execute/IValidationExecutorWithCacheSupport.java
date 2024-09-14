package com.helger.phive.api.execute;

import javax.annotation.Nonnull;

/**
 * Nested interface for validation executors that support caching. Each
 * implementation of IValidationExecutor is free to also implement this
 * interface.
 *
 * @author Philip Helger
 * @since 3.1.1
 */
public interface IValidationExecutorWithCacheSupport
{
  /** By default caching should be enabled. */
  boolean DEFAULT_CACHE = true;

  /**
   * @return <code>true</code> if caching is enabled, <code>false</code> if
   *         not.
   */
  boolean isCacheArtefact ();

  /**
   * Enable or disable caching.
   *
   * @param bCacheArtefact
   *        <code>true</code> to enable caching, <code>false</code> to disable
   *        it.
   * @return this for chaining
   */
  @Nonnull
  IValidationExecutorWithCacheSupport setCacheArtefact (boolean bCacheArtefact);

  /**
   * If caching of this artefact is enabled, ensure it is in the cache.
   *
   * @since 7.1.1
   */
  void ensureItemIsInCache ();
}