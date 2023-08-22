package com.helger.phive.ves.engine.ves;

import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.state.ESuccess;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoHashState;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.impl.RepoStorageInMemory;

import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.ThreadLocalRandom;

import static org.junit.Assert.*;

public final class VESHelperTest {

  @Test
  public void testVesHelper() {

    IRepoStorageChain aRepoChain = createRepoStorageChain();
    VESID aVESID = null;
    IValidationSource aValidationSource = null;

    ValidationResult
        validationResult =
        VESHelper.runAndApplyVES(aRepoChain, aVESID, aValidationSource);
  }

  private IRepoStorageChain createRepoStorageChain() {

    //Create an InMemoryRepo. Name it, enable write and delete.
    final RepoStorageInMemory aInMemoryRepo = RepoStorageInMemory.createDefault("unittest-local",
                                                                                ERepoWritable.WITH_WRITE,
                                                                                ERepoDeletable.WITH_DELETE);

    //Create StorageKey
    final RepoStorageKey aKey = RepoStorageKey.of("com/ecosio/ves-xsd-test1.xml");

    //Read in the ves file from resources
    byte[] aData;
    try (InputStream is = ClassPathResource.getInputStream("ves/test1/ves-xsd-test1.xml")) {
      aData = new byte[is.available()];
      is.read(aData);
    } catch (IOException e) {
      throw new RuntimeException(e);
    }

    //Write data to InMemoryRepo
    aInMemoryRepo.write(aKey, RepoStorageItem.of(aData));

    //Create RepoStorageChain with InMemoryRepo and return it
    return RepoStorageChain.of(aInMemoryRepo);
  }
}
