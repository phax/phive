/*
 * Copyright (C) 2023-2026 Philip Helger (www.helger.com)
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
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.nio.charset.StandardCharsets;
import java.time.Month;
import java.time.OffsetDateTime;
import java.util.Locale;

import org.jspecify.annotations.NonNull;
import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.helger.annotation.Nonempty;
import com.helger.base.io.stream.StreamHelper;
import com.helger.base.state.ESuccess;
import com.helger.collection.commons.ICommonsList;
import com.helger.datetime.helper.PDTFactory;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.api.version.DVRVersionException;
import com.helger.diver.repo.ERepoDeletable;
import com.helger.diver.repo.ERepoWritable;
import com.helger.diver.repo.IRepoStorage;
import com.helger.diver.repo.RepoStorageContentByteArray;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.impl.RepoStorageInMemory;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.io.file.FilenameHelper;
import com.helger.io.resource.ClassPathResource;
import com.helger.io.resource.IReadableResource;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.ves.engine.load.VESLoader.VESLoaderStatus;
import com.helger.phive.ves.model.v1.VES1Marshaller;
import com.helger.phive.ves.v10.VesType;
import com.helger.phive.xml.partial.ValidationExecutorPartial;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.phive.xml.xsd.ValidationExecutorXSD;
import com.helger.xml.serialize.read.DOMReader;

public final class VESLoaderTest
{
  private static final Logger LOGGER = LoggerFactory.getLogger (VESLoaderTest.class);
  private static IRepoStorageWithToc s_aRepoStorage;

  private static void _addResource (@NonNull final IRepoStorage aRepo,
                                    @NonNull final DVRCoordinate aVESID,
                                    @NonNull @Nonempty final IReadableResource aRulesPayload)
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

  private static void _addVES (@NonNull final IRepoStorageWithToc aRepo,
                               @NonNull @Nonempty final IReadableResource aVesPayload)
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
  public static void beforeClass () throws DVRVersionException
  {
    // Create an InMemoryRepo. Name it, enable write and delete.
    final RepoStorageInMemory aInMemoryRepo = RepoStorageInMemory.createDefault ("unittest-local",
                                                                                 ERepoWritable.WITH_WRITE,
                                                                                 ERepoDeletable.WITH_DELETE);

    // test1
    {
      // Upload XSD #1
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test", "mini", "1.0"),
                    new ClassPathResource ("ves/test1/mini.xsd"));
      // Upload XSD VES #1
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/xsd.ves"));

      // Upload SCH #1
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test", "mini-sch1", "2023.8"),
                    new ClassPathResource ("ves/test1/mini1.sch"));
      // Upload SCH #2
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test", "mini-sch2", "2023.8"),
                    new ClassPathResource ("ves/test1/mini2.sch"));
      // Upload SCH VES #1
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch1.ves"));
      // Upload SCH VES #2 with XSD requires
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch2.ves"));
      // Upload SCH VES #3 with SCH requires
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch3.ves"));
      // Upload SCH #3 status
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test", "test_sch", "3.0"),
                    new ClassPathResource ("ves/test1/sch3.status"));
      // Upload SCH VES #4 with snapshot version
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch4-snapshot.ves"));
      // Upload XSD VES with stopOnError="false"
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/xsd-nostop.ves"));
      // Upload SCH VES with stopOnError="true"
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch-stop.ves"));
      // Upload SCH for partial validation
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test", "mini-sch-partial", "2023.8"),
                    new ClassPathResource ("ves/test1/mini-partial.sch"));
      // Upload SCH VES with partial validation
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test1/sch-partial.ves"));
      // Upload SCH VES with invalid partial validation - not via _addVES as it does not load
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test", "test_sch_partial_invalid", "1.0"),
                    new ClassPathResource ("ves/test1/sch-partial-invalid.ves"));
    }

    // test2
    {
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test2", "UBL-xsdrt", "2.1"),
                    new ClassPathResource ("ves/test2/UBL-2.1-xsdrt.zip"));
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test2/xsd.ves"));
    }

    // test3
    {
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test3", "mini", "1.0"),
                    new ClassPathResource ("ves/test3/mini.xsd"));
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test3/xsd1.ves"));
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test3/xsd2.ves"));
    }

    // test5 - deprecated versions
    {
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test5", "mini", "1.0"),
                    new ClassPathResource ("ves/test5/mini.xsd"));
      // No status
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test5/xsd-1.0.ves"));
      // Deprecated and expired
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test5/xsd-1.1.ves"));
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test5", "xsd", "1.1"),
                    new ClassPathResource ("ves/test5/xsd-1.1.status"));
      // Deprecated without validity period
      _addVES (aInMemoryRepo, new ClassPathResource ("ves/test5/xsd-2.0.ves"));
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("com.helger.phive.test5", "xsd", "2.0"),
                    new ClassPathResource ("ves/test5/xsd-2.0.status"));
    }

    // test4 - Peppol BIS Billing Invoice inside an SBDH
    {
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("org.oasis-open", "ubl-xsdrt", "2.1"),
                    new ClassPathResource ("ves/test2/UBL-2.1-xsdrt.zip"));
      _addVES (aInMemoryRepo, new ClassPathResource ("external/test4/ubl-invoice-2.1.ves"));

      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("eu.peppol.bis3", "cen-en16931-ubl", "2026.5"),
                    new ClassPathResource ("external/test4/CEN-EN16931-UBL.xslt"));
      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("eu.peppol.bis3", "peppol-en16931-ubl", "2026.5"),
                    new ClassPathResource ("external/test4/PEPPOL-EN16931-UBL.xslt"));
      _addVES (aInMemoryRepo, new ClassPathResource ("external/test4/peppol-bis-invoice-2026.5.ves"));

      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("un.unece.uncefact", "sbdh-xsd", "1.3"),
                    new ClassPathResource ("external/test4/sbdh-1.3.zip"));
      _addVES (aInMemoryRepo, new ClassPathResource ("external/test4/sbdh-1.3.ves"));

      _addResource (aInMemoryRepo,
                    DVRCoordinate.create ("org.peppol.bis3.sbdh-envelope", "envelope-rules", "2026.5"),
                    new ClassPathResource ("external/test4/PeppolBIS-Envelope-Rules.xslt"));
      _addVES (aInMemoryRepo, new ClassPathResource ("external/test4/peppol-sbdh-invoice-2026.5.ves"));
    }

    // No chain needed - use repo as is
    s_aRepoStorage = aInMemoryRepo;
  }

  @Test
  public void testPseudoVersionOldest ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:oldest"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:1", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatestReleaseActive ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:latest-release-active"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:2", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatestActive ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:latest-active"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:4-SNAPSHOT", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatestRelease ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:latest-release"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:3", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionLatest ()
  {
    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:latest"),
                                                                              aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test:test_sch:4-SNAPSHOT", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void testPseudoVersionActiveIgnoresDeprecated ()
  {
    final DVRCoordinate aLatest = DVRCoordinate.parseOrNull ("com.helger.phive.test5:xsd:latest");
    final DVRCoordinate aLatestActive = DVRCoordinate.parseOrNull ("com.helger.phive.test5:xsd:latest-active");
    final DVRCoordinate aLatestReleaseActive = DVRCoordinate.parseOrNull ("com.helger.phive.test5:xsd:latest-release-active");

    // Deprecated versions are considered by "latest"
    assertEquals ("com.helger.phive.test5:xsd:2",
                  VESLoaderPseudoVersionResolver.resolvePseudoVersion (s_aRepoStorage, aLatest, null, null)
                                                .getAsSingleID ());

    // 2.0 is deprecated, 1.1 is deprecated and expired
    assertEquals ("com.helger.phive.test5:xsd:1",
                  VESLoaderPseudoVersionResolver.resolvePseudoVersion (s_aRepoStorage, aLatestActive, null, null)
                                                .getAsSingleID ());
    assertEquals ("com.helger.phive.test5:xsd:1",
                  VESLoaderPseudoVersionResolver.resolvePseudoVersion (s_aRepoStorage,
                                                                       aLatestReleaseActive,
                                                                       null,
                                                                       null)
                                                .getAsSingleID ());

    // 1.1 is within its validity period at that point in time, but still deprecated
    final OffsetDateTime aCheckDT = PDTFactory.createOffsetDateTimeUTC (2023, Month.JUNE, 1);
    assertEquals ("com.helger.phive.test5:xsd:1",
                  VESLoaderPseudoVersionResolver.resolvePseudoVersion (s_aRepoStorage, aLatestActive, null, aCheckDT)
                                                .getAsSingleID ());

    final ErrorList aLoadingErrors = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (aLatestActive, aLoadingErrors);
    assertNotNull (aLoaded);
    assertEquals ("com.helger.phive.test5:xsd:1", aLoaded.getHeader ().getVESID ().getAsSingleID ());
  }

  @Test
  public void test1LoadXSD1 ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_xsd:1.0");
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
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (),
                aValidationResultList.get (0).getErrorList ().containsNoError ());
  }

  @Test
  public void test1LoadSCH1 ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:1.0");
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
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (),
                aValidationResultList.get (0).getErrorList ().containsNoError ());
  }

  @Test
  public void test1LoadSCH2Valid ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:2.0");
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
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (),
                aValidationResultList.get (0).getErrorList ().containsNoError ());
    assertTrue (aValidationResultList.get (1).getErrorList ().toString (),
                aValidationResultList.get (1).getErrorList ().containsNoError ());
  }

  @Test
  public void test1LoadSCH3Valid ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:3.0");
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
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (),
                aValidationResultList.get (0).getErrorList ().containsNoError ());
    assertTrue (aValidationResultList.get (1).getErrorList ().toString (),
                aValidationResultList.get (1).getErrorList ().containsNoError ());
    assertTrue (aValidationResultList.get (2).getErrorList ().toString (),
                aValidationResultList.get (2).getErrorList ().containsNoError ());
  }

  @Test
  public void testXsdStopOnErrorDefaultTrue ()
  {
    // No "stopOnError" attribute -> XSD validation type default is "stop"
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_xsd:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (aVESID, aErrorList);
    assertNotNull (aLoaded);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoaded.createVES ().getAllExecutors ();
    assertEquals (1, aExecutors.size ());
    assertTrue (aExecutors.get (0).isStopValidationOnError ());
  }

  @Test
  public void testXsdStopOnErrorOverrideFalse ()
  {
    // "stopOnError=false" overrides the XSD validation type default of "stop"
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_xsd_nostop:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (aVESID, aErrorList);
    assertNotNull (aLoaded);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoaded.createVES ().getAllExecutors ();
    assertEquals (1, aExecutors.size ());
    assertFalse (aExecutors.get (0).isStopValidationOnError ());
  }

  @Test
  public void testSchStopOnErrorDefaultFalse ()
  {
    // No "stopOnError" attribute -> Schematron validation type default is "continue"
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (aVESID, aErrorList);
    assertNotNull (aLoaded);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoaded.createVES ().getAllExecutors ();
    assertEquals (1, aExecutors.size ());
    assertFalse (aExecutors.get (0).isStopValidationOnError ());
  }

  @Test
  public void testSchStopOnErrorOverrideTrue ()
  {
    // "stopOnError=true" overrides the Schematron validation type default of "continue"
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch_stop:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (aVESID, aErrorList);
    assertNotNull (aLoaded);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());

    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoaded.createVES ().getAllExecutors ();
    assertEquals (1, aExecutors.size ());
    assertTrue (aExecutors.get (0).isStopValidationOnError ());
  }

  @NonNull
  private static ValidationResultList _validatePartial (@NonNull final String sType, @NonNull final String sParts)
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch_partial:1.0");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (null,
                                                                               DOMReader.readXMLDOM ("<envelope xmlns='urn:env' xmlns:a='urn:a'><header><type>" +
                                                                                                     sType +
                                                                                                     "</type></header>" +
                                                                                                     sParts +
                                                                                                     "</envelope>"));
    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList ret = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                          aVESID,
                                                                          aValidationSource,
                                                                          aErrorList).getValidationResultList ();
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());
    assertNotNull (ret);
    assertEquals (1, ret.size ());
    return ret;
  }

  @Test
  public void testSchPartial ()
  {
    final String sValidPart = "<a:root><a:a>Hallo</a:a></a:root>";
    final String sInvalidPart = "<a:root><a:b>Hallo</a:b></a:root>";

    // Executor is wrapped
    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch_partial:1.0"),
                                                                              aErrorList);
    assertNotNull (aLoaded);
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());
    final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoaded.createVES ().getAllExecutors ();
    assertEquals (1, aExecutors.size ());
    assertEquals (ValidationExecutorPartial.class, aExecutors.get (0).getClass ());
    // Schematron default is kept
    assertFalse (aExecutors.get (0).isStopValidationOnError ());

    // One valid part
    ValidationResultList aResults = _validatePartial ("a", sValidPart);
    assertTrue (aResults.getAllErrors ().toString (), aResults.containsNoError ());

    // Two parts, one invalid
    aResults = _validatePartial ("a", sValidPart + sInvalidPart);
    assertEquals (aResults.getAllErrors ().toString (), 1, aResults.getAllErrors ().size ());
    assertTrue (aResults.getAllErrors ().getFirstOrNull ().getErrorText (Locale.ROOT).contains ("'a' is missing"));

    // No part
    aResults = _validatePartial ("a", "");
    assertEquals (aResults.getAllErrors ().toString (), 1, aResults.getAllErrors ().size ());
    assertTrue (aResults.getAllErrors ().getFirstOrNull ().getErrorText (Locale.ROOT).contains ("minimum number"));

    // Too many parts
    aResults = _validatePartial ("a", sValidPart + sValidPart + sValidPart);
    assertEquals (aResults.getAllErrors ().toString (), 1, aResults.getAllErrors ().size ());
    assertTrue (aResults.getAllErrors ().getFirstOrNull ().getErrorText (Locale.ROOT).contains ("maximum number"));

    // Precondition not fulfilled
    aResults = _validatePartial ("b", sInvalidPart);
    assertTrue (aResults.get (0).getValidity ().isSkipped ());
    assertTrue (aResults.getAllErrors ().toString (), aResults.containsNoError ());
  }

  @Test
  public void testSchPartialInvalid ()
  {
    // min node count > max node count
    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).loadVESFromRepo (DVRCoordinate.parseOrNull ("com.helger.phive.test:test_sch_partial_invalid:1.0"),
                                                                              aErrorList);
    if (aLoaded != null)
      aLoaded.createVES ();
    assertTrue (aErrorList.toString (), aErrorList.containsAtLeastOneError ());
  }

  @NonNull
  private static String _readPeppolSbdh ()
  {
    return new String (StreamHelper.getAllBytes (new ClassPathResource ("external/test4/sbdh-base-example.xml")),
                       StandardCharsets.UTF_8);
  }

  @NonNull
  private static ValidationResultList _validatePeppolSbdh (@NonNull final String sXML)
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("org.peppol.bis3.sbdh-envelope:invoice:2026.5");
    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (null, DOMReader.readXMLDOM (sXML));
    assertNotNull (aValidationSource.getNode ());

    final ErrorList aErrorList = new ErrorList ();
    final ValidationResultList ret = VESLoader.loadVESAndApplyValidation (s_aRepoStorage,
                                                                          aVESID,
                                                                          aValidationSource,
                                                                          aErrorList).getValidationResultList ();
    assertEquals (aErrorList.toString (), 0, aErrorList.size ());
    assertNotNull (ret);
    return ret;
  }

  @Test
  public void test4PeppolSbdhStructure ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("org.peppol.bis3.sbdh-envelope:invoice:2026.5");
    for (final boolean bEager : new boolean [] { false, true })
    {
      final ErrorList aErrorList = new ErrorList ();
      final LoadedVES aLoaded = new VESLoader (s_aRepoStorage).setUseEagerRequirementLoading (bEager)
                                                              .loadVESFromRepo (aVESID, aErrorList);
      assertNotNull (aLoaded);
      assertEquals (aErrorList.toString (), 0, aErrorList.size ());
      assertEquals (1, aLoaded.getAllPartialRequires ().size ());

      // SBDH XSD, partial (UBL XSD, CEN, Peppol), envelope rules
      final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoaded.createVES ().getAllExecutors ();
      assertEquals (5, aExecutors.size ());
      assertEquals (ValidationExecutorXSD.class, aExecutors.get (0).getClass ());
      for (int i = 1; i <= 3; ++i)
        assertEquals (ValidationExecutorPartial.class, aExecutors.get (i).getClass ());
      assertEquals (ValidationExecutorXSD.class,
                    ((ValidationExecutorPartial) (IValidationExecutor <?>) aExecutors.get (1)).getWrappedExecutor ()
                                                                                              .getClass ());
      assertEquals (ValidationExecutorSchematron.class, aExecutors.get (4).getClass ());
    }
  }

  @Test
  public void test4PeppolSbdhValid ()
  {
    final ValidationResultList aResults = _validatePeppolSbdh (_readPeppolSbdh ());
    assertEquals (5, aResults.size ());
    assertTrue (aResults.getAllErrors ().toString (), aResults.containsNoError ());
    // All layers were executed
    for (int i = 0; i < aResults.size (); ++i)
      assertFalse (aResults.get (i).getValidity ().isSkipped ());
  }

  @Test
  public void test4PeppolSbdhReceiverMismatch ()
  {
    // Envelope rules
    final String sXML = _readPeppolSbdh ().replace (">0002:FR23342</Identifier>", ">0002:FR99999</Identifier>");
    final ErrorList aErrors = _validatePeppolSbdh (sXML).getAllErrors ();
    assertEquals (aErrors.toString (), 1, aErrors.size ());
    assertTrue (aErrors.toString (), aErrors.getFirstOrNull ().getErrorText (Locale.ROOT).contains ("[BR-SBDH-1]"));
  }

  @Test
  public void test4PeppolSbdhInvalidPayload ()
  {
    // Peppol BIS rules on the payload
    final String sXML = _readPeppolSbdh ().replaceAll ("<cbc:BuyerReference>[^<]*</cbc:BuyerReference>", "");
    final ErrorList aErrors = _validatePeppolSbdh (sXML).getAllErrors ();
    assertEquals (aErrors.toString (), 1, aErrors.size ());
    assertEquals (aErrors.toString (), "PEPPOL-EN16931-R003", aErrors.getFirstOrNull ().getErrorID ());
  }

  @Test
  public void test4PeppolSbdhPreconditionNotMet ()
  {
    // Not BIS Billing - the envelope rules are not applied
    final String sXML = _readPeppolSbdh ().replace ("poacc:billing:3.0</cbc:CustomizationID>",
                                                    "poacc:other:3.0</cbc:CustomizationID>");
    final ValidationResultList aResults = _validatePeppolSbdh (sXML);
    assertEquals (5, aResults.size ());
    assertFalse (aResults.get (3).getValidity ().isSkipped ());
    assertTrue (aResults.get (4).getValidity ().isSkipped ());
  }

  @Test
  public void test4PeppolSbdhInvalidPayloadXSD ()
  {
    // UBL XML Schema on the payload - stops the validation
    final String sXML = _readPeppolSbdh ().replace ("<cbc:BuyerReference>", "<cbc:Unknown/><cbc:BuyerReference>");
    final ValidationResultList aResults = _validatePeppolSbdh (sXML);
    assertTrue (aResults.get (0).getErrorList ().containsNoError ());
    assertTrue (aResults.get (1).getErrorList ().containsAtLeastOneError ());
    // Everything afterwards is skipped
    for (int i = 2; i < aResults.size (); ++i)
      assertTrue (aResults.get (i).getValidity ().isSkipped ());
  }

  @Test
  public void test4PeppolSbdhMissingEnvelope ()
  {
    // The business document without the envelope
    final String sSBDH = _readPeppolSbdh ();
    final String sXML = sSBDH.substring (sSBDH.indexOf ("<Invoice "),
                                         sSBDH.indexOf ("</Invoice>") + "</Invoice>".length ());
    final ValidationResultList aResults = _validatePeppolSbdh (sXML);
    // SBDH XML Schema fails and stops the validation
    assertTrue (aResults.get (0).getErrorList ().containsAtLeastOneError ());
    for (int i = 1; i < aResults.size (); ++i)
      assertTrue (aResults.get (i).getValidity ().isSkipped ());
  }

  @Test
  public void test2LoadXSD1 ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test2:test_xsd:1");
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
    assertTrue (aValidationResultList.get (0).getErrorList ().toString (),
                aValidationResultList.get (0).getErrorList ().containsNoError ());
  }

  @Test
  public void test3RecursiveXSDEager ()
  {
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test3:xsd1:1.0");

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
    final DVRCoordinate aVESID = DVRCoordinate.parseOrNull ("com.helger.phive.test3:xsd1:1.0");

    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES aLoadedVES = new VESLoader (s_aRepoStorage).setUseEagerRequirementLoading (false)
                                                               .loadVESFromRepo (aVESID, aErrorList);
    // Requirements are not yet loaded - so Loading so OK so far
    assertNotNull (aLoadedVES);

    final IValidationSourceXML aValidationSource = ValidationSourceXML.create (new ClassPathResource ("ves/test1/mini-valid.xml"));
    assertNotNull (aValidationSource.getNode ());

    final ValidationResultList aValidationResultList = new ValidationResultList (aValidationSource);
    // Should throw a VESLoadingException
    aLoadedVES.applyValidation (aValidationSource, aValidationResultList, Locale.US);
  }
}
