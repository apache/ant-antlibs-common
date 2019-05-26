<?xml version="1.0" encoding="utf-8"?>
<!--
   Licensed to the Apache Software Foundation (ASF) under one or more
   contributor license agreements.  See the NOTICE file distributed with
   this work for additional information regarding copyright ownership.
   The ASF licenses this file to You under the Apache License, Version 2.0
   (the "License"); you may not use this file except in compliance with
   the License.  You may obtain a copy of the License at

       https://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/document/release[1]">
    <body>
      <h1>
        <xsl:text>Changes in </xsl:text>
        <xsl:value-of select="@version"/>
      </h1>
      <h2>
        <xsl:text>Changes that Could Break Older Environments:</xsl:text>
      </h2>
      <ul>
        <xsl:apply-templates select="./action[@breaks-bwc='true']" mode="li"/>
      </ul>
      <h2>
        <xsl:text>Fixed Bugs:</xsl:text>
      </h2>
      <ul>
        <xsl:apply-templates select="./action[@type='fix']" mode="li"/>
      </ul>
      <h2>
        <xsl:text>Other Changes:</xsl:text>
      </h2>
      <ul>
        <xsl:apply-templates select="./action[not(@type='fix')]" mode="li"/>
      </ul>
    </body>
  </xsl:template>

  <xsl:template match="action" mode="li">
    <li>
      <xsl:value-of select="text()"/>
      <xsl:if test="@issue and not(@issue='')">
        <a>
          <xsl:attribute name="href">https://issues.apache.org/bugzilla/show_bug.cgi?id=<xsl:value-of select="@issue"/></xsl:attribute>
          <xsl:text>BugZilla Issue </xsl:text><xsl:value-of select="@issue"/><xsl:text></xsl:text>
        </a>
      </xsl:if>
    </li>
  </xsl:template>

  <!-- dont copy the text and unmatched nodes as per default in xsl -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
