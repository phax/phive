package com.helger.phive.ves.engine.ves;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import javax.annotation.Nonnull;

import org.junit.Test;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.io.file.FilenameHelper;
import com.helger.commons.io.resource.ClassPathResource;
import com.helger.commons.io.resource.IReadableResource;
import com.helger.commons.io.stream.StreamHelper;
import com.helger.commons.state.ESuccess;
import com.helger.phive.api.executorset.VESID;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.repo.ERepoDeletable;
import com.helger.phive.repo.ERepoWritable;
import com.helger.phive.repo.IRepoStorageChain;
import com.helger.phive.repo.RepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.impl.RepoStorageInMemory;
import com.helger.phive.ves.engine.load.VESLoader;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;

public final class VESHelperTest
{
  private void _addVESItem (@Nonnull final RepoStorageInMemory aInMemoryRepo,
                            @Nonnull final VESID aVESID,
                            @Nonnull @Nonempty final IReadableResource itemPath)
  {
    // Create StorageKey
    final String sFileExt = "." + FilenameHelper.getExtension (itemPath.getPath ());
    final RepoStorageKey aKey = RepoStorageKey.of (aVESID, sFileExt);

    // Read in the ves file from resources
    final byte [] aData = StreamHelper.getAllBytes (itemPath);
    assertNotNull (aData);

    // Write data to InMemoryRepo
    final ESuccess eSuccess = aInMemoryRepo.write (aKey, RepoStorageItem.of (aData));
    assertNotNull (eSuccess);
    assertTrue (eSuccess.isSuccess ());
  }

  @Nonnull
  private IRepoStorageChain _getRepoStorageChain ()
  {
    // Create an InMemoryRepo. Name it, enable write and delete.
    final RepoStorageInMemory aInMemoryRepo = RepoStorageInMemory.createDefault ("unittest-local",
                                                                                 ERepoWritable.WITH_WRITE,
                                                                                 ERepoDeletable.WITH_DELETE);

    // Upload XSD
    _addVESItem (aInMemoryRepo,
                 new VESID ("com.helger.phive.test", "mini", "1.0"),
                 new ClassPathResource ("ves/test-xsd1/mini.xsd"));
    // Upload XML VES
    _addVESItem (aInMemoryRepo,
                 new VESID ("com.helger.phive.test", "test", "1.0"),
                 new ClassPathResource ("ves/test-xsd1/test.ves"));

    // Upload SCH
    _addVESItem (aInMemoryRepo,
                 new VESID ("com.helger.phive.test", "mini-sch", "2023.8"),
                 new ClassPathResource ("ves/test-sch1/mini.sch"));
    // Upload SCH VES
    _addVESItem (aInMemoryRepo,
                 new VESID ("com.helger.phive.test", "test_sch", "1.0"),
                 new ClassPathResource ("ves/test-sch1/test.ves"));

    // Create RepoStorageChain with InMemoryRepo and return it
    return RepoStorageChain.of (aInMemoryRepo);
  }

  @Test
  public void testVesHelperXsd ()
  {
    final IRepoStorageChain aRepoChain = _getRepoStorageChain ();
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test:1.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test-xsd1/mini.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ValidationResultList validationResultList = VESLoader.runAndApplyVES (aRepoChain, aVESID, aValidationSource);
    assertNotNull (validationResultList);
    assertEquals (1, validationResultList.size ());
    assertTrue (validationResultList.getFirst ().isSuccess ());
  }

  @Test
  public void testVesHelperSch ()
  {
    final IRepoStorageChain aRepoChain = _getRepoStorageChain ();
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test_sch:1.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test-sch1/mini.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ValidationResultList validationResultList = VESLoader.runAndApplyVES (aRepoChain, aVESID, aValidationSource);
    assertNotNull (validationResultList);
    assertEquals (1, validationResultList.size ());
    assertTrue (validationResultList.getFirst ().isSuccess ());
  }
}
