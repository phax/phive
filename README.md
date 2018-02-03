# ph-bdve

A generic document validation engine originally developed for PEPPOL but now also supporting EN 16931 documents and SimplerInvoicing documents.
A running example can be found on [PEPPOL Practical](http://peppol.helger.com/public/menuitem-validation-bis2)

Licensed under the Apache 2 license.

This project is divided into sub-projects for maximum flexibility:
  * ph-bdve - generic "Business Document Validation Engine"
  * ph-bdve-peppol - the PEPPOL specific setup etc
  * ph-bdve-simplerinvoicing - Dutch SimplerInvoicing 1.x support from https://github.com/SimplerInvoicing/validation
  * ph-bdve-en16931 - Validation rules for the EN 16931 (European e-Invoicing norm based on CEN TC 434)
  * ph-bdve-ehf - Validation rules for EHF (Norwegian public procurement) - since 4.0.1
  * ph-bdve-ubl - Validation rules for pure UBL (without any Schematron) - since 4.0.1
  * ph-bdve-cii - Validation rules for pure CII (without any Schematron) - since 4.0.1
  * ph-bdve-energieefactuur - Validation rules for Dutch Energie eFactuur - since 4.0.2
  
# News and noteworthy

* v4.0.2 - 2018-02-03
  * Started adding support for Dutch Energie eFactuur (new artefact `ph-bdve-energieefactuur`)
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

# Usage notes
Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

# Maven usage
Add the following to your `pom.xml` to use this artifact:
```xml
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-peppol</artifactId>
  <version>4.0.2</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-en16931</artifactId>
  <version>4.0.2</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-simplerinvoicing</artifactId>
  <version>4.0.2</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ubl</artifactId>
  <version>4.0.2</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-cii</artifactId>
  <version>4.0.2</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-ehf</artifactId>
  <version>4.0.2</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-energieefactuur</artifactId>
  <version>4.0.2</version>
</dependency>
```

---

My personal [Coding Styleguide](https://github.com/phax/meta/blob/master/CodeingStyleguide.md) |
On Twitter: <a href="https://twitter.com/philiphelger">@philiphelger</a>
