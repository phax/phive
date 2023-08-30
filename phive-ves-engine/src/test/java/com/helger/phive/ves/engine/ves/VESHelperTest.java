package com.helger.phive.ves.engine.ves;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Locale;

import javax.annotation.Nonnull;

import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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
import com.helger.phive.repo.IRepoStorageBase;
import com.helger.phive.repo.RepoStorageChain;
import com.helger.phive.repo.RepoStorageItem;
import com.helger.phive.repo.RepoStorageKey;
import com.helger.phive.repo.impl.RepoStorageInMemory;
import com.helger.phive.ves.engine.load.LoadedVES;
import com.helger.phive.ves.engine.load.LoadedVES.Status;
import com.helger.phive.ves.engine.load.VESHelper;
import com.helger.phive.ves.engine.load.VESLoader;
import com.helger.phive.ves.engine.load.VESLoader.VESLoaderStatus;
import com.helger.phive.ves.engine.load.VESLoadingException;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.v10.VesType;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;

public final class VESHelperTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESHelperTest.class);
  private static IRepoStorageBase s_aRepoStorage;

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

    if (aInMemoryRepo.exists (aKey))
      throw new IllegalStateException ("The key '" + aKey.getPath () + "' is already in the Repo");

    // Write data to InMemoryRepo
    final ESuccess eSuccess = aInMemoryRepo.write (aKey, RepoStorageItem.of (aData));
    assertNotNull (eSuccess);
    assertTrue (eSuccess.isSuccess ());
  }

  private static void _addVES (@Nonnull final RepoStorageInMemory aInMemoryRepo,
                               @Nonnull @Nonempty final IReadableResource aPayload)
  {
    final ErrorList aErrorList = new ErrorList ();

    // Read VES as XML
    final VesType aVES = new VES1Marshaller ().setCollectErrors (aErrorList).read (aPayload);
    assertNotNull (aVES);

    // Convert to loaded VES - checking that it is okay
    final LoadedVES aLoadedVES = new VESLoader (aInMemoryRepo).setUseEagerRequirementLoading (false)
                                                              .convertToLoadedVES (Status.createUndefined (),
                                                                                   aVES,
                                                                                   new VESLoaderStatus (),
                                                                                   aErrorList);
    assertNotNull (aLoadedVES);
    assertEquals (aErrorList.getAllFailures ().toString (), 0, aErrorList.size ());

    // Take VESID from the inside
    _addResource (aInMemoryRepo, aLoadedVES.getHeader ().getVESID (), aPayload);
  }

  @BeforeClass
  public static void beforeClass ()
  {
    // Create an InMemoryRepo. Name it, enable write and delete.
    final RepoStorageInMemory aInMemoryRepo = RepoStorageInMemory.createDefault ("unittest-local",
                                                                                 ERepoWritable.WITH_WRITE,
                                                                                 ERepoDeletable.WITH_DELETE);

    // test1
    {
      // Upload XSD #1
      _addResource (aInMemoryRepo,
                    new VESID ("com.helger.phive.test", "mini", "1.0"),
                    new ClassPathResource ("ves/test1/mini.xsd"));
      // Upload XSD VES #1
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/xsd.ves"));

      // Upload SCH #1
      _addResource (aInMemoryRepo,
                    new VESID ("com.helger.phive.test", "mini-sch1", "2023.8"),
                    new ClassPathResource ("ves/test1/mini1.sch"));
      // Upload SCH #2
      _addResource (aInMemoryRepo,
                    new VESID ("com.helger.phive.test", "mini-sch2", "2023.8"),
                    new ClassPathResource ("ves/test1/mini2.sch"));
      // Upload SCH VES #1
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch1.ves"));
      // Upload SCH VES #2 with XSD requires
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch2.ves"));
      // Upload SCH VES #3 with SCH requires
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch3.ves"));
    }

    // test2
    {
      _addResource (aInMemoryRepo,
                    new VESID ("com.helger.phive.test2", "UBL-xsdrt", "2.1"),
                    new ClassPathResource ("ves/test2/UBL-2.1-xsdrt.zip"));
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test2/xsd.ves"));
    }

    // test3
    {
      _addResource (aInMemoryRepo,
                    new VESID ("com.helger.phive.test3", "mini", "1.0"),
                    new ClassPathResource ("ves/test3/mini.xsd"));
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test3/xsd1.ves"));
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test3/xsd2.ves"));
    }

    // Create RepoStorageChain with InMemoryRepo and return it
    s_aRepoStorage = RepoStorageChain.of (aInMemoryRepo);
  }

  @Test
  public void test1LoadXSD1 ()
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
  public void test1LoadSCH1 ()
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
  public void test1LoadSCH2Valid ()
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
  public void test1LoadSCH3Valid ()
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
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (), aValidationResultList.get (0).isSuccess ());
    assertTrue (aValidationResultList.get (1).getErrorList ().toString (), aValidationResultList.get (1).isSuccess ());
    assertTrue (aValidationResultList.get (2).getErrorList ().toString (), aValidationResultList.get (2).isSuccess ());
  }

  @Test
  public void test2LoadXSD1 ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test2:test_xsd:1");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test2/base-example.xml"));
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
  public void test3RecursiveXSDEager ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test3:xsd1:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoadedVES = new VESLoader (s_aRepoStorage).setUseEagerRequirementLoading (true)
                                                               .loadVESFromRepo (aVESID, aErrorList);
    // Loading of required fails immediately
    assertNull (aLoadedVES);

    aErrorList.getAllErrors ().forEach (x -> LOGGER.error (x.getAsString (Locale.US)));
  }

  @Test (expected = VESLoadingException.class)
  public void test3RecursiveXSDLazy ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test3:xsd1:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoadedVES = new VESLoader (s_aRepoStorage).setUseEagerRequirementLoading (false)
                                                               .loadVESFromRepo (aVESID, aErrorList);
    // Requirements are not yet loaded - so Loading so OK so far
    assertNotNull (aLoadedVES);

    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ValidationResultList aValidationResultList = new ValidationResultList ();
    // Should throw a VESLoadingException
    aLoadedVES.applyValidation (aValidationSource, aValidationResultList, Locale.US);
  }
}
