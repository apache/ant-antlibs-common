<?xml version="1.0" encoding="utf-8"?>
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
      <xsl:if test="not(@issue='')">
        <a>
          <xsl:attribute name="href">http://issues.apache.org/bugzilla/show_bug.cgi?id=<xsl:value-of select="@issue"/></xsl:attribute>
          <xsl:text>BugZilla Issue </xsl:text><xsl:value-of select="@issue"/><xsl:text></xsl:text>
        </a>
      </xsl:if>
    </li>
  </xsl:template>

  <!-- dont copy the text and unmatched nodes as per default in xsl -->
  <xsl:template match="text()"/>

</xsl:stylesheet>
