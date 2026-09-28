# Task: reduce the dependency surface of phive

Status: 2026-09-28. **P1 and F7 are implemented**; P2 onwards are open. Both
decisions are settled: P1a, and `12.2.0-SNAPSHOT`. Baseline re-measured
2026-09-28 against the released ph-schematron 10.2.0; see the note under
"Measured baseline".

Premise: the two upstream splits are released. `ph-schematron` v10.2.0 has a
Saxon-free `ph-schematron-api`, with the Saxon classes in the new
`ph-schematron-saxon`; `ddd` is split into `ddd-model` + `ddd`
(`../ddd/pom.xml`). Both are in the local repository, and `pom.xml` is already
bumped to ph-schematron 10.2.0 — `mvn clean install` is green against it on
JDK 25 (170 tests, 0 failures) with no further POM change.

This is a general re-assessment of phive for what is left, not only the
`phive-result` → `phive-xml` coupling noted earlier.

## Measured baseline

Dependency set of a consumer that only *deserializes* validation results:
`ph-httpclient` + `ph-json` + `ph-xml` + `phive-result`. Resolved with
`mvn dependency:build-classpath` on JDK 25, summing the JARs, against the real
ph-schematron 10.2.0 in the local repository. The phive change is simulated with
a `phive-xml` exclusion plus an explicit `phive-api`, which is what
`phive-xml-source` resolves to.

| State | JARs | Size |
|---|---:|---:|
| Thin core, no phive at all | 24 | 4.93 MB |
| + `phive-result` 12.1.0 on ph-schematron 10.1.0 — before either change | 46 | 12.92 MB |
| + `phive-result`, after the ph-schematron split only (= today, HEAD) | 47 | 12.94 MB |
| + `phive-result`, after the phive change below only, on ph-schematron 10.1.0 | 37 | 12.29 MB |
| + `phive-result`, after **both** | 34 | 5.59 MB |

The two changes are complementary and **neither is sufficient on its own**. The
ph-schematron split made `ph-schematron-api` Saxon-free, but every engine module
— `-xslt`, `-isosch`, `-schxslt`, `-schxslt2`, `-pure` — declares
`ph-schematron-saxon` → `Saxon-HE`, and `phive-result` reaches all five through
`phive-xml`. So the split alone removes nothing here; it adds one JAR, because
`ph-schematron-saxon` is a new artifact. Conversely the phive change alone leaves
Saxon in place, because before 10.2.0 `phive-api` pulled it directly.

Together they remove **13 JARs / 7.35 MB**:

| Removed | Size |
|---|---:|
| `Saxon-HE` 12.10 | 5657 KB |
| `xmlresolver` 5.3.3 + `xmlresolver-5.3.3-data` | 1173 KB |
| `ph-schematron-{isosch,pure,saxon,schxslt,schxslt2,xslt}` | 419 KB |
| `ph-schematron-model` | 177 KB |
| `phive-xml` | 60 KB |
| `schxslt` 1.10.1 + `schxslt2` 1.11.2 | 45 KB |

An earlier revision of this document credited the 6.7 MB to the ph-schematron
split and left phive with "8 JARs and 0.5 MB". That was measured by excluding
`Saxon-HE` by hand, which is not what the split does. phive is now the only
remaining step, and it is the step that drops Saxon.

## Assessment

### F1 — `phive-result` drags the Schematron engines for two classes

`phive-result` declares `phive-xml`. Every reference, main and test:

```
main/java/com/helger/phive/result/PhiveResultHelper.java:44  IValidationSourceXML
main/java/com/helger/phive/result/PhiveResultHelper.java:45  ValidationSourceXML
test/.../json/PhiveJsonHelperTest.java:52-54                 + ValidationExecutorXSD
test/.../xml/PhiveXMLHelperTest.java:49-51                   + ValidationExecutorXSD
```

Main code needs exactly two classes, both from `com.helger.phive.xml.source`.
That package is **Saxon-free and Schematron-free** — all three of its classes
import only `phive-api`, `ph-xml`, `ph-io` and `ph-base`:

| `phive-xml` package | Files | Needs the engines? |
|---|---:|---|
| `source` | 3 | **no** — `phive-api`, `ph-xml`, `ph-io`, `ph-base` |
| `schematron` | 8 | yes |
| `xsd` | 5 | no, but `ValidationExecutor*` pulls the executor machinery |
| `executorset` | 1 | — |

**Actionable.** See P1.

This is a better cut than moving `PhiveResultHelper.createValidationSource`'s XML
branch into `phive-xml` behind `IValidationSourceRestorer`, which was the earlier
proposal. Moving the method would make the no-arg
`getAsValidationResultList (IJsonObject)` silently stop restoring XML sources —
a behaviour regression for existing callers. Extracting the package keeps every
signature and every behaviour as-is.

### F2 — `phive-result` declares `ph-jaxb` and never uses it

No `jakarta.xml.bind`, no `com.helger.jaxb`, no `Marshaller` anywhere in
`phive-result/src` — main or test. The dependency can go. **Actionable**, see P2.

It changes nothing on the classpath: `ph-jaxb` arrives via `ph-schematron-api`
either way, both before and after P1/P2. This is declaration hygiene, not a
saving.

### F3 — `phive-api` pulls `ph-schematron-api` for one enum — rejected

`EValidationType.java:25` imports `com.helger.schematron.ESchematronEngine`, and
that is the only Schematron reference in all 38 files of `phive-api`. Dropping it
saves **7 JARs / 0.49 MB** for a `phive-api`-only consumer — re-measured on
10.2.0, where Saxon is no longer behind `ph-schematron-api` (33 → 26 JARs,
5.54 → 5.05 MB). The earlier figure of 9 JARs / 1.0 MB predates the split.

Rejected, for two reasons:

- It buys nothing for the case that motivated this work. `phive-result` needs
  `ph-schematron-api` regardless, because `PhiveJsonHelper.getAsIError` returns a
  `com.helger.schematron.svrl.SVRLResourceError` for every finding that carries a
  `test` field.
- It is an API break: `EValidationType.getSchematronEngine()` is public and
  returns `ESchematronEngine`. Replacing it with a `String` or a phive-local enum
  costs every rule-set author a change, to remove a dependency that is Saxon-free
  after the ph-schematron split anyway.

### F4 — splitting `phive-result` into JSON and XML halves — rejected

The module is 70 KB: `json/` 4 files, `xml/` 4 files, `exception/` 1. A
JSON-only consumer would still get `ph-xml` through `phive-api` →
`ph-schematron-api`. Nothing to gain.

### F5 — `phive-result-html` — nothing to do

Depends on `phive-api` + `ph-xml` only, and does not reference `phive-result` at
all. Already as narrow as it can be.

### F6 — `mock/PhiveTestFile` in the `phive-api` main JAR — leave it

It looks like a test helper shipped in a production artifact, but it is consumed
as main-scope API by more than ten `phive-rules-*` modules. Moving it would break
them for cosmetic gain.

### F7 — `phive-result` uses `ph-xml` directly without declaring it — **done**

Main code imports `com.helger.xml.microdom.IMicroElement`,
`com.helger.xml.microdom.MicroElement`, `com.helger.xml.microdom.util.MicroHelper`
and `com.helger.xml.serialize.read.DOMReader`, but `phive-result/pom.xml` declares
no `ph-xml` — it arrives transitively. `phive-result-html` declares it explicitly
for the same kind of use, so the explicit declaration is the house pattern.

This matters for P2: today one of the transitive paths supplying `ph-xml` is
`phive-xml`, which P2 removes. `ph-schematron-api` still supplies it via
`phive-api`, so nothing breaks — but the declaration should not rely on that.
**Actionable**, folded into P2.

## Decisions to confirm before starting

1. **How to extract the source classes.** Two shapes:
   - **P1a (recommended): a new `phive-xml-source` module** holding
     `com.helger.phive.xml.source`. `phive-xml` depends on it, so every current
     `phive-xml` consumer keeps compiling untouched. Self-documenting, and it
     matches how `ph-schematron` was split. Cost: one more small artifact
     (3 classes).
   - **P1b: move the three classes into `phive-api`**, package name unchanged.
     No new artifact, no reactor change, and no split package — `phive-xml` would
     no longer contain `com.helger.phive.xml.source` at all. Cheaper, but it puts
     `com.helger.phive.xml.*` packages inside an artifact called `phive-api`,
     which will read oddly later.
2. **Version: `12.2.0-SNAPSHOT`.** The tree is at `12.1.1-SNAPSHOT` today.
   Additive, no signature changes, nothing in the workspace breaks — the same
   reasoning that set `ph-schematron` to 10.2.0. The current
   `v12.1.1 - work in progress` entry folds into it. The bump touches eight POMs:
   `pom.xml:29` plus the `<parent>` version in each of the seven module POMs.

## Who benefits

Eleven modules outside this repository import `com.helger.phive.xml.source` and
nothing else from `phive-xml`: `ddd/ddd`, `phase4/phase4-peppol-client`,
`phase4/phase4-hredelivery-client`, `peppol-practical`,
`peppol-shared-ui/peppol-shared-validation`, `phive-central-tools`,
`en16931-cii2ubl`, `en16931-purifier`, `en16931-ubl2cii`,
`phive-rules/phive-rules-all`, `phive-rules-legacy/phive-rules-all-legacy`. None
of them has to change anything — P1a keeps `phive-xml` working as before — but
each can narrow its dependency afterwards if it wants to.

`phorm` is *not* one of them: it uses `com.helger.phive.xml.xsd` as well and keeps
`phive-xml`. Everything under `phive-rules*`, `peppol-sk` and `peppol-vida` also
uses `executorset`, `schematron` or `xsd`, so the same applies there.

---

## Tasks

### P1 — Extract `com.helger.phive.xml.source` — **done**

Per decision 1, P1a. Implemented, plus the `12.2.0-SNAPSHOT` bump from decision 2
across the root POM and all eight module POMs. `mvn clean install` is green on
JDK 25 and `mvn -o dependency:tree -pl phive-xml-source` shows `ph-schematron-api`
as its only ph-schematron artifact and no `Saxon-HE`.

Note for the next person at the keyboard: a running Eclipse rebuilds
`phive-ves-engine/target/classes` with JDT while Maven is working, and until the
new module is imported into the workspace those classes throw
`java.lang.Error: Unresolved compilation problems` at `VESLoaderTest`. Import
`phive-xml-source` in Eclipse, or close it, before reading a reactor failure as
real. The Eclipse metadata is gitignored, so there is nothing to commit for it.

- New module `phive-xml-source`, parent `com.helger.phive:phive-parent-pom`,
  packaging `jar`. Follow `phive-api/pom.xml` for the `<licenses>` /
  `<organization>` / `<developers>` blocks and the `<url>` pattern.
- Dependencies: `phive-api`, `ph-xml`. (`ph-io` and `ph-base` arrive through
  `phive-api`; declare `ph-xml` explicitly because `XMLFactory`, `XMLHelper`,
  `XMLWriter`, `DOMReader` and `TransformSourceFactory` are used directly.)
- `git mv` the three files, package unchanged:
  `source/IValidationSourceXML.java`, `source/ValidationSourceXML.java`,
  `source/ValidationSourceXMLReadableResource.java`.
- Add `<module>phive-xml-source</module>` to the root `<modules>`, after
  `phive-api` and before `phive-xml`, plus a `<dependencyManagement>` entry at
  `${project.version}`.
- `phive-xml` adds `phive-xml-source` as a dependency. Its `schematron/`,
  `xsd/` and `executorset/` packages reference the moved classes
  (`ValidationExecutorXSD`, `ValidationExecutorXSDPartial`,
  `ValidationExecutorSchematron`, `VesXmlBuilder`) and keep compiling unchanged.
- `phive-xml-source/src/etc/license-template.txt` and `javadoc.css` — copies.
  `parent-pom` resolves that path per module.
- `phive-xml-source/src/main/resources/LICENSE` and `NOTICE` — copies.
  Leave `META-INF/services/com.helger.schematron.svrl.ISVRLLocationBeautifierSPI`
  in `phive-xml`; it registers `schematron/LocationBeautifierSPI`, which stays.

*Done when* `mvn -o dependency:tree -pl phive-xml-source` shows no
`ph-schematron-*` artifact other than `ph-schematron-api`, and no `Saxon-HE`.

### P2 — Re-point `phive-result`

- Replace the `phive-xml` dependency with `phive-xml-source`.
- Add `phive-xml` back with `<scope>test</scope>`: `PhiveJsonHelperTest` and
  `PhiveXMLHelperTest` use `ValidationExecutorXSD`, which stays in `phive-xml`.
- Remove the unused `ph-jaxb` dependency (F2).
- ~~Add `ph-xml` as an explicit compile dependency (F7).~~ **Done** with P1.

*Done when* `phive-result` compiles, all its tests pass, and
`mvn -o dependency:tree -pl phive-result` contains no `ph-schematron-xslt`,
`-isosch`, `-schxslt`, `-schxslt2`, `-pure`, no `ph-schematron-model` and no
`schxslt` / `schxslt2` third-party JAR.

### P3 — Check the other modules for the same narrowing

`phive-ves-engine` declares `phive-xml` and uses `schematron`, `source` and
`xsd`, so it keeps the full dependency. `phive-ves-model`, `phive-ves-repo` and
`phive-result-html` do not reference `phive-xml` at all. Confirm that after P1,
and narrow anything that turns out to need only `source`.

### P4 — Verify the saving end to end

```bash
mvn -o dependency:tree -pl phive-result
```

*Done when* a consumer of `ph-httpclient` + `ph-json` + `ph-xml` +
`phive-result` resolves to **34 JARs / 5.59 MB**, down from 47 / 12.94 today —
both measured with ph-schematron 10.2.0 on the classpath. The single check that
matters is that `Saxon-HE` is gone.

Also re-run the `phorm-client` probe from
`../phorm-client/docs/lightweight-model-analysis.md`: deserializing a real
`ValidationResultList` must still work, including the `SVRLResourceError` path
for findings that carry a `test` field.

### P5 — Full reactor build

`j25 && mvn clean install` from the root. Pay attention to `phive-ves-engine`,
which consumes `source`, `schematron` and `xsd` together and is the best check
that the package extraction did not disturb the executor wiring.

Use JDK 25. On JDK 21 — the default in a fresh shell — the reactor fails in
`phive-ves-model` with "invalid class file" / "invalid
RuntimeInvisibleParameterAnnotations attribute" against the freshly built
`phive-api` classes. That is unrelated to this change, but it will otherwise look
like one.

### P6 — Downstream check

Build against the new SNAPSHOT, expecting **no POM change** in any of them:
`phive-rules` (the `-all` aggregate is enough), `phive-rules-legacy`,
`phorm`, `phase4`, `ddd`, `peppol-practical`. `phive-xml` still exposes
everything it did before, transitively.

### P7 — README — **mostly done**

- ~~**Sub-modules** list: add `phive-xml-source`.~~ **Done.**
- ~~**Maven usage**: add a `phive-xml-source` block with one sentence — take it
  when you only need to *create or restore* an XML validation source, take
  `phive-xml` when you need to *run* XSD or Schematron validation.~~ **Done**,
  including the warning not to declare both.
- ~~**News and noteworthy**: retitle the open entry to
  `v12.2.0 - work in progress`, keep its four existing bullets, and add one for
  the new module.~~ **Done** — three bullets added: ph-schematron 10.2.0, the new
  module, and the `ph-xml` declaration (F7). phive has no wiki checkout, so this
  went into `README.md`.
- **Still open, because it depends on P2:** the **Potential issues** section
  tells readers to pass `-Xss1m` "for Saxon". Once P2 lands that no longer applies
  to a `phive-result`-only consumer; scope the sentence to `phive-xml` then. Add
  a news bullet at the same time, saying `phive-result` no longer pulls the
  Schematron engines or Saxon.

### P8 — Update the cross-repo analysis

`../phorm-client/docs/lightweight-model-analysis.md` describes S2 as "move the
XML source restorer from `phive-result` into `phive-xml`". Replace that with the
package extraction above, and refresh the summary table to the measured
34 JARs / 5.59 MB.

It also needs the same correction this document needed. It attributes the 5.5 MB
of Saxon to CP-1 (`phive-api` → `ph-schematron-api` → Saxon) and calls S1 the
"highest payoff of the three, removes ~5.5 MB". After ph-schematron 10.2.0 that
cost has moved to CP-2: `phive-result` → `phive-xml` → the engines →
`ph-schematron-saxon` → Saxon. S1 shipped and removed nothing on its own; S2 is
what removes Saxon, and only now that S1 is in place.

---

## Out of scope

- No behaviour change, no renamed class, no changed package, no touched method
  signature. `PhiveResultHelper.createValidationSource` keeps restoring XML
  sources exactly as it does today — that is the whole point of preferring the
  package extraction over moving the method.
- `IValidationSourceRestorer` stays where it is and keeps its meaning; the
  three-argument `getAsValidationResultList` overload remains the extension point
  for callers with their own source types.
- No new Schematron engine support. Noted here only because ph-schematron 10.2.0
  makes it possible: 10.2.0 added `ph-schematron-pure-xslt`
  (`SchematronResourcePureXslt`, `EPureXsltVersion`), and
  `SchematronResourceCreators` has no PURE_XSLT branch. So
  `EValidationType.SCHEMATRON_PURE_XSLT1/2/3` — added in 12.1.0 — reach
  `throw new IllegalStateException ("Unsupported Schematron validation type: …")`
  at `ValidationExecutorSchematron.java:277`, and only at `applyValidation` time,
  since `ValidationExecutorSchematronBuilder.build` does not reject them. The same
  holds for `SCHEMATRON_SCH_ISO_XSLT1`, `SCHEMATRON_SCHXSLT1_XSLT1`,
  `SCHEMATRON_XSLT1` and `SCHEMATRON_XSLT3`. Separate issue, separate change.
