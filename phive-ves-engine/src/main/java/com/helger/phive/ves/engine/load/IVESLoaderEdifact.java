package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.ves.v10.VesEdifactType;
import com.helger.phive.xml.source.IValidationSourceBinary;

public interface IVESLoaderEdifact
{
  @Nonnull
  IValidationExecutor <IValidationSourceBinary> loadEdifact (@Nonnull IRepoStorageChain aRepoChain,
                                                             @Nonnull VesEdifactType aEDI);
}
