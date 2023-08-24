package com.helger.phive.ves.engine.ves;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import javax.annotation.Nonnull;

import org.junit.BeforeClass;
import org.junit.Test;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.error.list.ErrorList;
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
import com.helger.phive.ves.engine.load.VESHelper;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;

public final class VESHelperTest
{
  private static IRepoStorageChain s_aRepoStorage;

  private static void _addResource (@Nonnull final RepoStorageInMemory aInMemoryRepo,
                                    @Nonnull final VESID aVESID,
                                    @Nonnull @Nonempty final IReadableResource aPayload)
  {
    // Create StorageKey
    final String sFileExt = "." + FilenameHelper.getExtension (aPayload.getPath ());
    final RepoStorageKey aKey = RepoStorageKey.of (aVESID, sFileExt);

    // Read in the ves file from resources
    final byte [] aData = StreamHelper.getAllBytes (aPayload);
    assertNotNull (aData);

    // Write data to InMemoryRepo
    final ESuccess eSuccess = aInMemoryRepo.write (aKey, RepoStorageItem.of (aData));
    assertNotNull (eSuccess);
    assertTrue (eSuccess.isSuccess ());
  }

  @BeforeClass
  public static void beforeClass ()
  {
    // Create an InMemoryRepo. Name it, enable write and delete.
    final RepoStorageInMemory aInMemoryRepo = RepoStorageInMemory.createDefault ("unittest-local",
                                                                                 ERepoWritable.WITH_WRITE,
                                                                                 ERepoDeletable.WITH_DELETE);

    // Upload XSD #1
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "mini", "1.0"),
                  new ClassPathResource ("ves/test1/mini.xsd"));
    // Upload XSD VES #1
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "test_xsd", "1.0"),
                  new ClassPathResource ("ves/test1/xsd.ves"));

    // Upload SCH #1
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "mini-sch1", "2023.8"),
                  new ClassPathResource ("ves/test1/mini1.sch"));
    // Upload SCH #2
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "mini-sch2", "2023.8"),
                  new ClassPathResource ("ves/test1/mini2.sch"));
    // Upload SCH VES #1
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "test_sch", "1.0"),
                  new ClassPathResource ("ves/test1/sch1.ves"));
    // Upload SCH VES #2 with XSD requires
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "test_sch", "2.0"),
                  new ClassPathResource ("ves/test1/sch2.ves"));
    // Upload SCH VES #3 with SCH requires
    _addResource (aInMemoryRepo,
                  new VESID ("com.helger.phive.test", "test_sch", "3.0"),
                  new ClassPathResource ("ves/test1/sch3.ves"));

    // Create RepoStorageChain with InMemoryRepo and return it
    s_aRepoStorage = RepoStorageChain.of (aInMemoryRepo);
  }

  @Test
  public void testLoadXSD1 ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test_xsd:1.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList aValidationResultList = VESHelper.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    assertNotNull (aValidationResultList);
    assertEquals (1, aValidationResultList.size ());
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (), aValidationResultList.get (0).isSuccess ());
  }

  @Test
  public void testLoadSCH1 ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test_sch:1.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList aValidationResultList = VESHelper.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    assertNotNull (aValidationResultList);
    assertEquals (1, aValidationResultList.size ());
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (), aValidationResultList.get (0).isSuccess ());
  }

  @Test
  public void testLoadSCH2Valid ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test_sch:2.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList aValidationResultList = VESHelper.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    assertNotNull (aValidationResultList);
    assertEquals (2, aValidationResultList.size ());
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (), aValidationResultList.get (0).isSuccess ());
    assertTrue (aValidationResultList.get (1).getErrorList ().toString (), aValidationResultList.get (1).isSuccess ());
  }

  @Test
  public void testLoadSCH3Valid ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test_sch:3.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList aValidationResultList = VESHelper.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    assertNotNull (aValidationResultList);
    assertEquals (3, aValidationResultList.size ());
    assertTrue (aValidationResultList.get (0).isSuccess ());
    assertTrue (aValidationResultList.get (1).isSuccess ());
    assertTrue (aValidationResultList.get (2).isSuccess ());
  }
}
