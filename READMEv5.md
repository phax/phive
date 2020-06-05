# BDVE v5.x

A generic document validation engine originally developed for Peppol but now also supporting other document types.

This project is licensed under the Apache 2 license.

# Usage guide

Basically this library wraps different XML Schemas and Schematrons in a certain order and under certain constraints and offers the possibility to validate XML documents based on the rules.

## Validation executor set identification

Every set of validation artefacts is uniquely identified based on a structure that is similar to [Maven coordinates](https://maven.apache.org/pom.html#Maven_Coordinates). The identifier for a set of validation artefacts is a so called "VESID" ("Validation Executor Set ID"). Each VESID consists of a mandatory group ID, a mandatory artefact ID, a mandatory version number (ideally following the semantic versioning principles) and an optional classifier.
E.g. the "Peppol Invoice Fall release 2018" is identified with the group ID `eu.peppol.bis2`, the artefact ID is `t10` (based on "transaction 10" from CEN BII - historical reasons...), the version number is `3.7.0` (representing "Fall 2018") and no classifier is present.
Another example is "SimplerInvoicing 1.2 invoice" which has the group ID `org.simplerinvoicing`, the artifact ID `invoice` and the version number `1.2` (also without a classifier).

Each VESID can be represented in a single string in the form `groupID:artifiactID:version[:classifier]`. Neither group ID, nor artifact ID, nor version number, nor classifier may contain the colon (':') character, any bracket character ('<' and '>') nor any other character forbidden in filenames in any OS.

## How to validate documents

At least the `ph-bdve-engine` project and one library with rule sets (like e.g. `ph-bdve-peppol`) is needed in your application. See the section on usage in a Maven project below.
All available VES must be registered in an instance of class `ValidationExecutorSetRegistry` (which can simply created via `new`).
Depending on the used domain specific libraries, initialization calls for registration into the registry must be performed.
Example for registering (only) Peppol validation artefacts:

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
    // Resolve the VES ID
    final IValidationExecutorSet aVES = VESRegistry.getOfID (aVESID);
    if (aVES != null) {
      // Code for 5.x:
      // final ValidationExecutionManager aVEM = aVES.createExecutionManager ();
      // What to validate?
      ValidationSource aValidationSource = ...;
      // Main execution
      final ValidationResultList aValidationResult = aVEM.executeValidation (aValidationSource);
      if (aValidationResult.containsAtLeastOneError ()) {
        // errors found ...
      } else {
        // no errors (but maybe warnings) found
      }                                                                       
    }                                                                             
```

# Maven usage

Add the following to your `pom.xml` to use this artifact, replacing `x.y.z` with the latest version:

```xml
<dependency>
  <groupId>com.helger.bdve</groupId>
  <artifactId>ph-bdve-engine</artifactId>
  <version>x.y.z</version>
</dependency>
```

Alternate usage as a Maven BOM:

```xml
<dependency>
  <groupId>com.helger.bdve</groupId>
  <artifactId>ph-bdve-parent-pom</artifactId>
  <version>x.y.z</version>
  <type>pom</type>
  <scope>import</scope>
</dependency>
```

Note: prior to v5.3.0 the Maven groupId was `com.helger`.

## Potential issues

Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.
