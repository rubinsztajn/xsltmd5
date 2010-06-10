<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" encoding="utf-8" doctype-public="-//W3C//DTD XHTML+RDFa 1.0//EN" doctype-system="http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd" />

<xsl:strip-space elements="*"/>

<xsl:include href="print.xsl"/>
<xsl:include href="browseref.xsl"/>


<xsl:template match="/">
<xsl:element name="html">
<xsl:element name="head">

<xsl:comment>Version 3.0 modified July 2008</xsl:comment>

<link type="text/css" rel="stylesheet" href="../../static/css/weasel.css" />

<xsl:element name="title">
<xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper"/>
<xsl:text>: Contents List</xsl:text>
</xsl:element>

<xsl:call-template name="metadata" />

</xsl:element>

<xsl:element name="body">
<xsl:call-template name="masthead" />
<xsl:call-template name="table" />
<xsl:element name="div"><xsl:attribute name="class">bitfootplacement</xsl:attribute>.</xsl:element>
<xsl:call-template name="footer" />
</xsl:element>
</xsl:element>
</xsl:template>



<!-- Generates the table that forms the primary contents of the page.  -->

<xsl:template name="table">
<xsl:element name="table">
<xsl:attribute name="class">orangeline</xsl:attribute>
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">navpanelcenter</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">archname</xsl:attribute>
<a href="./list"><xsl:apply-templates select="ead/archdesc/did/repository" /></a>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">spacebelow</xsl:attribute>
<xsl:for-each select="ead/eadheader/filedesc">
<xsl:call-template name="miniseal" />
</xsl:for-each>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">collname</xsl:attribute>
<xsl:value-of select="ead/archdesc/did/unittitle" />
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">tocdata</xsl:attribute>
<xsl:attribute name="style">width:200px;</xsl:attribute>

<xsl:call-template name="toc" />
</xsl:element>
</xsl:element>
<xsl:element name="td">
<xsl:attribute name="class">navcontent</xsl:attribute>
<xsl:attribute name="style">width:810px;</xsl:attribute>
<xsl:element name="div"><xsl:attribute name="class">dschead</xsl:attribute>
<xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise>Contents List</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="style">width:99%;</xsl:attribute>
<xsl:call-template name="dscindepth" />
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:template>


<!-- Generates the content of the table of contents.  -->


<xsl:template name="toc">
<xsl:element name="div">
<xsl:attribute name="class">insetleftwee</xsl:attribute>
Browse Finding Aid: 
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">insetleft</xsl:attribute>
<xsl:if test="ead/archdesc/did">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_main.html"><xsl:choose><xsl:when test="ead/archdesc/did/head"><xsl:value-of select="ead/archdesc/did/head" /></xsl:when><xsl:otherwise>Collection Overview</xsl:otherwise></xsl:choose></a></xsl:element>
</xsl:if>
<xsl:if test="ead/frontmatter/div">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_div.html"><xsl:value-of select="ead/frontmatter/div/head" /></a></xsl:element>
</xsl:if>
<xsl:if test="ead/archdesc/bioghist">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_bioghist.html"><xsl:choose><xsl:when test="ead/archdesc/bioghist/head"><xsl:value-of select="ead/archdesc/bioghist/head" /></xsl:when><xsl:otherwise>Biographical Note</xsl:otherwise></xsl:choose></a></xsl:element>
</xsl:if>
<xsl:if test="ead/archdesc/scopecontent">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_scope.html">
<xsl:choose><xsl:when test="ead/archdesc/scopecontent/head"><xsl:value-of select="ead/archdesc/scopecontent/head" /></xsl:when><xsl:otherwise>Scope and Content</xsl:otherwise></xsl:choose></a></xsl:element>
</xsl:if>
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_admin.html">Information on Use</a></xsl:element>
<xsl:if test="ead/archdesc/descgrp[@type='add'] | ead/archdesc/relatedmaterial | ead/archdesc/separatedmaterial | ead/archdesc/otherfindaid | ead/archdesc/bibliography | ead/archdesc/note">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_add.html">Additional Information</a></xsl:element>
</xsl:if>
<xsl:if test="ead/archdesc/odd[@id='odd-desc']">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_odd.html"><xsl:choose><xsl:when test="ead/archdesc/odd/head"><xsl:value-of select="ead/archdesc/odd/head" /></xsl:when><xsl:otherwise>Other Descriptive Information</xsl:otherwise></xsl:choose></a>
</xsl:element>
</xsl:if>
<xsl:if test="ead/archdesc/odd">
<xsl:choose>
<xsl:when test="ead/archdesc/odd[@id='odd-desc']">
</xsl:when>
<xsl:otherwise>
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_odd.html"><xsl:choose><xsl:when test="ead/archdesc/odd/head"><xsl:value-of select="ead/archdesc/odd/head" /></xsl:when><xsl:otherwise>Other Descriptive Information</xsl:otherwise></xsl:choose></a>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="ead/archdesc/descgrp/index | ead/archdesc/index">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_index.html"><xsl:value-of select="ead/archdesc/descgrp/index/head | ead/archdesc/index/head" /></a></xsl:element>
</xsl:if>
<xsl:if test="ead/archdesc/controlaccess">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_subj.html"><xsl:choose><xsl:when test="ead/archdesc/controlaccess/head"><xsl:value-of select="ead/archdesc/controlaccess/head" /></xsl:when><xsl:otherwise>Search Terms</xsl:otherwise></xsl:choose></a></xsl:element>
</xsl:if>
<xsl:if test="/ead/archdesc/dsc[@type='analyticover']">
<xsl:element name="div"><xsl:attribute name="class">toc</xsl:attribute><xsl:text>- </xsl:text><a href="{$file}_series.html">Series Descriptions</a></xsl:element>
</xsl:if>
<xsl:if test="/ead/archdesc/dsc[@type='in-depth'] | /ead/archdesc/dsc[@type='combined']">
<xsl:element name="div"><xsl:attribute name="class">vtoc</xsl:attribute><xsl:text>&gt; </xsl:text>Contents List</xsl:element>
</xsl:if>
</xsl:element>
<xsl:element name="br" />&#x00A0; 
<xsl:element name="div"><xsl:attribute name="class">lines</xsl:attribute>
<a href="{$file}.html">View Entire Finding Aid</a>
</xsl:element>
<xsl:if test="ead/archdesc/descgrp/altformavail[@type='digital']"><xsl:call-template name="digital" /></xsl:if>
</xsl:template>
<xsl:template name="digital">
<xsl:element name="br" />Selected items available online: <xsl:element name="br" /><xsl:for-each select="ead/archdesc/descgrp/altformavail/p/extref">
<xsl:apply-templates select="." />
<xsl:element name="br" />
</xsl:for-each>
<xsl:element name="br" />
</xsl:template>


<xsl:template name="dscindepth">
<xsl:for-each select="ead/archdesc/dsc[@type='in-depth'] | ead/archdesc/dsc[@type='combined'] | ead/archdesc/dsc[@type='othertype']">
<xsl:for-each select="c01">
<xsl:call-template name="c01"/>
</xsl:for-each>
</xsl:for-each>
</xsl:template>



</xsl:stylesheet>
