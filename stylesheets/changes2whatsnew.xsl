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

  <xsl:output method="text" indent="no"/>

  <xsl:template match="release">
    <xsl:text>Changes in </xsl:text>
    <xsl:value-of select="@version"/>
    <xsl:text>
</xsl:text>
    <xsl:text>==============================================

</xsl:text>
    <xsl:text>Changes that Could Break Older Environments:
--------------------------------------------

</xsl:text>

    <xsl:apply-templates select="./action[@breaks-bwc='true']" mode="li"/>

    <xsl:text>Fixed Bugs:
-----------

</xsl:text>

    <xsl:apply-templates select="./action[@type='fix' and not(@breaks-bwc='true')]" mode="li"/>

    <xsl:text>Other Changes:
--------------

</xsl:text>

    <xsl:apply-templates select="./action[not(@type='fix') and not(@breaks-bwc='true')]" mode="li"/>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="action" mode="li">
    <xsl:value-of select="text()"/>
    <xsl:if test="@issue and not(@issue='')">
      <xsl:text>
        BugZilla Issue </xsl:text><xsl:value-of select="@issue"/><xsl:text>
      </xsl:text>
    </xsl:if>
    <xsl:text>
</xsl:text>
  </xsl:template>

  <!-- dont copy the text and unmatched nodes as per default in xsl -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
