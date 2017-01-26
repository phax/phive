#peppol-validation-engine
PEPPOL BIS v2 validation engine.
A running example can be found on [PEPPOL Practical](http://peppol.helger.com/public/menuitem-validation-bis2)

Licensed under the Apache 2 license.

This project is divided into 3 sub-projects for maximum flexibility
  * ph-bdve - generic "Business Document Validation Engine"
  * ph-bdve-peppol - the PEPPOL specific setup etc
  
#News
  * v3.0.0 - 2017-01-26
    * Is a complete rewrite with different structure etc.
    * Binds to ph-commons 8.6.x
    * Requires at least ph-schematron 4.2.1
  * v2.0.1 - 2016-09-12
    * Binds to ph-commons 8.5.x
  * v2.0.0 - 2016-08-22
    * Requires JDK 8

#Usage notes
Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

#Maven usage
Add the following to your `pom.xml` to use this artifact:
```
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>ph-bdve-peppol</artifactId>
  <version>3.0.0</version>
</dependency>
```

(no release yet)

#Origin of some elements
The rule source files were originating from https://github.com/oriol/validation-tools

---

My personal [Coding Styleguide](https://github.com/phax/meta/blob/master/CodeingStyleguide.md) |
On Twitter: <a href="https://twitter.com/philiphelger">@philiphelger</a>
