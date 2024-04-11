/*
 * Copyright (C) 2023-2024 Philip Helger (www.helger.com)
 * philip[at]helger[dot]com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.helger.phive.ves.engine.load;

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
import com.helger.diver.api.version.VESID;
import com.helger.diver.repo.ERepoDeletable;
import com.helger.diver.repo.ERepoWritable;
import com.helger.diver.repo.IRepoStorage;
import com.helger.diver.repo.RepoStorageContentByteArray;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.impl.RepoStorageInMemory;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.ves.engine.load.VESLoader.VESLoaderStatus;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.v10.VesType;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;

public final class VESLoaderTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESLoaderTest.class);
  private static IRepoStorageWithToc s_aRepoStorage;

  private static void _addResource (@Nonnull final IRepoStorage aRepo,
                                    @Nonnull final VESID aVESID,
                                    @Nonnull @Nonempty final IReadableResource aRulesPayload)
  {
    // Create StorageKey
    final String sFileExt = "." + FilenameHelper.getExtension (aRulesPayload.getPath ());
    final RepoStorageKeyOfArtefact aKey = RepoStorageKeyOfArtefact.of (aVESID, sFileExt);

    // Read in the ves file from resources
    final byte [] aData = StreamHelper.getAllBytes (aRulesPayload);
    assertNotNull (aData);

    if (aRepo.exists (aKey))
      throw new IllegalStateException ("The key '" + aKey.getPath () + "' is already in the Repo");

    // Write data to InMemoryRepo
    final ESuccess eSuccess = aRepo.write (aKey, RepoStorageContentByteArray.of (aData));
    assertNotNull (eSuccess);
    assertTrue (eSuccess.isSuccess ());
  }

  private static void _addVES (@Nonnull final IRepoStorageWithToc aRepo,
                               @Nonnull @Nonempty final IReadableResource aVesPayload)
  {
    final ErrorList aErrorList = new ErrorList ();

    // Read VES as XML
    final VesType aVES = new VES1Marshaller ().setCollectErrors (aErrorList).read (aVesPayload);
    assertNotNull (aVES);

    // Convert to loaded VES - checking that it is okay
    final LoadedVES aLoadedVES = new VESLoader (aRepo).setUseEagerRequirementLoading (false)
                                                      .convertToLoadedVES (ValidationExecutorSetStatus.createValidNow (),
                                                                           aVES,
                                                                           new VESLoaderStatus (),
                                                                           aErrorList);
    assertNotNull (aLoadedVES);
    assertEquals (aErrorList.getAllFailures ().toString (), 0, aErrorList.size ());

    // Take VESID from the inside
    _addResource (aRepo, aLoadedVES.getHeader ().getVESID (), aVesPayload);
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
      // Upload SCH #3 status
      _addResource (aInMemoryRepo,
                    new VESID ("com.helger.phive.test", "test_sch", "3.0"),
                    new ClassPathResource ("ves/test1/sch3.status"));
      // Upload SCH VES #4 with snapshot version
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch4-snapshot.ves"));
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

    // No chain needed - use repo as is
    s_aRepoStorage = aInMemoryRepo;
  }

  @Test
  public void testPseudoVersionOldest ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (VESID.parseID ("com.helger.phive.test:test_sch:oldest"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:1", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatestReleaseActive ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (VESID.parseID ("com.helger.phive.test:test_sch:latest-release-active"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:2", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatestActive ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (VESID.parseID ("com.helger.phive.test:test_sch:latest-active"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:4-SNAPSHOT", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatestRelease ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (VESID.parseID ("com.helger.phive.test:test_sch:latest-release"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:3", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatest ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (VESID.parseID ("com.helger.phive.test:test_sch:latest"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:4-SNAPSHOT", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void test1LoadXSD1 ()
  {
    final VESID aVESID = VESID.parseID ("com.helger.phive.test:test_xsd:1.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList aValidationResultList = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList)
                                                                .getValidationResultList ();
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
    final ValidationResultList aValidationResultList = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList)
                                                                .getValidationResultList ();
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
    final ValidationResultList aValidationResultList = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList)
                                                                .getValidationResultList ();
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
    final ValidationResultList aValidationResultList = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList)
                                                                .getValidationResultList ();
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
    final ValidationResultList aValidationResultList = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                                            aVESID,
                                                                                            aValidationSource,
                                                                                            aErrorList)
                                                                .getValidationResultList ();
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
