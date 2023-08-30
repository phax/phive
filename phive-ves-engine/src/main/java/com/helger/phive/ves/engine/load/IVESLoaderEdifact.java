package com.helger.phive.ves.engine.load;

import javax.annotation.Nonnull;

import com.helger.commons.error.list.ErrorList;
import com.helger.phive.api.execute.IValidationExecutor;
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.ves.v10.VesEdifactType;
import com.helger.phive.xml.source.IValidationSourceBinary;

/**
 * This interface is used by {@link VESLoader} create an
 * {@link IValidationExecutor} from the VES Edifact requirements.
 *
 * @author Philip Helger
 */
public interface IVESLoaderEdifact
{
  @Nonnull
  IValidationExecutor <IValidationSourceBinary> loadEdifact (@Nonnull IRepoStorageBase aRepo,
                                                             @Nonnull VesEdifactType aEDI,
                                                             @Nonnull ErrorList aErrorList);
}
