#peppol-validation-engine
PEPPOL BIS v2 validation engine.

Licensed under the Apache 2 license.

#Usage notes
Please ensure that your stack size is at least 1MB (for Saxon). Using the Oracle runtime, this can be achieved by passing `-Xss1m` on the command line. This only seems to be a problem when running 32bit Java. With 64bit Java, the default stack size of the Oracle JVM is already 1MB.

#Maven usage
Add the following to your `pom.xml` to use this artifact:
```
<dependency>
  <groupId>com.helger</groupId>
  <artifactId>peppol-validation-engine</artifactId>
  <version>1.0.0-SNAPSHOT</version>
</dependency>
```

(no release yet)

#Origin
The rule source files are originating from https://github.com/oriol/validation-tools

---

On Twitter: <a href="https://twitter.com/philiphelger">Follow @philiphelger</a>
