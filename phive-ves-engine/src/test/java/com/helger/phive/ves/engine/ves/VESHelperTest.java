package com.helger.phive.ves.engine.ves;

import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.impl.RepoStorageInMemory;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;

public final class VESHelperTest {

  private static final Logger LOGGER = LoggerFactory.getLogger (VESHelperTest.class);

  @Test
  public void testVesHelper() {

    IRepoStorageChain aRepoChain = getRepoStorageChain();
    VESID aVESID = VESID.parseID("com.helger.phive.test:test:1.0");
    IValidationSourceXML aValidationSource = getValidationSource();

    ValidationResult validationResult = VESHelper.runAndApplyVES(aRepoChain, aVESID, aValidationSource);
    LOGGER.info("Validation successful: " + validationResult.isSuccess());
  }

  private IRepoStorageChain getRepoStorageChain() {

    //Create an InMemoryRepo. Name it, enable write and delete.
    final RepoStorageInMemory aInMemoryRepo = RepoStorageInMemory.createDefault("unittest-local",
                                                                                ERepoWritable.WITH_WRITE,
                                                                                ERepoDeletable.WITH_DELETE);

    //Create StorageKey
    final RepoStorageKey aKey = RepoStorageKey.of("com/helger/phive/test/test/1.0/test-1.0.ves");

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

  private IValidationSourceXML getValidationSource() {
    IReadableResource aReadableRes = new ClassPathResource("ves/test1/mini.xml");
    return ValidationSourceXML.create(aReadableRes);
  }
}
