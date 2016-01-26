#peppol-validation-engine
PEPPOL BIS v2 validation engine.
A running example can be found on [PEPPOL Practical](http://peppol.helger.com/public/menuitem-validation-bis2)

Licensed under the Apache 2 license.

This project is divided into 3 sub-projects for maximum flexibility
  * peppol-validation-api - generic API
  * peppol-validation-artefacts - only the created SCH and XSLT artefacts - no Java code and no dependencies!
  * peppol-validation-engine - the main engine using the API and the artefacts

#Usage notes
Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

#Maven usage
Add the following to your `pom.xml` to use this artifact:
```
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>peppol-validation-engine</artifactId>
  <version>1.1.0</version>
</dependency>
```

(no release yet)

#Origin
The rule source files are originating from https://github.com/oriol/validation-tools

---

On Twitter: <a href="https://twitter.com/philiphelger">Follow @philiphelger</a>
