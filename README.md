# ph-bdve

A generic document validation engine originally developed for PEPPOL but now also supporting other document types.

This project is divided into sub-projects each keeping tracking of one document type set:
  * ph-bdve - generic "Business Document Validation Engine"
  * ph-bdve-cii - Validation rules for pure CII (without any Schematron) - since 4.0.1
  * ph-bdve-ebinterface - Validation rules for Austrian ebInterface - since 5.0.0
  * ph-bdve-ehf - Validation rules for EHF (Norwegian public procurement) - since 4.0.1
  * ph-bdve-en16931 - Validation rules for the EN 16931 (European e-Invoicing norm based on CEN TC 434)
  * ph-bdve-energieefactuur - Validation rules for Dutch Energie eFactuur - since 4.0.2
  * ph-bdve-oioubl - Validation rules for Danish OIOUBL - since 4.0.3
  * ph-bdve-peppol - the Peppol specific setup etc
  * ph-bdve-simplerinvoicing - Dutch SimplerInvoicing 1.x support from https://github.com/SimplerInvoicing/validation
  * ph-bdve-teapps - Validation rules for Tieto TEAPPSXML - since 5.0.0
  * ph-bdve-ubl - Validation rules for pure UBL (without any Schematron) - since 4.0.1
  * ph-bdve-ublbe - Validation rules for e-FFF/UBL.BE - since 5.0.5
  * ph-bdve-xrechnung - Validation rules for German XRechnung - since 5.1.9

A running example can be found on [Peppol Practical](http://peppol.helger.com/public/menuitem-validation-upload).

Licensed under the Apache 2 license.

# Usage guide

Basically this library wraps different XML Schemas and Schematrons and offers the possibility to validate XML documents based on the rules.

## Validation executor set identification

Every set of validation artefacts is uniquely identified based on a structure that is similar to [Maven coordinates](https://maven.apache.org/pom.html#Maven_Coordinates). The identifier for a set of validation artefacts is a so called "VESID" ("Validation Executor Set ID"). Each VESID consists of a mandatory group ID, a mandatory artefact ID, a mandatory version number (ideally following the semantic versioning principles) and an optional classifier.
E.g. the "PEPPOL Invoice Fall release 2018" is identified with the group ID `eu.peppol.bis2`, the artefact ID is `t10` (based on "transaction 10" from CEN BII - historical reasons...), the version number is `3.7.0` (representing "Fall 2018") and no classifier is present.
Another example is "SimplerInvoicing 1.2 invoice" which has the group ID `org.simplerinvoicing`, the artifact ID `invoice` and the version number `1.2` (also without a classifier).

Each VESID can be represented in a single string in the form `groupID:artifiactID:version[:classifier]`. Neither group ID, nor artifact ID, nor version number, nor classifier may contain the colon (':') character, any bracket character ('<' and '>') nor any other character forbidden in filenames in any OS.

## How to validate documents

At least the `ph-bdve` project and one of the domain specific projects (like e.g. `ph-bdve-peppol`) is needed in your application. See the section on usage in a Maven project below.
All available VES must be registered in an instance of class `ValidationExecutorSetRegistry` (which can simply created via `new`).
Depending on the used domain specific libraries, initialization calls for registration into the registry must be performed.
Example for registering (only) PEPPOL validation artefacts:

```java
    final ValidationExecutorSetRegistry aVESRegistry = new ValidationExecutorSetRegistry ();
    PeppolValidation.initStandard (aVESRegistry);
    PeppolValidation.initThirdParty (aVESRegistry);
    return aVESRegistry;
```

The instance of class `ValidationExecutorSetRegistry` can be kept as a singleton - it is thread-safe.
Therefore the registration process need to be performed only once.

Validating a business document requires a few more steps.
1. Access to the registry is needed.
1. A specific `VESID` instance (e.g. `PeppolValidation370.VID_OPENPEPPOL_T10_V2`) - there are constants available for all VES identifiers defined in this project.
1. The `ValidationExecutionManager` is an in-between class that can be used to customize the execution (e.g. setting a class loader). But it is created very quickly, so there is no harm on creating it on the fly every time.
1. An instance of class `ValidationSource` to identify the document to be validate. Class `ValidationSource` has factory methods for the default cases (having an `org.w3c.dom.Node` or having an `com.helger.commons.io.resource.IReadableResource`).
1. The validation results are stored in an instance of class `ValidationResultList`. This class is a list of `ValidationResult` instances - each `ValidationResult` represents the result of a single level of validation.
1. Your application logic than needs to define what to do with the results. 


```java
    final IValidationExecutorSet aVES = VESRegistry.getOfID (aVESID);
    if (aVES != null) {
      final ValidationExecutionManager aVEM = aVES.createExecutionManager ();
      // What to validate?
      ValidationSource aValidationSource = ...;
      final ValidationResultList aValidationResult = aVEM.executeValidation (aValidationSource);
      if (aValidationResult.containsAtLeastOneError ()) {
        // errors found ...
      } else {
        // no errors (but maybe warnings) found
      }                                                                       
    }                                                                             
```

# Maven usage

Add the following to your `pom.xml` to use this artifact:

```xml
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-peppol</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-en16931</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-simplerinvoicing</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ubl</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-cii</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ehf</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-energieefactuur</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-oioubl</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ebinterface</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId7>ph-bdve-teapps</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ublbe</artifactId>
  <version>5.2.10</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-xrechnung</artifactId>
  <version>5.2.10</version>
</dependency>
```

Alternate usage as a Maven BOM:

```xml
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-parent-pom</artifactId>
  <version>5.2.10</version>
  <type>pom</type>
  <scope>import</scope>
</dependency>
```

## Potential issues

Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

# News and noteworthy

* v5.2.10 - 2020-03-20
    * The Peppol AU-NZ rules were updated to v1.0.2. v1.0.1 is now deprecated.
* v5.2.9 - 2020-03-18
    * Fixed usage of wrong Peppol AU-NZ Schematrons for v1.0.1 (See [issue #12](https://github.com/phax/ph-bdve/issues/12))
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
    * Added Singapore (SG) PEPPOL Billing BIS3 rules version 1.0.2
* v5.2.2 - 2019-12-12
    * Added SimplerInvoicing 2.0.2 and deprecated version 2.0.1
* v5.2.1 - 2019-12-09
    * Added SimplerInvoicing 2.0.1 and deprecated version 2.0
* v5.2.0 - 2019-11-29
    * The Peppol AU-NZ rules were updated. The old version is now the official "1.0.0" whereas the new rules are "1.0.1". Confusing, I know :-|
    * Updated to ph-schematron 5.4.0 (incompatible change)
* v5.1.15 - 2019-11-15
    * Added support for UBL 2.3 CSPRD01
    * Updated PEPPOL-SG rules to the latest version
    * Deprecated OpenPeppol 3.8.1 rules
* v5.1.14 - 2019-11-01
    * Added support for A-NZ PEPPOL 1.0.1 validations
    * Added OpenPEPPOL 3.9.0 (Fall release 2019) artefacts
* v5.1.13 - 2019-10-14
    * Added support for EN 16931 1.3.0 format (deprecated version 1.2.3)
    * Updated Singapore (SG) PEPPOL Billing BIS3 rules to version 2019-06-12
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
    * Added PEPPOL 3.8.0 (Spring 2019 release) validation artefacts (BIS v3 only)
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
    * EHF validation now directly depends on the PEPPOL Validation artefacts
* v5.1.2 - 2019-02-04
    * Added SimplerInvoicing 2.0 RC1 support [#3](https://github.com/phax/ph-bdve/issues/3)
    * Added Singapore (SG) PEPPOL Billing BIS3 support [#4](https://github.com/phax/ph-bdve/issues/4)
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
    * Added support for PEPPOL Billing BIS 3 document types
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
    * Updated to the PEPPOL Autumn 2017 release (3.5.0)
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
On Twitter: <a href="https://twitter.com/philiphelger">@philiphelger</a> |
Kindly supported by [YourKit Java Profiler](https://www.yourkit.com)