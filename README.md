# peppol-validation-engine
PEPPOL BIS v2 validation engine.
A running example can be found on [PEPPOL Practical](http://peppol.helger.com/public/menuitem-validation-bis2)

Licensed under the Apache 2 license.

This project is divided into 3 sub-projects for maximum flexibility
  * ph-bdve - generic "Business Document Validation Engine"
  * ph-bdve-peppol - the PEPPOL specific setup etc
  * ph-bdve-simplerinvoicing - Dutch SimplerInvoicing 1.x support from https://github.com/SimplerInvoicing/validation
  * ph-bdve-en16931 - Validation rules for the EN 16931 (European e-Invoicing norm based on CEN TC 434)
  
# News
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
  <version>3.1.3</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-en16931</artifactId>
  <version>3.1.3</version>
</dependency>

<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-simplerinvoicing</artifactId>
  <version>3.1.3</version>
</dependency>
```

# Origin of some elements
The rule source files were originating from https://github.com/oriol/validation-tools

---

My personal [Coding Styleguide](https://github.com/phax/meta/blob/master/CodeingStyleguide.md) |
On Twitter: <a href="https://twitter.com/philiphelger">@philiphelger</a>
