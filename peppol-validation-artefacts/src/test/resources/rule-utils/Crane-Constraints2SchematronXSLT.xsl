<?xml version="1.0" encoding="UTF-8"?>
<!--

    Version: MPL 1.1/EUPL 1.1

    The contents of this file are subject to the Mozilla Public License Version
    1.1 (the "License"); you may not use this file except in compliance with
    the License. You may obtain a copy of the License at:
    http://www.mozilla.org/MPL/

    Software distributed under the License is distributed on an "AS IS" basis,
    WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
    for the specific language governing rights and limitations under the
    License.

    The Original Code is Copyright The PEPPOL project (http://www.peppol.eu)

    Alternatively, the contents of this file may be used under the
    terms of the EUPL, Version 1.1 or - as soon they will be approved
    by the European Commission - subsequent versions of the EUPL
    (the "Licence"); You may not use this work except in compliance
    with the Licence.
    You may obtain a copy of the Licence at:
    http://joinup.ec.europa.eu/software/page/eupl/licence-eupl

    Unless required by applicable law or agreed to in writing, software
    distributed under the Licence is distributed on an "AS IS" basis,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the Licence for the specific language governing permissions and
    limitations under the Licence.

    If you wish to allow use of your version of this file only
    under the terms of the EUPL License and not to allow others to use
    your version of this file under the MPL, indicate your decision by
    deleting the provisions above and replace them with the notice and
    other provisions required by the EUPL License. If you do not delete
    the provisions above, a recipient may use your version of this file
    under either the MPL or the EUPL License.

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                xmlns:cva=
          "http://docs.oasis-open.org/codelist/ns/ContextValueAssociation/1.0/"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:ccs="urn:x-Crane:ss:Crane-Constraints2Schematron"
                xmlns:xslo="dummy"
                version="1.0"
                exclude-result-prefixes="cva xs xslo sch">

<xs:doc info="$Id: Crane-Constraints2SchematronXSLT.xsl,v 1.20 2010/05/19 15:29:58 gkholman Exp $"
        filename="Crane-Constraints2SchematronXSLT.xsl" internal-ns="ccs" 
        global-ns="xs" vocabulary="DocBook">
 <xs:title>Implementation of context/value association to Schematron</xs:title>
  <para>
     A Schematron-based implementation of value validation supporting the
     OASIS Code List Representation Technical Committee specification of
     context/value association files.  This implementation does not validate
     the query binding, but it does expect context-free addresses to be
     compatible with XPath 1 and XPath 2 syntax.
  </para>
  <para>
     This stylesheet calls out to external template rules to accommodate the
     format of external code list enumerations, thus it is not hardwired to 
     any particular document vocabulary or to the any particular
     representation of code lists.
  </para>
  <para>
     It should not be necessary to modify this fragment in order to support
     any value list vocabulary definition.  Rather, the importing stylesheet
     that imports this fragment would import a companion fragment that
     addresses all aspects of code list representation.
  </para>
  <para>
    A stylesheet incorporating this fragment does not directly create a
    Schematron fragment.  Rather, a standalone result XSLT stylesheet is
    created by this stylesheet.  The resulting synthesized stylesheet can 
    be run with no input or any input (any input is ignored) as it is
    self-contained.  The output of running the resulting synthesized stylesheet
    is the Schematron pattern fragment needed for validation purposes.
  </para>
  <para>
     Implementation restriction:  at this time this script is checking
     individual code list association files for having non-conflicting prefixes
     for namespaces, but it is not checking the entire suite of prefixes for
     namespaces for every included file for unique usage of prefix values in
     the generated result.  This may go unreported and cause a problem in the
     Schematron processing.
  </para>
  <programlisting>
 Copyright (C) - Crane Softwrights Ltd.
               - http://www.CraneSoftwrights.com/links/res-dev.htm
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 - Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.
 - Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
 - The name of the author may not be used to endorse or promote products
   derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
 NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
 Note: for your reference, the above is the "Modified BSD license", this text
     was obtained 2003-07-26 at http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5
</programlisting>
</xs:doc>

<xs:variable>
  <para>Makes namespace work more succinct in the stylesheet.</para>
</xs:variable>
<xsl:variable name="ccs:cva-namespace" select="document('')/*/namespace::cva"/>
<xs:variable>
  <para>Makes namespace work more succinct in the stylesheet.</para>
</xs:variable>
<xsl:variable name="ccs:sch-namespace" 
              select="document('')/*/namespace::sch"/>

<xs:key>
  <para>Keeps ids handy for uniqueness testing.</para>
</xs:key>
<xsl:key name="ccs:ids" match="*[@xml:id]" use="normalize-space(@xml:id)"/>

<xs:key>
  <para>Keeps tests handy for reference.</para>
</xs:key>
<xsl:key name="ccs:valuetests" match="ValueTest" 
         use="normalize-space(@xml:id)"/>

<xs:key>
  <para>Keeps code lists handy for reference.</para>
</xs:key>
<xsl:key name="ccs:valuelists" match="ValueList" 
         use="normalize-space(@xml:id)"/>

<xs:key>
  <para>Keeps metadata sets handy for reference.</para>
</xs:key>
<xsl:key name="ccs:metadatasets" match="InstanceMetadataSet" 
         use="normalize-space(@xml:id)"/>

<xs:variable>
  <para>
    This remembers the association file root node for the initial file only.
  </para>
</xs:variable>
<xsl:variable name="ccs:assoc-file" select="document('',/)"/>
<xs:variable>
  <para>
    This sets the URI of the initial file to the empty string since it cannot
    be known automatically when using XSLT 1.0.
  </para>
</xs:variable>
<xsl:variable name="ccs:assoc-uri"/>

<xs:output>
  <para>
    This makes the resulting file easy to view or to edit with an editor that
    does not support UTF-8 encoding.
  </para>
</xs:output>
<xsl:output encoding="ISO-8859-1"/>

<xs:namespace-alias>
  <para>
    This stylesheet creates another stylesheet, thus requiring aliasing of
    result tree fragments.
  </para>
</xs:namespace-alias>
<xsl:namespace-alias stylesheet-prefix="xslo" result-prefix="xsl"/>

<xs:template>
  <para>
    This is the processing of the root node of all CVA files being processed
    (which initially is the first one but this also triggers for the root of
    referenced CVA files).
  </para>
  <xs:param name="assoc-file">
    <para>The document node of the CVA file being processed.</para>
  </xs:param>
  <xs:param name="assoc-uri">
    <para>The URI string for the CVA file being processed.</para>
  </xs:param>
</xs:template>
<xsl:template match="/">
  <xsl:param name="assoc-file" select="$ccs:assoc-file"/>
  <xsl:param name="assoc-uri" select="$ccs:assoc-uri"/>
  <!--prevent stylesheet abuse-->
  <xsl:if test="not($assoc-file/cva:ContextValueAssociation)">
    <xsl:message terminate="yes">
      <xsl:if test="$assoc-uri">
        <xsl:text>Problem processing file '</xsl:text>
        <xsl:value-of select="$assoc-uri"/>
        <xsl:text>': </xsl:text>
      </xsl:if>
      <xsl:text>Expected the document element {</xsl:text>
      <xsl:value-of select="$ccs:cva-namespace"/>
      <xsl:text>}ContextValueAssociation, but instead have {</xsl:text>
      <xsl:value-of select="concat( namespace-uri(*),'}',local-name(*) )"/>
    </xsl:message>
  </xsl:if>
  <xsl:if test="not($assoc-uri)">
    <!--first time around, check the include tree for infinite loops-->
    <xsl:call-template name="ccs:check-infinite-loops"/>
  </xsl:if>
  <!--check given instance for inconsistencies-->
  <xsl:call-template name="ccs:check-inconsistencies"/>
  <xsl:choose>
    <xsl:when test="$assoc-uri">
      <!--this has been invoked by an Include directive, so just add rules-->
      <xsl:call-template name="ccs:add-rules">
        <xsl:with-param name="assoc-file" select="$assoc-file"/>
        <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <!--this is the first time through, so create the shell and pattern;-->
      <!--note that even though the stated version is 2.0, only 1.0
          features are being used; a 1.0 processor is supposed to accept
          a 2.0-labeled stylesheet without complaint, provided it doesn't
          use any 2.0 features-->
      <xslo:stylesheet version="2.0"
                       xmlns="http://purl.oclc.org/dsdl/schematron"
                       exclude-result-prefixes="ccs">
        <xslo:output indent="yes"/>
        <!--first add the rules with references to each of the tests-->
        <xslo:template match="/">
          <!--change the context to the stylesheet before doing everything-->
          <xslo:for-each select="document('')">
            <xsl:element name="pattern" 
                         namespace="http://purl.oclc.org/dsdl/schematron">
              <xsl:attribute name="id">
            <xsl:value-of 
                       select="$assoc-file/cva:ContextValueAssociation/@name"/>
              </xsl:attribute>
              <xsl:call-template name="ccs:add-rules">
                <xsl:with-param name="assoc-file" select="$assoc-file"/>
                <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
              </xsl:call-template>
            </xsl:element>
          </xslo:for-each>
        </xslo:template>
        <!--any globals needed?-->
        <xsl:call-template name="ccs:global-stylesheet-properties"/>
        <!--now add the tests themselves-->
        <xsl:call-template name="ccs:add-tests">
          <xsl:with-param name="assoc-file" select="$ccs:assoc-file"/>
          <xsl:with-param name="assoc-uri" select="$ccs:assoc-uri"/>
        </xsl:call-template>
      </xslo:stylesheet>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Templates in regard of creating Schematron rules.</xs:title>
</xs:doc>

<xs:template>
  <para>Add the rules from the context association file to the result.</para>
  <xs:param name="assoc-file">
    <para>The document node of the association file being processed.</para>
  </xs:param>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:add-rules">
  <xsl:param name="assoc-file" select="$ccs:assoc-file"/>
  <xsl:param name="assoc-uri" select="$ccs:assoc-uri"/>
  <xsl:text>
</xsl:text>
  <xsl:if test="not($assoc-uri)">
    <!--$comment must be supplied by an external fragment; not defined here-->
    <xsl:comment><xsl:value-of select="$ccs:comment"/></xsl:comment><xsl:text>
</xsl:text>
  </xsl:if>
  <xsl:comment>
    Start of synthesis of a stylesheet creating rules from code list context
    associations.  This is an XSLT 1.0 stylesheet that can be executed without
    any input file (any supplied input file is ignored; most processors
    require the specification of an input file; when necessary, any XML
    document will do, such as providing the stylesheet itself as the input).

    The end result of running this synthesized stylesheet with no or any input 
    is a Schematron schema expressing the constraints found in the CVA file
    that was input to the creation this stylesheet.  Any changes to those
    inputs will require this stylesheet to be recreated.
  </xsl:comment>
  <xsl:text>
</xsl:text>
<xslo:text>
</xslo:text>
  <xslo:comment>
<xsl:if test="normalize-space($assoc-file/*/Title)">
  <!--this will help identify the sets of rules-->
  <xsl:value-of select="$assoc-file/*/Title"/>
  <xsl:text>
</xsl:text>
</xsl:if>
<xsl:if test="normalize-space($assoc-file/*/@version)">
  <!--this will help identify the sets of rules-->
  <xsl:value-of select="$assoc-file/*/@version"/>
  <xsl:text>
</xsl:text>
</xsl:if>
<!--determine end-user namespaces by ignoring expected namespaces-->
<xsl:variable name="ns" 
              select="$assoc-file//namespace::*[name(.) != 'xml' and 
                        . != $ccs:cva-namespace and . != $ccs:sch-namespace]"/>
<xsl:if test="$ns">
    Required namespace declarations as indicated in this set of rules:

<xsl:for-each select="$ns">
  <xsl:if test="generate-id(.)=generate-id($ns[name(.)=name(current())][1])">
    <xsl:value-of select="concat('&lt;ns prefix=&quot;',name(.),
                          '&quot; uri=&quot;',.,'&quot;/>')"/>
      <xsl:text>
</xsl:text>
  </xsl:if>
</xsl:for-each>
      <xsl:text>
</xsl:text>
</xsl:if>
</xslo:comment><xsl:text>
</xsl:text>
  <xsl:apply-templates select="$assoc-file/*/Contexts/Context">
    <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
  </xsl:apply-templates>
  <xsl:comment>
    End of synthesis of rules from code list context associations.
</xsl:comment><xsl:text>
</xsl:text>
  <!--copy any indentation that was at the end of the rules-->
  <xsl:copy-of select="node()[last()][self::text()]"/>

  <xsl:for-each select="$assoc-file/*/Include">
    <xsl:sort select="position()" order="descending" data-type="number"/>
    <xsl:call-template name="ccs:add-rules">
      <xsl:with-param name="assoc-file" select="document(@uri,.)"/>
      <xsl:with-param name="assoc-uri" select="@uri"/>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Add the tests needed for the rules to the result.</para>
  <xs:param name="assoc-file">
    <para>The document node of the association file being processed.</para>
  </xs:param>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:add-tests">
  <xsl:param name="assoc-file" select="$ccs:assoc-file"/>
  <xsl:param name="assoc-uri" select="$ccs:assoc-uri"/>
  <xsl:text>
</xsl:text>
  <xsl:for-each select="$assoc-file/*/ValueTests/ValueTest">
    <ccs:Identification xml:id="{generate-id(.)}">
      <!--add some cosmetics-->
      <xsl:text>
</xsl:text>
      <!--embedded metadata is the only metadata associated with the test-->
      <xsl:apply-templates mode="ccs:Identification" select="Identification"/>
    </ccs:Identification>
    <xsl:text>
</xsl:text>
  </xsl:for-each>
      
  <!--copy the identification information for each list-->
  <xsl:apply-templates select="$assoc-file/*/ValueLists/ValueList">
    <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
  </xsl:apply-templates>
  <xsl:text>
</xsl:text>
  <!--prepare the instance-level metadata template calls-->
  <xsl:apply-templates select="$assoc-file/*/InstanceMetadataSets/
                               InstanceMetadataSet">
    <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
  </xsl:apply-templates>
  <xsl:comment>
    End of synthesis of tests from code list context associations.
</xsl:comment><xsl:text>
</xsl:text>
  <!--copy any indentation that was at the end of the rules-->
  <xsl:copy-of select="node()[last()][self::text()]"/>

  <xsl:for-each select="$assoc-file/*/Include">
    <xsl:sort select="position()" order="descending" data-type="number"/>
    <xsl:call-template name="ccs:add-tests">
      <xsl:with-param name="assoc-file" select="document(@uri,.)"/>
      <xsl:with-param name="assoc-uri" select="@uri"/>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Create one rule for each context in the association file, gathering the
    information from all of the lists referenced.
  </para>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
  <xs:param name="value-references">
    <para>
      The string of identifiers of <literal>&lt;ValueList></literal> and
      <literal>&lt;ValueTest></literal> elements that have not net been
      gathered.
    </para>
  </xs:param>
  <xs:param name="valuetests-referenced">
    <para>
      The node set of value tests referenced.
    </para>
  </xs:param>
  <xs:param name="valuelists-referenced">
    <para>
      The node set of references to external lists referenced.
    </para>
  </xs:param>
</xs:template>
<xsl:template match="Context" name="ccs:gather-context">
  <xsl:param name="assoc-uri"/>
  <xsl:param name="value-references" 
             select="concat( normalize-space(@values), ' ' )"/>
  <xsl:param name="valuetests-referenced" select="/.."/>
  <xsl:param name="valuelists-referenced" select="/.."/>
  <xsl:variable name="context" select="."/>
  <!--process the context-->
  <xsl:choose>
    <xsl:when test="contains( $value-references,' ' )">
      <!--gather up code list references for the given context-->
      <xsl:variable name="referenced"
                    select="substring-before($value-references,' ')"/>
      <xsl:call-template name="ccs:gather-context">
        <xsl:with-param  name="value-references"
                         select="substring-after($value-references,' ')"/>
        <xsl:with-param  name="valuetests-referenced"
                         select="$valuetests-referenced | 
                                 key('ccs:valuetests',$referenced)"/>
        <xsl:with-param  name="valuelists-referenced"
                         select="$valuelists-referenced | 
                                 key('ccs:valuelists',$referenced)"/>
        <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="ccs:compose-rule">
        <xsl:with-param name="context" select="$context"/>
        <xsl:with-param name="assertion">
          <!--compose the assertion from different kinds of constraints-->
          <xsl:text>( </xsl:text>
          <xsl:if test="$valuetests-referenced">
            <!--add assertions from referenced tests-->
            <xsl:for-each select="$valuetests-referenced">
              <xsl:variable name="test-id" select="generate-id(.)"/>
              <!--all cited value tests must be true-->
              <xsl:value-of select="@test"/>
              <xsl:text> ) and ( </xsl:text>
            </xsl:for-each>
          </xsl:if>
          <!--determine if there are any codes being pointed to-->
          <xsl:variable name="code-list-assertion">
            <!--add assertions from referenced lists; each starts with 'or'-->
            <xsl:call-template name="ccs:code-list-make-rule">
              <xsl:with-param name="context" select="$context"/>
              <xsl:with-param name="address" select="@address"/>
              <xsl:with-param name="valuelists-referenced" 
                              select="$valuelists-referenced"/>
              <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
            </xsl:call-template>
          </xsl:variable>
          <!--depending on the presence of codes, act accordingly-->
          <xsl:choose>
            <xsl:when test="normalize-space($code-list-assertion)">
              <!--there are codes to be tested; at least one must be present-->
              <xsl:text>false()</xsl:text>
              <xsl:copy-of select="$code-list-assertion"/>
            </xsl:when>
            <xsl:otherwise>
              <!--there are no codes to be tested; all values are allowed-->
              <xsl:text>true()</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text> ) </xsl:text>
          <!--end of the assertion-->
        </xsl:with-param>
        <xsl:with-param name="values-identifier" 
                        select="normalize-space(@values)"/>
        <xsl:with-param name="address" select="@address"/>
        <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
        <xsl:with-param name="mark" select="normalize-space(@mark)"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>Copy needed Identification nodes without namespaces.</para>
</xs:template>
<xsl:template mode="ccs:Identification" match="*">
  <xsl:element name="{local-name(.)}">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="ccs:Identification" select="node()"/>
  </xsl:element>
</xsl:template>

<xs:template>
  <para>Compose a Schematron rule expressing the asserted constraint.</para>
  <xs:param name="context">
    <para>The context for which the rules are being made.</para>
  </xs:param>
  <xs:param name="assertion">
    <para>
      The text of the assembled assertion (which may be limited to a non-
      assertion of simply "( true() ) ", which can be ignored.
  </para>
  </xs:param>
  <xs:param name="values-identifier">
    <para>The identifier token for the value list being cited.</para>
  </xs:param>
  <xs:param name="address">
    <para>The XPath context of the item being tested.</para>
  </xs:param>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
  <xs:param name="mark">
   <para>The name token of a characterization of the rule and assertion.</para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:compose-rule">
  <xsl:param name="context"/>
  <xsl:param name="assertion"/>
  <xsl:param name="values-identifier"/>
  <xsl:param name="address"/>
  <xsl:param name="assoc-uri"/>
  <xsl:param name="mark"/>
  <xsl:text>
</xsl:text>
  <xsl:if test="$assertion!='( true() ) '">
    <!--build the rule using the given assertion-->
    <xsl:element name="rule" namespace="http://purl.oclc.org/dsdl/schematron">
      <xsl:if test="normalize-space($mark)">
        <xsl:attribute name="flag">
          <xsl:value-of select="$mark"/>
        </xsl:attribute>
        <xsl:attribute name="role">
          <xsl:value-of select="$mark"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="context">
        <xsl:value-of select="$address"/>
      </xsl:attribute>
      <xsl:text>
  </xsl:text>
      <xsl:comment>
        <xsl:text/>{<xsl:value-of select="$assoc-uri"/>}<xsl:text/>
        <xsl:text/>[<xsl:value-of select="$context/@metadata"/>]<xsl:text/>
        <xsl:text/>(<xsl:value-of select="$values-identifier"/>)<xsl:text/>
      </xsl:comment>
      <xsl:text>
  </xsl:text>
      <xslo:text xml:space="preserve">
      </xslo:text>
      <xslo:comment>
        <xsl:text/>{<xsl:value-of select="$assoc-uri"/>}<xsl:text/>
        <xsl:text/>[<xsl:value-of select="$context/@metadata"/>]<xsl:text/>
        <xsl:text/>(<xsl:value-of select="$values-identifier"/>)<xsl:text/>
      </xslo:comment>
      <xsl:text>
  </xsl:text>
      <xsl:if test="contains($assertion,'$apos')">
        <!--then a local variable is needed for the comparison to work-->
        <xsl:element name="let" 
                     namespace="http://purl.oclc.org/dsdl/schematron">
          <xsl:attribute name="name">apos</xsl:attribute>
          <xsl:attribute name="value">"'"</xsl:attribute>
        </xsl:element>
      </xsl:if>
      <!--indicate values that must be true-->
      <!--the first " or " in the string is not required, so trim it off-->
      <xsl:element name="assert" 
                   namespace="http://purl.oclc.org/dsdl/schematron">
        <xsl:if test="normalize-space($mark)">
          <xsl:attribute name="flag">
            <xsl:value-of select="$mark"/>
          </xsl:attribute>
        </xsl:if>
        <!--this stage of transformation expresses the calculation-->
        <xslo:attribute name="test">
            <xsl:copy-of select="$assertion"/>
        </xslo:attribute>
        <!--message to report if the test fails-->
        <xsl:call-template name="ccs:compose-violation-report">
         <xsl:with-param name="values-identifier" select="$values-identifier"/>
         <xsl:with-param name="assoc-uri" select="$assoc-uri"/>
         <xsl:with-param name="address" select="$address"/>
        </xsl:call-template>
      </xsl:element><xsl:text>
</xsl:text>
    </xsl:element><xsl:text>
</xsl:text>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>Compose the default report of a context violation.</para>
  <xs:param name="values-identifier">
    <para>The identifier token for the value list being cited.</para>
  </xs:param>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
  <xs:param name="address">
    <para>The XPath address of the item with the violation.</para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:compose-violation-report">
  <xsl:param name="values-identifier"/>
  <xsl:param name="assoc-uri"/>
  <xsl:param name="address"/>
  <xsl:choose>
    <xsl:when test="Message[normalize-space(.) or *]">
      <!--the context includes the desired messages to be displayed-->
      <!--present only the first in case there are many-->
      <xsl:apply-templates mode="ccs:sch-only"
                           select="Message[normalize-space() or *][1]/node()"/>
    </xsl:when>
    <xsl:otherwise>
      <!--a default message is composed to report the violation-->
      <xsl:text>Value supplied '</xsl:text>
      <xsl:element name="value-of" 
                   namespace="http://purl.oclc.org/dsdl/schematron">
        <xsl:attribute name="select">.</xsl:attribute>
      </xsl:element>
      <xsl:text>' is unacceptable for constraints identified by '</xsl:text>
      <xsl:value-of select="$values-identifier"/>
      <xsl:if test="$assoc-uri">
        <xsl:text>' in association file with uri '</xsl:text>
        <xsl:value-of select="$assoc-uri"/>
      </xsl:if>
      <xsl:text>' in the context '</xsl:text>
      <xsl:value-of select="$address"/>'<xsl:text/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>Copy message content from the CVA file to the Schematron file.</para>
</xs:template>
  <!--when copying the message content from CVA file, trim to Schematron ns-->
<xsl:template mode="ccs:sch-only" match="node()">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>
<xs:template>
  <para>
    Schematron elements in the message content need to go out without
    a namespace.
  </para>
</xs:template>
<xsl:template mode="ccs:sch-only" match="sch:*">
  <xsl:element name="{local-name(.)}" namespace="{namespace-uri(.)}">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Validating the CVA file content business rules</xs:title>
</xs:doc>

<xs:variable>
  <para
    >Most characters not allowed in a part of an attribute or element name 
    (this is not meant to be rigourous, just strong enough for obvious errors);
    assumes the axis is removed and the prefix and name are separate.
  </para>
</xs:variable>
<xsl:variable name="ccs:forbidden"
  >@:`~!#$%^&amp;()+=[]{}\|;"'&lt;>?/</xsl:variable>

<xs:template>
  <para>Consistency checks for user's expression of constraints.</para>
</xs:template>

<xsl:template name="ccs:check-inconsistencies">
  <xsl:variable name="inconsistencies">
    <!--good refs-->
    <xsl:for-each select="/*/Contexts/
                          Context[normalize-space(@values)='']">
      <xsl:text>A context cannot have no references to values: </xsl:text>
      <xsl:call-template name="ccs:report-current-node-context"/>
      <xsl:text>
</xsl:text>
    </xsl:for-each>

    <!--good addresses-->
    <xsl:for-each select="/*/Contexts/
                          Context[normalize-space(@address)='']">
      <xsl:text>A context cannot have an empty or absent address: </xsl:text>
      <xsl:call-template name="ccs:report-current-node-context"/>
      <xsl:text>
</xsl:text>
    </xsl:for-each>

    <!--properly defined ids-->
    <xsl:for-each select="//@xml:id[normalize-space(.)='']">
      <xsl:text>A code list cannot be listed without an xml:id </xsl:text>
      <xsl:text>unique identifier: </xsl:text>
      <xsl:call-template name="ccs:report-current-node-context"/>
      <xsl:text>
</xsl:text>
    </xsl:for-each>

    <!--no duplicate ids-->
    <xsl:for-each select="//@xml:id[count(key('ccs:ids',
                                              normalize-space(.)))>1][1]">
    <xsl:text>Al xml:id identifiers must be unique (xml:id="</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>"): 
</xsl:text>
      <xsl:for-each select="key('ccs:ids',normalize-space(.))">
        <xsl:text>  </xsl:text>
        <xsl:call-template name="ccs:report-current-node-context"/>
        <xsl:text>
</xsl:text>
      </xsl:for-each>
    </xsl:for-each>

    <!--check all document references to point to expected instances-->
    <xsl:for-each select="/*/ValueLists/ValueList">
      <xsl:for-each select="@uri">
        <xsl:call-template name="ccs:check-code-list-uri-attribute"/>
      </xsl:for-each>
      <xsl:for-each select="@masqueradeUri">
        <xsl:call-template name="ccs:check-code-list-uri-attribute">
          <xsl:with-param name="check-only-document-existence" 
                          select="true()"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>

  </xsl:variable>

  <xsl:if test="string($inconsistencies)">
    <xsl:message terminate="yes">
      <xsl:value-of select="$inconsistencies"/>
    </xsl:message>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>
    Confirm that the current node URI attribute points to a code list
    specification.
  </para>
  <xs:param name="check-only-document-existence">
    <para>
      For the masquerading code list file, there are no constraints other
      than it exists and is of the correct document type.
    </para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:check-code-list-uri-attribute">
  <xsl:param name="check-only-document-existence"/>
  <xsl:variable name="doc" select="document(.)"/>
  <xsl:choose>
    <xsl:when test="not($doc)">
      <xsl:text>Resource not found or cannot be processed as XML: </xsl:text>
      <xsl:value-of select="concat(.,': ')"/>
      <xsl:call-template name="ccs:report-current-node-context"/>
      <xsl:text>
      </xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="ccs:code-list-confirm-instance">
        <xsl:with-param name="valuelist" select=".."/>
        <xsl:with-param name="doc" select="$doc"/>
        <xsl:with-param name="check-only-document-existence"
                        select="$check-only-document-existence"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Infinite include loop checking</xs:title>
</xs:doc>

<xs:template>
  <para>Begin walk through include tree looking for an infinite loop.</para>
</xs:template>
<xsl:template name="ccs:check-infinite-loops">
  <xsl:variable name="bad-loop">
    <!--generate any messages-->
    <xsl:call-template name="ccs:check-given-include-tree"/>
  </xsl:variable>

  <!--exit if messages-->
  <xsl:if test="string($bad-loop)">
    <xsl:message terminate="yes">
      <xsl:copy-of select="$bad-loop"/>
    </xsl:message>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>Recurse through nested include directives looking for a loop.</para>
  <xs:param name="root-node-ids">
    <para>Collection of document nodes of included CVA files.</para>
  </xs:param>
  <xs:param name="uri">
    <para>
      The association file URI string (not known for invocation CVA file) of
      the included CVA.
    </para>
  </xs:param>
  <xs:param name="last-uri">
    <para>
      The association file URI string (not known for invocation CVA file) of
      the including CVA.
    </para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:check-given-include-tree">
  <xsl:param name="root-node-ids" select="' '"/>
  <xsl:param name="uri" select="'{invocation document}'"/>
  <xsl:param name="last-uri"/>
  <xsl:variable name="this-root-node-id" select="generate-id(document('',/))"/>
  <xsl:choose>
    <xsl:when test="contains( $root-node-ids,
                              concat(' ',$this-root-node-id,' ') )">
      <!--we've ended up pointing to somewhere in our ancestry-->
      <xsl:text>Infinite loop of include statements triggered by </xsl:text>
      <xsl:text/>including '<xsl:value-of select="$uri"/>' from '<xsl:text/>
      <xsl:value-of select="$last-uri"/>'<xsl:text>
</xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <!--so far so good, now check down next level of children-->
      <xsl:variable name="past-root-node-ids"
                   select="concat( $root-node-ids, $this-root-node-id, ' ' )"/>
      <xsl:for-each select="document('',/)/*/Include">
        <xsl:variable name="new-uri" select="@uri"/>
        <xsl:choose>
          <xsl:when test="not(normalize-space(@uri))">
   <xsl:text>Include directive cannot have an empty uri= attribute: </xsl:text>
            <xsl:call-template name="ccs:report-current-node-context"/>
            <xsl:text>
</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="document($new-uri,.)">
              <xsl:call-template name="ccs:check-given-include-tree">
                <xsl:with-param name="root-node-ids" 
                                select="$past-root-node-ids"/>
                <xsl:with-param name="uri" select="$new-uri"/>
                <xsl:with-param name="last-uri" select="$uri"/>
              </xsl:call-template>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Diagnostics</xs:title>
</xs:doc>

<xs:template>
  <para>Diagnostic function to report context for errors.</para>
</xs:template>
<xsl:template name="ccs:report-current-node-context">
  <!--start with the XPath address of the element in the context expression-->
  <xsl:for-each select="ancestor-or-self::*">
    <xsl:text/>/<xsl:value-of select="name(.)"/>
    <xsl:variable name="preceding-count" 
                select="count(preceding-sibling::*[name(.)=name(current())])"/>
    <xsl:if test="$preceding-count > 0">
      <xsl:text/>[<xsl:value-of select="$preceding-count + 1"/>]<xsl:text/>
    </xsl:if>
  </xsl:for-each>
  <!--suffix with attribute or namespace node as appropriate-->
  <xsl:if test="not(self::*)">
    <xsl:text>/</xsl:text>
    <xsl:if test="count(../@*) = count(.|../@*)">@</xsl:if>
    <xsl:if test="count(../namespace::*) = count(.|../namespace::*)">
      <xsl:text>namespace::</xsl:text>
    </xsl:if>
    <xsl:value-of select="name(.)"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>