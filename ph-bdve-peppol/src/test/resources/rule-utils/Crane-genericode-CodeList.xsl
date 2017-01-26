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
              xmlns:g-old="http://genericode.org/2006/ns/CodeList/0.4/"
              xmlns:g="http://docs.oasis-open.org/codelist/ns/genericode/1.0/"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:ccs="urn:x-Crane:ss:Crane-Constraints2Schematron"
                xmlns:xslo="dummy"
                version="1.0"
                exclude-result-prefixes="g g-old xs ccs xslo">

<xs:doc info="$Id: Crane-genericode-CodeList.xsl,v 1.14 2013/02/07 19:21:11 admin Exp $"
        filename="Crane-genericode-CodeList.xsl" internal-ns="ccs" 
        global-ns="xs" vocabulary="DocBook">
  <xs:title>CVA support for genericode list-level definitions</xs:title>
  <para>
    Support for an implementation of the OASIS context/value association files
    of genericode files.
  </para>
  <para>
    This fragment supports external code list expressions of code list values
    written using either genericode 0.4 or genericode 1.0, where those files
    use only simple values for keys.
  </para>
</xs:doc>
<!--
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
-->

<xs:variable>
  <para>A convenience variable for later use.</para>
</xs:variable>
<xsl:variable name="ccs:apos" select='"&apos;"'/>

<xs:template>
  <para>
    Determine the presence of a document with the expected document element.
  </para>
  <para>Returns the string of an error message if there is a problem</para>
  <xs:param  name="valuelist">
    <para>The supplied declaration of the external value list</para>
  </xs:param>
  <xs:param name="doc">
    <para>The root node of the external value list</para>
  </xs:param>
  <xs:param name="check-only-document-existence">
    <para>
      For the masquerading code list file, there are no constraints other
      than it exists and is of the correct document type.
    </para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:code-list-confirm-instance">
  <xsl:param name="valuelist"/>
  <xsl:param name="doc"/>
  <xsl:param name="check-only-document-existence"/>
  <xsl:choose>
    <xsl:when test="not($doc/g:CodeList) and not($doc/g-old:CodeList)">
      <xsl:text>Resource for value list "</xsl:text>
      <xsl:value-of select="$valuelist/@xml:id"/>
      <xsl:text>" points to the document element {</xsl:text>
      <xsl:for-each select="$doc/*">
        <xsl:value-of select="concat(namespace-uri(.),'}',local-name(.))"/>
      </xsl:for-each>
      <xsl:text> and not to either {</xsl:text>
      <xsl:value-of select="document('')/*/namespace::g"/>
      <xsl:text>}CodeList or {</xsl:text>
      <xsl:value-of select="document('')/*/namespace::g-old"/>
      <xsl:text>}CodeList: </xsl:text>
      <xsl:value-of select="$valuelist/@uri"/>
    </xsl:when>
    <xsl:when test="$check-only-document-existence">
      <!--stop with the other kinds of checks as they are irrelevant-->
    </xsl:when>
    <xsl:when test="not($doc/*/ColumnSet/Key)">
      <xsl:text>No column declared as a key in the value list "</xsl:text>
      <xsl:value-of select="$valuelist/@xml:id"/>
      <xsl:text>": </xsl:text>
      <xsl:value-of select="$valuelist/@uri"/>
    </xsl:when>
    <xsl:when test="string($valuelist/@key) and 
                    not($doc/*/ColumnSet/Key[normalize-space(@Id)=
                                           normalize-space($valuelist/@key)])">
      <xsl:text>Declared key "</xsl:text>
      <xsl:value-of select="normalize-space($valuelist/@key)"/>
      <xsl:text>" for value list "</xsl:text>
      <xsl:value-of select="$valuelist/@xml:id"/>
      <xsl:text>" not found: </xsl:text>
      <xsl:value-of select="$valuelist/@uri"/>
    </xsl:when>
    <xsl:when test="string($valuelist/@key) and 
                    count($doc/*/ColumnSet/Key[normalize-space(@Id)=
                            normalize-space($valuelist/@key)]/ColumnRef) != 1">
      <xsl:text>Declared key "</xsl:text>
      <xsl:value-of select="normalize-space($valuelist/@key)"/>
      <xsl:text>" for value list "</xsl:text>
      <xsl:value-of select="$valuelist/@xml:id"/>
      <xsl:text>" is not limited to a single column reference: </xsl:text>
      <xsl:value-of select="$valuelist/@uri"/>
    </xsl:when>
    <xsl:when test="not(string($valuelist/@key)) and
                    count($doc/*/ColumnSet/Key) != 1">
      <xsl:text>No chosen key for value list "</xsl:text>
      <xsl:value-of select="$valuelist/@xml:id"/>
      <xsl:text>" that references a list containing multiple keys: </xsl:text>
      <xsl:value-of select="$valuelist/@uri"/>
    </xsl:when>
    <xsl:when test="not(string($valuelist/@key)) and
                    count($doc/*/ColumnSet/Key/ColumnRef) != 1">
      <xsl:text>Default key for value list "</xsl:text>
      <xsl:value-of select="$valuelist/@xml:id"/>
      <xsl:text>" is not limited to a single column reference: </xsl:text>
      <xsl:value-of select="$valuelist/@uri"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>
    Build Schematron <literal>&lt;rule></literal> elements using the selection
    of available values.
  </para>
  <para>
    Note the liberal use of newline sequences in the result using 
    <literal>&lt;xsl:text></literal> in order to make the end result legible
    to a reader; these have no effect on the well-formedness of the result or
    the Schematron validation.
  </para>
  <xs:param name="context">
    <para>The context for which the rules are being made.</para>
  </xs:param>
  <xs:param name="address">
    <para>The XPath address of the information item being tested.</para>
  </xs:param>
  <xs:param name="valuelists-referenced">
    <para>
      The <literal>&lt;ValueList></literal> elements being referenced by the
      context.
    </para>
  </xs:param>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:code-list-make-rule">
  <xsl:param name="context"/>
  <xsl:param name="address"/>
  <xsl:param name="valuelists-referenced"/>
  <xsl:param name="assoc-uri"/>

  <xsl:for-each select="$valuelists-referenced">
    <xsl:variable name="list" select="."/>
    <xsl:variable name="key" select="normalize-space(@key)"/>
    <xsl:variable name="keyColumnRef"
                  select="document(@uri,.)/*/ColumnSet/
                          Key[( $key and @Id=$key ) or 
                              ( not( $key ) and position()=1 )]/
                          ColumnRef/@Ref"/>
    <xsl:variable name="delimitedValues">
      <!--walk through all values finding those that are key values-->
      <xsl:for-each select="document(@uri,.)/*/SimpleCodeList/Row/Value">
        <!--determine the column reference of the given column-->
        <xsl:variable name="thisValueReference">
          <xsl:choose>
            <xsl:when test="@ColumnRef">
              <!--the reference is given, no need to hunt it down-->
              <xsl:value-of select="@ColumnRef"/>
            </xsl:when>
            <xsl:otherwise>
              <!--the closest column that is actually referenced-->
              <xsl:variable name="previousRef"
                  select="preceding-sibling::Value[@ColumnRef][1]/@ColumnRef"/>
              <xsl:choose>
                <xsl:when test="not($previousRef)">
                  <!--count from the first column definition-->
                  <xsl:value-of select="../../../ColumnSet/Column[1 +
                                  count( current()/preceding-sibling::Value )]/
                                    @Id"/>
                </xsl:when>
                <xsl:otherwise>
              <xsl:value-of select="../../../ColumnSet/Column[@Id=$previousRef]
                                    /following-sibling::Column[
                            count( current()/preceding-sibling::Value ) -
                            count( $previousRef/../preceding-sibling::Value )]/
                                    @Id"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>
        <!--is this what we are looking for?-->
        <xsl:if test="$thisValueReference=$keyColumnRef">
          <xsl:value-of select="SimpleValue"/>
          <!--delimit this with a Unicode character likely never used-->
          <xsl:text>&#x7f;</xsl:text>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    
    <!--only do work if any key values were actually found-->
    <xsl:if test="string($delimitedValues)">
      <!--separate each comparison with an 'or' since any could be true-->
      <xsl:text> or ( </xsl:text>
      <!--trigger the metadata calculation for this code list-->
      <xsl:for-each select="key('ccs:metadatasets',
                            normalize-space($context/@metadata))">
        <xslo:call-template name="{generate-id(.)}">
          <xslo:with-param name="values-id" 
                           select="'{generate-id($list)}'"/>
        </xslo:call-template>
      </xsl:for-each>
      <!--values of information item for this particular context-->
      <xsl:text>contains('&#x7f;</xsl:text>
      <xsl:choose>
        <xsl:when test="contains($delimitedValues,$ccs:apos) or
                        contains($delimitedValues,'&quot;')">
          <!--special case when dealing with apostrophes or quotes-->
          <!--use Unicode internal character U+FFD1 for single quote-->
          <!--use Unicode internal character U+FFD2 for double quote-->
          <xsl:value-of select="translate(
                                        translate($delimitedValues,$ccs:apos,
                                                                   '&#xffd1;'),
                                          '&quot;','&#xffd2;')"/>
          <xsl:text>',concat('&#x7f;',translate(</xsl:text>
                           <xsl:text>translate(.,$apos,'&#xffd1;'),</xsl:text>
                              <xsl:text>'&quot;','&#xffd2;'),</xsl:text>
                   <xsl:text>'&#x7f;')</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <!--no special characters needing handling here-->
          <xsl:value-of select="$delimitedValues"/>
          <xsl:text>',concat('&#x7f;',.,'&#x7f;')</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:text>) )</xsl:text>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Check the value at the current node is acceptable for the implementation
    of XPath string checks.
  </para>
  <xs:param  name="list">
    <para>The supplied declaration of the external value list</para>
  </xs:param>
</xs:template>
<xsl:template name="ccs:check-value-validity">
  <xsl:param name="list"/>
  <!--in support of above, this is broken out because it has no variables-->
  <xsl:if test="contains(.,&#34;'&#34;) and contains(.,'&#34;')">
    <xsl:message terminate="yes">
      <xsl:text>This implementation does not support a key value </xsl:text>
      <xsl:text>containing both a single quote and a double quote: "</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>" in list: xmlid="</xsl:text>
      <xsl:value-of select="$list/@xml:id"/>"<xsl:text/>
    </xsl:message>
  </xsl:if>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Replicating identification information</xs:title>
  <para>
    For use in the second pass, the three sources of metadata are copied
    here in order of precedence, such that during the second pass the
    first metadata item encountered is the one used.
  </para>
</xs:doc>

<xs:template>
  <para>
    For each value list, copy the internal masquerading, the external
    masquarading, and the actual metadata.
  </para>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
</xs:template>
<xsl:template match="ValueList">
  <xsl:param name="assoc-uri"/>
  <xsl:text>

</xsl:text>
  <xsl:comment>{<xsl:value-of select="$assoc-uri"/>
    <xsl:text/>}(<xsl:value-of select="@xml:id"/>)</xsl:comment>
  <xsl:text>
</xsl:text>
  <ccs:Identification xml:id="{generate-id(.)}">
    <xsl:if test="Identification">
      <!--add some cosmetics-->
      <xsl:text>
</xsl:text>
    </xsl:if>
    <!--internal masquerading metadata has precedence over external metadata-->
    <xsl:apply-templates mode="ccs:Identification" select="Identification"/>
    <!--external maquerading metadata has precedence over external metadata-->
    <xsl:text>
</xsl:text>
    <xsl:apply-templates mode="ccs:Identification" 
                         select="document(@masqueradeUri,.)/*/Identification"/>
    <!--external actual metadata from the list being used-->
    <xsl:text>
</xsl:text>
    <xsl:apply-templates mode="ccs:Identification" 
                         select="document(@uri,.)/*/Identification"/>
  </ccs:Identification>
</xsl:template>

<xs:template>
  <para>Annotations are not needed</para>
</xs:template>
<xsl:template mode="ccs:Identification" match="Annotation"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Metadata templates for second pass</xs:title>
</xs:doc>

<xs:template>
  <para>Prepare any XSLT global constructs.</para>
</xs:template>
<xsl:template name="ccs:global-stylesheet-properties">
  <!--will need a key during the second pass-->
  <xsl:text>

</xsl:text>
  <xslo:key name="identification" match="ccs:Identification"
            use="@xml:id"/>
</xsl:template>

<xs:template>
  <para>Create a callable template for synthesizing metadata checks.</para>
  <para>
    Note that this has a lot of cosmetics in order to be visually
    verifiable in the end result.
  </para>
  <xs:param name="assoc-uri">
    <para>The URI string of the association file being processed.</para>
  </xs:param>
</xs:template>
<xsl:template match="InstanceMetadataSet">
  <xsl:param name="assoc-uri"/>
  <xsl:text>

</xsl:text>
  <xsl:comment>{<xsl:value-of select="$assoc-uri"/>
    <xsl:text/>}[<xsl:value-of select="@xml:id"/>]</xsl:comment>
  <xsl:text>
</xsl:text>
  <xslo:template name="{generate-id(.)}">
  <xsl:text>
  </xsl:text>
  <xslo:param name="values-id"/>
  <xsl:text>
  </xsl:text>
  <xsl:for-each select="InstanceMetadata">
  <xsl:text>
  </xsl:text>
  <xslo:variable name="metadata-{position()}"
                 select="key('identification',$values-id)/
                         *[({@identification})[normalize-space(.)]][1]"/>
  <xsl:text>
  </xsl:text>
  <xslo:text>( </xslo:text>
  <xsl:text>
  </xsl:text>
  <xslo:choose>
  <xsl:text>
    </xsl:text>
    <xslo:when test="$metadata-{position()}">
      <xsl:text>
      </xsl:text>
      <!--the first identification set with qualifying metadata, and then
          only if that qualifying metadata is not empty-->
      <xslo:for-each select="$metadata-{position()}">
        <xsl:text>
        </xsl:text>
        <xslo:if test="position()>1"> or </xslo:if>
        <xsl:text>
        </xsl:text>
        <xslo:text>not(<xsl:value-of select="@address"/>!='</xslo:text>
        <xsl:text>
        </xsl:text>
        <xslo:value-of select="({@identification})[normalize-space(.)][1]"/>
        <xsl:text>
        </xsl:text>
        <xslo:text>')</xslo:text>
        <xsl:text>
      </xsl:text>
      </xslo:for-each>
      <xsl:text>
    </xsl:text>
    </xslo:when>
    <xsl:text>
    </xsl:text>
    <xslo:otherwise>
      <xsl:text>
      </xsl:text>
      <xslo:text>not(<xsl:value-of select="@address"/>!='')</xslo:text>
      <xsl:text>
    </xsl:text>
    </xslo:otherwise>
    <xsl:text>
  </xsl:text>
  </xslo:choose>
  <xsl:text>
  </xsl:text>
  <xslo:text> ) and </xslo:text>
  <xsl:text>
  </xsl:text>
  </xsl:for-each>
  <xsl:text>
</xsl:text>
</xslo:template>
</xsl:template>

</xsl:stylesheet>
