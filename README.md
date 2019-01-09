# ph-bdve

A generic document validation engine originally developed for PEPPOL but now also supporting other document types.

This project is divided into sub-projects each keeping tracking of one document type set:
  * ph-bdve - generic "Business Document Validation Engine"
  * ph-bdve-peppol - the PEPPOL specific setup etc
  * ph-bdve-simplerinvoicing - Dutch SimplerInvoicing 1.x support from https://github.com/SimplerInvoicing/validation
  * ph-bdve-en16931 - Validation rules for the EN 16931 (European e-Invoicing norm based on CEN TC 434)
  * ph-bdve-ehf - Validation rules for EHF (Norwegian public procurement) - since 4.0.1
  * ph-bdve-ubl - Validation rules for pure UBL (without any Schematron) - since 4.0.1
  * ph-bdve-cii - Validation rules for pure CII (without any Schematron) - since 4.0.1
  * ph-bdve-energieefactuur - Validation rules for Dutch Energie eFactuur - since 4.0.2
  * ph-bdve-oioubl - Validation rules for Danish OIOUBL - since 4.0.3
  * ph-bdve-ebinterface - Validation rules for Austrian ebInterface - since 5.0.0
  * ph-bdve-teapps - Validation rules for Tieto TEAPPSXML - since 5.0.0
  * ph-bdve-ublbe - Validation rules for e-FFF/UBL.BE - since 5.0.5

A running example can be found on [PEPPOL Practical](http://peppol.helger.com/public/menuitem-validation-bis2).

A standalone tool that just performs validation based on this library is the [phoss validator](https://github.com/phax/phoss-validator/).

Licensed under the Apache 2 license.

# Usage guide

Basically this library wraps different XML Schemas and Schematrons and offers the possibility to validate XML documents based on the rules.

## Validation executor set identification

Every set of validation artefacts is uniquely identified based on a structure that is similar to (Maven coordinates)[https://maven.apache.org/pom.html#Maven_Coordinates]. The identifier for a set of validation artefacts is a so called "VESID" ("Validation Executor Set ID"). Each VESID consists of a mandatory group ID, a mandatory artefact ID, a mandatory version number (ideally following the semantic versioning principles) and an optional classifier.
E.g. the "PEPPOL Invoice Fall release 2018" is identified with the group ID `eu.peppol.bis2`, the artefact ID is `t10` (based on "transaction 10" from CEN BII - historical reasons...), the version number is `3.7.0` (representing "Fall 2018") and no classifier is present.
Another example is "SimplerInvoicing 1.2 invoice" which has the group ID `org.simplerinvoicing`, the artifact ID `invoice` and the version number `1.2` (also without a classifier).

Each VESID can be represented in a single string in the form `groupID:artifiactID:version[:classifier]`. Neither group ID, nor artifact ID, nor version number, nor classifier may contain the colon (':') character, any bracket character ('<' and '>') nor any other character forbidden in filenames in any OS.

## Usage in an application

At least the `ph-bdve` project and one of the domain specific projects (like e.g. `ph-bdve-peppol`) is needed in your application.
All available VES must be registered in an instance of class `ValidationExecutorSetRegistry` (which can simply created via `new`).
Depending on the used domain specific libraries, initialization calls for registration into the registry must be performed.
Example for registering PEPPOL validation artefacts:

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

## Potential issues

Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

# News and noteworthy

* v5.1.1 - work in progress
    * Started adding UBL.BE 1.0.0 Schematrons - not ready yet
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

# Maven usage

Add the following to your `pom.xml` to use this artifact:

```xml
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-peppol</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-en16931</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-simplerinvoicing</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ubl</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-cii</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ehf</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-energieefactuur</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-oioubl</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ebinterface</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-teapps</artifactId>
  <version>5.1.0</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ublbe</artifactId>
  <version>5.1.0</version>
</dependency>
```

---

My personal [Coding Styleguide](https://github.com/phax/meta/blob/master/CodingStyleguide.md) |
On Twitter: <a href="https://twitter.com/philiphelger">@philiphelger</a>
