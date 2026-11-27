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
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.util.Locale;

import org.jspecify.annotations.NonNull;
import org.jspecify.annotations.Nullable;
import org.junit.BeforeClass;
import org.junit.Test;

import com.helger.annotation.Nonempty;
import com.helger.base.io.stream.StreamHelper;
import com.helger.collection.commons.ICommonsList;
import com.helger.diagnostics.error.level.EErrorLevel;
import com.helger.diagnostics.error.list.ErrorList;
import com.helger.diagnostics.error.list.IErrorList;
import com.helger.diver.api.coord.DVRCoordinate;
import com.helger.diver.repo.ERepoDeletable;
import com.helger.diver.repo.ERepoWritable;
import com.helger.diver.repo.RepoStorageContentByteArray;
import com.helger.diver.repo.RepoStorageKeyOfArtefact;
import com.helger.diver.repo.impl.RepoStorageInMemory;
import com.helger.diver.repo.toc.IRepoStorageWithToc;
import com.helger.io.resource.ClassPathResource;
import com.helger.phive.api.execute.ValidationExecutionManager;
import com.helger.phive.api.executor.IValidationExecutor;
import com.helger.phive.api.executorset.IValidationExecutorSet;
import com.helger.phive.api.executorset.ValidationExecutorSet;
import com.helger.phive.api.executorset.status.ValidationExecutorSetStatus;
import com.helger.phive.api.result.ValidationResult;
import com.helger.phive.api.result.ValidationResultList;
import com.helger.phive.api.source.IValidationSource;
import com.helger.phive.api.validity.IValidityDeterminator;
import com.helger.phive.xml.schematron.ValidationExecutorSchematron;
import com.helger.phive.xml.schematron.ValidationExecutorSchematronBuilder;
import com.helger.phive.xml.source.IValidationSourceXML;
import com.helger.phive.xml.source.ValidationSourceXML;
import com.helger.xml.serialize.read.DOMReader;

/**
 * Test class for {@link IVESRequirementResolver} and the usage in {@link VESLoader}.
 *
 * @author Philip Helger
 */
public final class VESRequirementResolverTest
{
  private static final String GROUP_ID = "com.helger.phive.test6";
  private static final DVRCoordinate BUILTIN_VESID = DVRCoordinate.parseOrNull ("com.helger.phive.builtin:sch:1.0");
  /** One 'a' without "Hallo": BI-01 and OWN-01 fail */
  private static final String XML_INVALID = "<root xmlns='urn:a'><a>ohne</a></root>";
  /** Two 'a' with "Hallo": everything is valid */
  private static final String XML_VALID = "<root xmlns='urn:a'><a>Hallo</a><a>Hallo 2</a></root>";

  private static IRepoStorageWithToc s_aRepo;
  private static ValidationExecutorSchematron s_aBuiltinExecutor;
  private static IValidationExecutorSet <IValidationSourceXML> s_aBuiltinVES;

  private static void _add (@NonNull final RepoStorageInMemory aRepo,
                            @NonNull @Nonempty final String sArtifactID,
                            @NonNull @Nonempty final String sFilename)
  {
    final String sFileExt = sFilename.substring (sFilename.lastIndexOf ('.'));
    final byte [] aData = StreamHelper.getAllBytes (new ClassPathResource ("ves/test6/" + sFilename));
    assertNotNull (aData);
    assertTrue (aRepo.write (RepoStorageKeyOfArtefact.of (DVRCoordinate.parseOrNull (GROUP_ID +
                                                                                     ":" +
                                                                                     sArtifactID +
                                                                                     ":1.0"), sFileExt),
                             RepoStorageContentByteArray.of (aData)).isSuccess ());
  }

  @BeforeClass
  public static void beforeClass ()
  {
    final RepoStorageInMemory aRepo = RepoStorageInMemory.createDefault ("unittest-test6",
                                                                         ERepoWritable.WITH_WRITE,
                                                                         ERepoDeletable.WITHOUT_DELETE);
    _add (aRepo, "own-sch", "own.sch");
    _add (aRepo, "builtin-sch", "builtin.sch");
    for (final String sName : new String [] { "requires-builtin",
                                              "requires-builtin-nostop",
                                              "requires-builtin-custom",
                                              "partial-requires-builtin",
                                              "requires-missing",
                                              "base",
                                              "derived" })
      _add (aRepo, sName, sName + VESLoader.FILE_EXT_VES);
    s_aRepo = aRepo;

    // The "built-in" rule set, that is not contained in the repository
    s_aBuiltinExecutor = ValidationExecutorSchematronBuilder.schIso (new ClassPathResource ("ves/test6/builtin.sch"))
                                                            .build ();
    s_aBuiltinVES = ValidationExecutorSet.create (BUILTIN_VESID,
                                                  "Built-in Schematron",
                                                  ValidationExecutorSetStatus.createValidNow (),
                                                  s_aBuiltinExecutor);
  }

  @NonNull
  private static IVESRequirementResolver _builtinResolver ()
  {
    return (aRequiredVES, aErrorList) -> BUILTIN_VESID.equals (aRequiredVES.getRequiredVESID ()) ? s_aBuiltinVES : null;
  }

  @Nullable
  private static LoadedVES _load (@NonNull @Nonempty final String sArtifactID,
                                  final boolean bEager,
                                  @Nullable final IVESRequirementResolver aResolver,
                                  @NonNull final ErrorList aErrorList)
  {
    return new VESLoader (s_aRepo).setUseEagerRequirementLoading (bEager)
                                  .setRequirementResolver (aResolver)
                                  .loadVESFromRepo (DVRCoordinate.parseOrNull (GROUP_ID + ":" + sArtifactID + ":1.0"),
                                                    aErrorList);
  }

  @NonNull
  private static LoadedVES _loadOK (@NonNull @Nonempty final String sArtifactID,
                                    final boolean bEager,
                                    @Nullable final IVESRequirementResolver aResolver)
  {
    final ErrorList aErrorList = new ErrorList ();
    final LoadedVES ret = _load (sArtifactID, bEager, aResolver, aErrorList);
    assertNotNull (aErrorList.toString (), ret);
    assertTrue (aErrorList.toString (), aErrorList.containsNoError ());
    return ret;
  }

  @NonNull
  private static ValidationResultList _validate (@NonNull final LoadedVES aLoadedVES, @NonNull final String sXML)
  {
    final IValidationSourceXML aSource = ValidationSourceXML.create (null, DOMReader.readXMLDOM (sXML));
    final ValidationResultList ret = new ValidationResultList (aSource);
    aLoadedVES.applyValidation (aSource, ret, Locale.ENGLISH);
    return ret;
  }

  private static boolean _containsError (@NonNull final ValidationResult aResult,
                                         @NonNull @Nonempty final String sErrorID,
                                         @NonNull final EErrorLevel eErrorLevel)
  {
    final IErrorList aErrorList = aResult.getErrorList ();
    return aErrorList.containsAny (x -> sErrorID.equals (x.getErrorID ()) && x.hasErrorLevel (eErrorLevel));
  }

  @Test
  public void testRequiresStopOnError ()
  {
    for (final boolean bEager : new boolean [] { true, false })
    {
      final LoadedVES aLoadedVES = _loadOK ("requires-builtin", bEager, _builtinResolver ());

      // The executor of the built-in set is used, the own one comes afterwards
      final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoadedVES.createVES ()
                                                                                          .getAllExecutors ();
      assertEquals (2, aExecutors.size ());
      // Stop on error is set on a clone
      assertTrue (aExecutors.get (0).isStopValidationOnError ());
      assertNotSame (s_aBuiltinExecutor, aExecutors.get (0));
      assertFalse (s_aBuiltinExecutor.isStopValidationOnError ());

      // The own rules are skipped, if the built-in rules fail
      ValidationResultList aResults = _validate (aLoadedVES, XML_INVALID);
      assertEquals (2, aResults.size ());
      assertTrue (aResults.get (0).getErrorList ().toString (),
                  _containsError (aResults.get (0), "BI-01", EErrorLevel.ERROR));
      assertTrue (aResults.get (1).getValidity ().isSkipped ());

      aResults = _validate (aLoadedVES, XML_VALID);
      assertEquals (2, aResults.size ());
      assertTrue (aResults.get (0).getErrorList ().containsNoError ());
      assertFalse (aResults.get (1).getValidity ().isSkipped ());
      assertTrue (aResults.get (1).getErrorList ().containsNoError ());
    }
  }

  @Test
  public void testRequiresContinueOnError ()
  {
    for (final boolean bEager : new boolean [] { true, false })
    {
      final LoadedVES aLoadedVES = _loadOK ("requires-builtin-nostop", bEager, _builtinResolver ());

      // The executor of the caller is used as is
      final ICommonsList <IValidationExecutor <IValidationSource>> aExecutors = aLoadedVES.createVES ()
                                                                                          .getAllExecutors ();
      assertEquals (2, aExecutors.size ());
      assertSame (s_aBuiltinExecutor, aExecutors.get (0));

      final ValidationResultList aResults = _validate (aLoadedVES, XML_INVALID);
      assertEquals (2, aResults.size ());
      assertTrue (_containsError (aResults.get (0), "BI-01", EErrorLevel.ERROR));
      assertFalse (aResults.get (1).getValidity ().isSkipped ());
      assertTrue (aResults.get (1).getErrorList ().toString (),
                  _containsError (aResults.get (1), "OWN-01", EErrorLevel.ERROR));
    }
  }

  @Test
  public void testRequiresCustomErrorLevels ()
  {
    for (final boolean bEager : new boolean [] { true, false })
    {
      final LoadedVES aLoadedVES = _loadOK ("requires-builtin-custom", bEager, _builtinResolver ());

      // BI-01 is only a warning, so the own rules are executed
      final ValidationResultList aResults = _validate (aLoadedVES, XML_INVALID);
      assertEquals (2, aResults.size ());
      assertTrue (aResults.get (0).getErrorList ().toString (),
                  _containsError (aResults.get (0), "BI-01", EErrorLevel.WARN));
      assertFalse (aResults.get (1).getValidity ().isSkipped ());
      assertTrue (_containsError (aResults.get (1), "OWN-01", EErrorLevel.ERROR));
    }

    // The executor of the caller is unchanged
    final IValidationSourceXML aSource = ValidationSourceXML.create (null, DOMReader.readXMLDOM (XML_INVALID));
    final ValidationResultList aResults = ValidationExecutionManager.executeValidation (IValidityDeterminator.createDefault (),
                                                                                        s_aBuiltinVES,
                                                                                        aSource);
    assertTrue (_containsError (aResults.get (0), "BI-01", EErrorLevel.ERROR));
  }

  @Test
  public void testPartialRequires ()
  {
    for (final boolean bEager : new boolean [] { true, false })
    {
      final LoadedVES aLoadedVES = _loadOK ("partial-requires-builtin", bEager, _builtinResolver ());

      // The built-in rules are applied on the part only
      ValidationResultList aResults = _validate (aLoadedVES,
                                                 "<envelope xmlns='urn:env'>" + XML_INVALID + "</envelope>");
      assertEquals (2, aResults.size ());
      assertTrue (aResults.get (0).getErrorList ().toString (),
                  _containsError (aResults.get (0), "BI-01", EErrorLevel.ERROR));
      // Partial requirements stop on error by default
      assertTrue (aResults.get (1).getValidity ().isSkipped ());

      aResults = _validate (aLoadedVES, "<envelope xmlns='urn:env'>" + XML_VALID + "</envelope>");
      assertEquals (2, aResults.size ());
      assertTrue (aResults.get (0).getErrorList ().toString (), aResults.get (0).getErrorList ().containsNoError ());
      assertFalse (aResults.get (1).getValidity ().isSkipped ());
    }
  }

  @Test
  public void testNotResolved ()
  {
    // Eager: loading fails
    final ErrorList aErrorList = new ErrorList ();
    assertNull (_load ("requires-missing", true, _builtinResolver (), aErrorList));
    assertTrue (aErrorList.toString (),
                aErrorList.toString ()
                          .contains ("is neither contained in the repository nor could it be resolved by the requirement resolver"));

    // Lazy: using it fails
    final LoadedVES aLoadedVES = _loadOK ("requires-missing", false, _builtinResolver ());
    try
    {
      aLoadedVES.createVES ();
      fail ();
    }
    catch (final VESLoadingException ex)
    {
      assertTrue (ex.getMessage (), ex.getMessage ().contains ("is neither contained in the repository"));
    }
  }

  @Test
  public void testNoResolver ()
  {
    // Without a resolver only the repository is used
    final ErrorList aErrorList = new ErrorList ();
    assertNull (_load ("requires-builtin", true, null, aErrorList));
    assertTrue (aErrorList.toString (),
                aErrorList.toString ().contains ("Failed to resolve provided VES from repository"));
  }

  @Test
  public void testRepositoryHasPrecedence ()
  {
    final IVESRequirementResolver aResolver = (aRequiredVES, aErrorList) -> {
      fail ("The resolver must not be called for '" + aRequiredVES.getRequiredVESID ().getAsSingleID () + "'");
      return null;
    };
    for (final boolean bEager : new boolean [] { true, false })
    {
      final LoadedVES aLoadedVES = _loadOK ("derived", bEager, aResolver);

      // The required VES from the repository stops on error as well: OWN-01 fails, so the rules of
      // "derived" are skipped
      ValidationResultList aResults = _validate (aLoadedVES, "<root xmlns='urn:a'><a>Hallo</a></root>");
      assertEquals (2, aResults.size ());
      assertTrue (_containsError (aResults.get (0), "OWN-01", EErrorLevel.ERROR));
      assertTrue (aResults.get (1).getValidity ().isSkipped ());

      aResults = _validate (aLoadedVES, XML_VALID);
      assertEquals (2, aResults.size ());
      assertTrue (aResults.get (0).getErrorList ().containsNoError ());
      assertFalse (aResults.get (1).getValidity ().isSkipped ());
      assertTrue (aResults.get (1).getErrorList ().containsNoError ());
    }
  }
}
