package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.ves.v10.VesEdifactType;
import com.helger.phive.xml.source.IValidationSourceBinary;

public interface IVESLoaderEdifact
{
  @Nonnull
  ValidationExecutorSet <IValidationSourceBinary> loadEdifact (@Nonnull IRepoStorageChain aRepoChain,
                                                               @Nonnull LoadedVES.Header aHeader,
                                                               @Nonnull LoadedVES.Status aStatus,
                                                               @Nonnull VesEdifactType aEDI);
}
