# PHIVE - Integrative Validation Engine

[![javadoc](https://javadoc.io/badge2/com.helger.phive/phive-ves-engine/javadoc.svg)](https://javadoc.io/doc/com.helger.phive/phive-ves-engine)
[![Maven Central](https://maven-badges.herokuapp.com/maven-central/com.helger.phive/phive-parent-pom/badge.svg)](https://maven-badges.herokuapp.com/maven-central/com.helger.phive/phive-parent-pom) 

A generic business document validation engine originally developed for Peppol but now also supporting many other document types.

"phive" is an abbreviation of "Philip Helger Integrative Validation Engine" and is pronounced exactly like the digit 5: `[ˈfaɪv]`.

This project only contains the validation **engine** - all the preconfigured rules are available in a separate repository at https://github.com/phax/phive-rules

This project is part of my Peppol solution stack. See https://github.com/phax/peppol for other components and libraries in that area.

This project is licensed under the Apache 2 license.

A live version of this engine can be found on [Peppol Practical](http://peppol.helger.com/public/menuitem-validation-upload) and at [ecosio](https://ecosio.com/en/peppol-and-xml-document-validator/).

This project has the following sub-modules:
* **`phive-api`** - a generic API that is independent of the effective validation logic. It contains the interfaces for validation sources, validation artefacts, validation execution and validation results.
* **`phive-ves-model`** - contains the XML representation of a *VES*, a Validation Execution Set. 
* **`phive-xml`** (previously `phive-engine`) - contains the support for validating XML source document via XML Schema and Schematron 
* **`phive-ves-engine`** - the validation engine that takes the data structures from `phive-ves-model`, loads external resources via [ph-diver](https://github.com/phax/ph-diver) and validates business documents via `phive-xml`.
* **`phive-result`** (previously `phive-json`) - library to support converting validation results to different output formats (e.g. JSON)

Note: this library does NOT include an EDIFACT validation. It's a placeholder for local implementations.

Note: please see [README v5](docs/READMEv5.md), [README v6](docs/READMEv6.md) and [README v7/v8](docs/READMEv8.md) for previous documentation.

# Usage guide

Basically this library wraps different XML Schemas and Schematrons in a certain order and under certain constraints and offers the possibility to validate XML documents based on the rules.

The underlying model is the so called "Validation Pyramid":
![Validation Pyramid](https://github.com/phax/phive/blob/master/docs/validation-pyramid.png?raw=true)

Each layer of the Validation Pyramid reflects a single set of rules. 
  Each rule set is identified by a VESID, and the resulting pyramid is also identified by a single ID.

## Validation executor set identification

Every set of validation artefacts is uniquely identified with a **VESID** which is a [DVR Coordinate](https://github.com/phax/ph-diver?tab=readme-ov-file#dvr-coordinate).
E.g. the "Peppol BIS Billing UBL Invoice release May 2023" is identified with the group ID `eu.peppol.bis3`, the artefact ID is `invoice` and the version number is `2023.5` (representing "May 2023") (without a classifier).
Another example is "SimplerInvoicing 1.2 invoice" which has the group ID `org.simplerinvoicing`, the artifact ID `invoice` and the version number `1.2` (also without a classifier).

### Additional Pseudo Versions

Additional to the pseudo versions defined by [ph-diver](https://github.com/phax/ph-diver?tab=readme-ov-file#dvr-pseudo-versions) this library adds the following additional pseudo versions:
* `latest-active` - always refer to the latest version of an artefact which is currently valid. This includes snapshot and non-snapshot versions.
* `latest-release-active` - always refer to the latest version of an artefact which is currently valid. This includes snapshot and non-snapshot versions.

Note: These pseudo versions are defined in class `PhivePseudoVersionRegistrarSPIImpl`.

## How to validate documents with programmatic rules

At least the `phive-xml` project and one library with rule sets (like e.g. `phive-rules-peppol` from https://github.com/phax/phive-rules) 
  is needed in your application. See the section on usage in a Maven project below.
All available VES must be registered in an instance of class `ValidationExecutorSetRegistry` (which can simply created via `new`).
Depending on the used domain specific libraries, initialization calls for registration into the registry must be performed.
Example for registering (only) Peppol validation artefacts:

```java
final ValidationExecutorSetRegistry <IValidationSourceXML> aVESRegistry = new ValidationExecutorSetRegistry<> ();
PeppolValidation.initStandard (aVESRegistry);
```

The instance of class `ValidationExecutorSetRegistry` can be kept as a (static) singleton - it is thread-safe.
Therefore the registration process need to be performed only once.

Validating a business document requires a few more steps.
1. Access to the registry is needed.
1. A specific `VESID` instance (e.g. `PeppolValidation2024_05.VID_OPENPEPPOL_INVOICE_UBL_V3` - from `phive-rules`) - there are constants available for all VES identifiers defined in this project.
1. The `ValidationExecutionManager` is an in-between class that can be used to customize the execution. But it is created very quickly, so there is no harm on creating it on the fly every time.
1. An instance of class `ValidationSourceXML` to identify the document to be validate. Class `ValidationSourceXML` has factory methods for the default cases (having an `org.w3c.dom.Node` or having an `com.helger.commons.io.resource.IReadableResource`).
1. The validation results are stored in an instance of class `ValidationResultList`. This class is a list of `ValidationResult` instances - each `ValidationResult` represents the result of a single level of validation.
1. Your application logic than needs to define what to do with the results. 


A basic example can be found in the tests at https://github.com/phax/phive/blob/master/phive-xml/src/test/java/com/helger/phive/api/execute/ValidationExecutionManagerFuncTest.java

## How to validate documents with declarative rules

TODO The description of this section needs to be written. Please have patience until everything is ready and setup.

# Maven usage

Add the following to your `pom.xml` to use this artifact, replacing `x.y.z` with the latest version:

```xml
<dependency>
  <groupId>com.helger.phive</groupId>
  <artifactId>phive-xml</artifactId>
  <version>x.y.z</version>
</dependency>
```

If you are interested in the validation result transformation you need to also include this artefact.  

```xml
<dependency>
  <groupId>com.helger.phive</groupId>
  <artifactId>phive-result</artifactId>
  <version>x.y.z</version>
</dependency>
```

Alternate usage as a Maven BOM:

```xml
<dependency>
  <groupId>com.helger.phive</groupId>
  <artifactId>phive-parent-pom</artifactId>
  <version>x.y.z</version>
  <type>pom</type>
  <scope>import</scope>
</dependency>
```

## Potential issues

Please ensure that your stack size is at least 1MB (for Saxon).
Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line.
This only seems to be a problem when running 32bit Java.
With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

# News and noteworthy

* v10.1.1 - 2025-03-03
    * Added new classes `IGenericPseudoVersionResolver` and `DefaultGenericPseudoVersionResolver`
    * Fixed invalid return codes for `ValidationResultList.containsNo(Failure|Error)` for empty lists
* v10.1.0 - 2024-12-05
    * Requires ph-commons 11.1.11
    * Added new interface `IValidationExecutorSetMutable`
    * Added new class `ValidationExecutorSetAlias` to be able to proxy existing VES with different coordinates
    * Added new class `ValidityDeterminatorRegistry` to support validity determination processes
    * Added optional `IValidationSource` to `ValidationResultList`
    * Changed parameter types in `PhiveJsonHelper` and `PhiveXMLHelper` from `List <? extends ValidationResult>` to `ValidationResultList`
    * Added new class `ValidationSourceXMLReadableResource`
    * Extended `IValidationSource` interface to make content serializable
    * Added the duration in milliseconds per `ValidationResult`
    * Updated the default JSON and XML validation result list serialization to contain the new elements
* v10.0.3 - 2024-12-01
    * Added default XML serialization of validation results
    * Added new `EValidationBaseType` entries
* v10.0.2 - 2024-09-16
    * Re-release due to Maven Central issue
* v10.0.1 - 2024-09-16
    * Fixed the validation types in `ValidationExecutorXSDPartial.create`
* v10.0.0 - 2024-09-16
    * Updated to ph-diver 3.0.1
    * The outcome of a validation can now be `valid`, `invalid` or `unclear` (new)
        * Added new classes `EExtendedValidity` and `IValidityDeterminator`
        * Each `IValidationExecutorManager` now has an `IValidityDeterminator`
        * By using `IValidityDeterminator.getDefault()` the previous state can be re-created
    * Renamed method `IValidationArtefact.getValidationArtefactType` to `getValidationType`
    * Moved classes `(Abstract|I)ValidationExecutor` to its own `.executor` package
    * Renamed class `TestFile` to `PhiveTestFile`
* v9.2.2 - 2024-07-29
    * Switched from custom error level to `CustomErrorDetails`
* v9.2.1 - 2024-04-25
    * Updated to ph-diver 1.2.0
    * Added support for the pseudo version resolution in `VESLoader.loadVESFromRepo`
    * The `VESLoader` now requires a `IRepoStorageWithToc` instead of a `IRepoStorageBase` in the constructor
    * Added support for new pseudo versions `latest-active` and `latest-release-active`
* v9.2.0 - 2024-03-29
    * Updated to ph-commons 11.1.5
    * Ensured Java 21 compatibility
    * Extended the VES status XSD with new optional elements
    * Introducing `[I]ValidationExecutorSetStatus` representing the status of a single Validation Executor Set
* v9.1.0 - 2024-03-09
    * Updated to ph-schematron 8.0.0 using Saxon 12.x
    * Updated to ph-diver 1.1.0
    * Improved dynamic VES loading heavily
* v9.0.0 - 2023-09-14
    * Moved class `PhiveRestoredException` into a separate package
    * Using the class `VESID` etc. from `ph-diver-api` instead
    * Replaced the `phive-repo` with `ph-diver-repo` instead
    * Moved classes `[I]ValidationSourceBinary` from `phive-xml` to `phive-api`
    * Renamed class `MockFile` to `TestFile`
* v9.0.0-beta2 - 2023-09-06 [don't use in production]
    * Reworked the version handling inside class `VESID` so that a strict ordering by version is possible
    * Added specific support for the `SNAPSHOT` version, so that `1.0.0-SNAPSHOT` is lower then `1.0.0`
* v9.0.0-beta1 - 2023-08-30 [don't use in production]
    * Removed `VOM*` in favour of `VES*`
    * Added new submodule "phive-repo" to be able to retrieve artefacts from remote storage locations
    * Added new submodule "phive-ves-model" that contain the VES data structures
    * Added new submodule "phive-ves-engine" that contain the VES execution engine
    * Renamed the submodule "phive-engine" to "phive-xml" to indicate, that this is the part dealing with XML validation only. This also lead to new package names.
    * Renamed the submodule "phive-json" to "phive-result" to indicate, that this is deals with validation results in general. The JSON stuff got its own package in there.
    * Initial version for declaration VES rules for XSD and Schematron
* v8.0.1 - 2023-03-17
    * Added support for resolving the pseudo version `latest` in `ValidationExecutorSetRegistry`. See [issue #16](https://github.com/phax/phive/issues/16) - thx @adammscisz
* v8.0.0 - 2023-02-19
    * Using Java 11 as the baseline
    * Updated to ph-commons 11
    * Updated to JAXB 4.0
* v7.2.4 - 2022-08-17
    * Updated to ph-commons 10.1.7
    * Added support for the error date time serialization to JSON and back
* v7.2.3 - 2022-02-24
    * Increased the flexibility of the Json output providers
* v7.2.2 - 2021-11-05
    * Stopping further validations, if an error occurs on XSD level
* v7.2.1 - 2021-06-09
    * Started introduction of the new VOM - Validation Object Model - an XML based approach for validation configuration
* v7.2.0 - 2021-03-22
    * Updated to ph-commons 10
    * Added new class `ValidationSourceBinary`
* v7.1.1 - 2021-01-28
    * Extended the internal API to ensure validation artifacts are in cache
* v7.1.0 - 2021-01-26
    * Extracted the interface `IValidationType` from `EValidationType` and using it where applicable
* v7.0.1 - 2020-12-04
    * Updated to ph-schematron 6.0.1
    * The failed assertion ID is now part of the created errors (if present)
    * Add the possibility to change the error levels of occurred Schematron errors
* v7.0.0 - 2020-11-25
    * The Maven group ID changed from `com.helger.bdve` to `com.helger.phive`
    * The Java package names changed from `com.helger.bdve.*` to `com.helger.phive.*`
    * The class name `BDVEJsonHelper` changed to `PhiveJsonHelper`
    * The class name `BDVERestoredException` changed to `PhiveRestoredException`
    * Updated to ph-schematron 6.0.0
    * Added support for using "SchXslt" as a Schematron engine
* v6.0.4 - 2020-11-11
    * Added new overloads for `ValidationExecutorXSD.create`
    * Added `IValidationArtefact.getRuleResourcePath ()` to customize the file path
    * Added `ValidationExecutorXSDPartial.create` factory methods
    * Added `XSDPartialContext.create` factory methods
    * Added `ValidationExecutorSchematron.create` factory methods
* v6.0.3 - 2020-09-17
    * Updated to Jakarta JAXB 2.3.3
* v6.0.2 - 2020-06-16
    * Fixed a typo in the JSON property `errorLocationObj`
* v6.0.1 - 2020-06-16
    * Extended `ValidationExecutorSetRegistry` API to allow for unregistration
* v6.0.0 - 2020-06-08
    * Separated all the rules into a separate project - https://github.com/phax/ph-bdve-rules - this repository only contains the engine
    * Extracted the JSON binding into a separate submodule "ph-bdve-json"
    * Extracted the generic API project into a separate submodule "ph-bdve-api"
    * Made the validation source type a generics parameter to the executor set etc. So an executor needs to know, whether it can accept XML sources or other kind of source syntaxes.
    * Extracted `IValidationSourceXML` from `IValidationSource`
    * Renamed `ValidationSource` from `ValidationSourceXML`
* v5.3.1 - 2020-05-28
    * Added possibility to stop further validation on failed Schematrons as well
* v5.3.0 - 2020-05-26
    * Changed the Maven groupId to `com.helger.bdve`
    * Renamed the submodule `ph-bdve` to `ph-bdve-engine`
    * Updated to ph-commons 9.4.4
    * Removed the class loader member from `IValidationArtifact`
    * Deprecated Peppol 3.9.0 and 3.9.1 artefacts - 3.10.0 is the right one
    * Added support for EN 16931 1.3.2 format (deprecated version 1.3.1)
* v5.2.11 - 2020-05-01
    * Updated to ph-commons 9.4.0
    * Added support for ebInterface 6.0
    * Added support for OpenPeppol validation artifacts, Spring 2020 release 
* v5.2.10 - 2020-03-20
    * The Peppol AU-NZ rules were updated to v1.0.2. v1.0.1 is now deprecated.
* v5.2.9 - 2020-03-18
    * Fixed usage of wrong Peppol AU-NZ Schematrons for v1.0.1. See [issue #12](https://github.com/phax/phive/issues/12)
* v5.2.8 - 2020-03-12
    * Added support for UBL.BE 1.2 (version 2020-03)
    * Deprecated OpenPeppol 3.7.0 rules (for BIS v2)
* v5.2.7 - 2020-03-08
    * Deprecated `eu.cen.en16931:edifact:1.0.0` as it is not maintained anymore
    * Extended validation API
    * Added support for EN 16931 1.3.1 format (deprecated version 1.3.0)
* v5.2.6 - 2020-02-10
    * Updated the UBL 2.3 identifiers from "csprd01" to "csprd02"
    * Added Peppol BIS 3 billing Hotfix from 2020-02-10 (BR-S-08 for standard VAT, BR-IG-08 for Canary Islands tax, BR-IP-08 for Ceuta and Melilla tax) as Peppol rules 3.9.1
    * Updated to the EHF G2 rules from 2019-12
* v5.2.5 - 2020-02-06
    * Added a default JSON representation for validation results - see class `BDVEJsonHelper`
    * Added support for UBL.BE 1.1 (version 2019-11)
    * Deprecated UBL.BE 1.0, e-FFF Invoice and e-FFF Credit Note validations
    * Updated to UBL 2.3 CSPRD 02 (without changing the ID :( )
* v5.2.4 - 2020-01-13
    * Added support for XRechnung 1.2.2 format (deprecated version 1.2.1)
* v5.2.3 - 2019-12-18
    * Added Singapore (SG) Peppol Billing BIS3 rules version 1.0.2
* v5.2.2 - 2019-12-12
    * Added SimplerInvoicing 2.0.2 and deprecated version 2.0.1
* v5.2.1 - 2019-12-09
    * Added SimplerInvoicing 2.0.1 and deprecated version 2.0
* v5.2.0 - 2019-11-29
    * The Peppol AU-NZ rules were updated. The old version is now the official "1.0.0" whereas the new rules are "1.0.1". Confusing, I know :-|
    * Updated to ph-schematron 5.4.0 (incompatible change)
* v5.1.15 - 2019-11-15
    * Added support for UBL 2.3 CSPRD01
    * Updated Peppol-SG rules to the latest version
    * Deprecated OpenPeppol 3.8.1 rules
* v5.1.14 - 2019-11-01
    * Added support for A-NZ Peppol 1.0.1 validations
    * Added OpenPEPPOL 3.9.0 (Fall release 2019) artefacts
* v5.1.13 - 2019-10-14
    * Added support for EN 16931 1.3.0 format (deprecated version 1.2.3)
    * Updated Singapore (SG) Peppol Billing BIS3 rules to version 2019-06-12
* v5.1.12 - 2019-09-09
    * Deprecated OpenPEPPOL 3.8.0 artefacts
    * XRechnung 1.2.1 is now based on EN16931 1.2.1 release
* v5.1.11 - 2019-07-21
    * Added OpenPEPPOL 3.8.1 (Spring release 2019 bug fix release) artefacts
    * Updated SimplerInvoicing artefacts to the latest versions. This lead to "SI 1.1 strict" to be removed.
* v5.1.10 - 2019-07-10
    * Added new EHF validation artefacts (incl. Invoice and Credit Note 2.0.16)
    * Deprecated `eu.peppol.bis3.ubl:invoice:1` in favour of `eu.peppol.bis3:invoice:3.8.0` 
    * Deprecated `eu.peppol.bis3.ubl:creditnote:1` in favour of `eu.peppol.bis3:creditnote:3.8.0` 
    * Added support for XRechnung 1.2.1 format (deprecated version 1.2.0)
    * Added support for EN 16931 1.2.3 format (deprecated version 1.2.1)
* v5.1.9 - 2019-06-10
    * Fixed an error in `EHF-UBL-COMMON.sch` of November 2018 release
    * Fixed an error in `EHF-UBL-T19.sch` of November 2018 release
    * Added support for XRechnung 1.2.0 format
* v5.1.8 - 2019-05-15
    * Added Peppol 3.8.0 (Spring 2019 release) validation artefacts (BIS v3 only)
* v5.1.7 - 2019-05-14
    * Added EN 16931 validation artefacts version 1.2.1, deprecated the old 1.2.0 version
    * Internally restructured EHF layout for future extension
* v5.1.6 - 2019-04-26
    * Added EN 16931 validation artefacts version 1.2.0, deprecated the old 1.1.0 version
* v5.1.5 - 2019-04-19
    * Updated OIOUBL validation rules to the latest version
    * Updated SimplerInvoicing 2.0 RC1 to 2.0 final release
    * Added support for Dutch Energie eFactuur 3.0.0 (based on SimplerInvoicing 2.0)
* v5.1.4 - 2019-03-21
    * EHF validation without "OPENPEPPOL CORE" rules
    * Fixed an error in the created XSLTs for ATNAT/ATGOV T10 and T14 because of variable order as well as a spelling error
* v5.1.3 - 2019-03-08
    * Updated to latest EHF releases (Invoice and Credit Note 2.0.15 etc.)
    * EHF validation now directly depends on the Peppol Validation artefacts
* v5.1.2 - 2019-02-04
    * Added SimplerInvoicing 2.0 RC1 support [#3](https://github.com/phax/phive/issues/3)
    * Added Singapore (SG) Peppol Billing BIS3 support [#4](https://github.com/phax/phive/issues/4)
* v5.1.1 - 2019-01-16
    * Added UBL.BE 1.0.0 Schematrons
* v5.1.0 - 2018-11-23
    * Requires ph-commons 9.2.0
    * Added support for OpenPEPPOL 3.7.0 (Fall 2018) rules (incl. Billing BIS3)
    * Removed support for OpenPEPPOL 3.4.0 rules
* v5.0.6 - 2018-11-09
    * Fixed an error in the UBL.BE document types. In reality those are e-FFF 3.0 document types. VESID changed therefore.
* v5.0.5 - 2018-11-07
    * Requires at least ph-commons 9.1.8
    * Added support for UBL.BE document types
    * Added support for OpenPEPPOL 3.7.0.RC1 (Fall 2018) rules (incl. Billing BIS3)
* v5.0.4 - 2018-08-14
    * Added support for UBL 2.0 XSD validation
    * Added support for UBL 2.2 XSD validation
* v5.0.3 - 2018-07-11
    * Updated EHF rules to 2018-02-20 
* v5.0.2 - 2018-06-26
    * Added EN 16931 validation artefacts version 1.1.0, deprecated the old 1.0.0 version
* v5.0.1 - 2018-06-15
    * Fixed marking of OpenPEPPOL 3.5.0 artefatcs as "deprecated"
    * Added support for Peppol Billing BIS 3 document types
    * Added support for EN 16931 UBL CreditNote validation
* v5.0.0 - 2018-06-01
    * Added Tieto TEAPPSXML support
    * Added Austrian ebInterface support
    * Simplified internal API backwards incompatible (removed all the bloat overhead where possible)
* v4.0.5 - 2018-05-14
    * Support for OpenPEPPOL rules 3.3.0 was removed - too old
    * Updated to OpenPEPPOL 3.6.0 (Spring 2018) rules
* v4.0.4 - 2018-02-22
    * Updated to EN 16931 rules 1.0.0
    * Added support for Dutch Energie eFactuur 1.0.0 (based on SimplerInvoicing 1.1)
    * Added support for Dutch Energie eFactuur 1.0.1 (based on SimplerInvoicing 1.1)
* v4.0.3 - 2018-02-07
    * Added OIOUBL 2.0.2 support (new artefact `ph-bdve-oioubl`)
    * EN 16031 rules were updated
* v4.0.2 - 2018-02-03
    * Added support for Dutch Energie eFactuur 2.0.0 (new artefact `ph-bdve-energieefactuur`) - based on SimplerInvoicing 1.2 
    * Updated to ph-commons 9.0.1 (Locale specific XSD error messages)
    * Schematron error messages are more easily readable
    * EN 16031 rules were updated
    * CII validation was heavily improved
* v4.0.1 - 2018-01-23
    * Added support for EHF document formats (new artefact `ph-bdve-ehf`) - based on https://vefa.difi.no/ehf/standard/
    * Added support to validate UBL documents only (without Schematron) (new artefact `ph-bdve-ubl`)
    * Added support to validate CII documents only (without Schematron) (new artefact `ph-bdve-cii`)
    * Extended API to support better cleanup
* v4.0.0 - 2018-01-15
    * Updated to ph-commons 9.0.0
    * Updated to the latest official EN-16931 rules
    * Updated to the Peppol Autumn 2017 release (3.5.0)
* v3.2.0 - 2017-07-27
    * Improved ClassLoader handling, so that each validation artefact has a defined class loader. 
* v3.1.4 - 2017-07-12
    * Fixed an error where warnings in Schematron validation lead to not evaluating the SVRL
* v3.1.3 - 2017-06-07
    * Re-release because v3.1.2 had issues with Maven Central deployment
* v3.1.2 - 2017-06-06
    * Fixed a problem with XSLT based validation when using anything different from a DOM Document as the validation source 
* v3.1.1 - 2017-06-01
    * Re-added SimplerInvoicing 1.1 rules
    * Enabled Schematron caching by default
    * Improved caching API
* v3.1.0 - 2017-05-15
    * Added EN 16931 rules
    * Update to OpenPEPPOL 3.4.0 rules
    * Update to SimplerInvoicing 1.2 rules
    * Updated to ph-schematron 4.3.0
* v3.0.0 - 2017-01-26
    * Is a complete rewrite with different structure etc.
    * Binds to ph-commons 8.6.x
    * Requires at least ph-schematron 4.2.1
* v2.0.1 - 2016-09-12
    * Binds to ph-commons 8.5.x
* v2.0.0 - 2016-08-22
    * Requires JDK 8

---

My personal [Coding Styleguide](https://github.com/phax/meta/blob/master/CodingStyleguide.md) |
It is appreciated if you star the GitHub project if you like it.