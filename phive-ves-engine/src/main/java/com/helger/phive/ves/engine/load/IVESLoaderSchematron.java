package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.commons.error.list.ErrorList;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.ves.v10.VesSchematronType;
import com.helger.phive.xml.source.IValidationSourceXML;

public interface IVESLoaderSchematron
{
  @Nonnull
  IValidationExecutor <IValidationSourceXML> loadSchematron (@Nonnull IRepoStorageBase aDataProvider,
                                                             @Nonnull VesSchematronType aSCH,
                                                             @Nonnull ErrorList aErrorList);
}
