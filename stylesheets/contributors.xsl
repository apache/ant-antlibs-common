<?xml version="1.0"?>
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
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="no" method="text" encoding="ISO-8859-1"/>

  <!-- the root node -->
  <xsl:template match="/contributors">
    <xsl:value-of select="introduction"/>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="name">
    <xsl:value-of select="first"/>
    <xsl:text> </xsl:text>
    <xsl:if test="middle">
      <xsl:value-of select="middle"/>
      <xsl:text> </xsl:text>
    </xsl:if>
    <xsl:value-of select="last"/>
  </xsl:template>


  <!-- dont copy the text and unmatched nodes as per default in xsl -->
  <xsl:template match="*"/>

</xsl:stylesheet>
