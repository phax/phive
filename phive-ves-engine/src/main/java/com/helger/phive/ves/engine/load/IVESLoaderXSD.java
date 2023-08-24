package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.commons.error.list.ErrorList;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.ves.v10.VesXsdType;
import com.helger.phive.xml.source.IValidationSourceXML;

public interface IVESLoaderXSD
{
  @Nonnull
  IValidationExecutor <IValidationSourceXML> loadXSD (@Nonnull IRepoStorageBase aDataProvider,
                                                      @Nonnull VesXsdType aXSD,
                                                      @Nonnull ErrorList aErrorList);
}
