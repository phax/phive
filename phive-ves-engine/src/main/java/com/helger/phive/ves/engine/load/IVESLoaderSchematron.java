package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.xml.source.IValidationSourceXML;

public interface IVESLoaderSchematron
{
  @Nonnull
  ValidationExecutorSet <IValidationSourceXML> loadSchematron (@Nonnull IRepoStorageChain aRepoChain,
                                                               @Nonnull LoadedVES.Header aHeader,
                                                               @Nonnull LoadedVES.Status aStatus,
                                                               @Nonnull VesSchematronType aSCH);
}
