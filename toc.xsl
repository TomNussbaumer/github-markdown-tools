<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text" omit-xml-declaration="yes" />

<xsl:template match="/html/body">
  <xsl:apply-templates select="*[self::h1 or self::h2 or self::h3 or self::h4 or self::h5 or self::h6 or self::h7]"/>
</xsl:template>

<xsl:template match="h1">  * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>
<xsl:template match="h2">    * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>
<xsl:template match="h3">      * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>
<xsl:template match="h4">        * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>
<xsl:template match="h5">          * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>
<xsl:template match="h6">            * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>
<xsl:template match="h7">              * [<xsl:value-of select="normalize-space(.)"/>](<xsl:value-of select="a/@href"/>)<xsl:text>&#xa;</xsl:text></xsl:template>

</xsl:stylesheet> 
