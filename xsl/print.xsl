<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:strip-space elements="*" />
    <xsl:output method="xhtml" encoding="utf-8" doctype-public="-//W3C//DTD XHTML+RDFa 1.0//EN" doctype-system="http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd" />

<xsl:variable name="file">
<xsl:value-of select="ead/eadheader/eadid" />
</xsl:variable>


<xsl:include href="fcaddress.xsl"/>
<xsl:include href="dsc.xsl"/>


<xsl:template match="/">
<xsl:element name="html">
<xsl:element name="head">
<xsl:comment>Stylesheet version 6.0 :: September 2008</xsl:comment>
<xsl:element name="link">
    <xsl:attribute name="type">text/css</xsl:attribute>
    <xsl:attribute name="rel">stylesheet</xsl:attribute>
    <xsl:attribute name="href">http://asteria.fivecolleges.edu/static/css/weasel.css</xsl:attribute>
</xsl:element>
<!--    
    <link type="text/css" rel="stylesheet" href="http://asteria.fivecolleges.edu/static/css/weasel.css"/>
-->
<xsl:element name="title">
<xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper" />
<xsl:text>  </xsl:text>
</xsl:element>
<xsl:call-template name="metadata" />


</xsl:element>
<xsl:element name="body">
<xsl:call-template name="masthead" />
<xsl:element name="div"><xsl:attribute name="class">postmasthead</xsl:attribute>
<xsl:call-template name="body" />
</xsl:element>
</xsl:element>
</xsl:element>

</xsl:template>

<!-- Generate RDFa snippet -->
<xsl:template name="rdfa">
    <div xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:pvn="http://purl.org/archival/provenance/0.1#" xmlns:bibo="http://purl.org/ontology/bibo/" xmlns:vcard="http://www.w3.org/2006/vcard/ns#">
    <xsl:element name="div">
        <xsl:attribute name="about">#collection</xsl:attribute>
        <xsl:attribute name="typeof">pvn:Collection</xsl:attribute>
        <xsl:element name="div">
            <xsl:attribute name="property">dcterms:title</xsl:attribute>
            <xsl:attribute name="content">
                <xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper" />
                <xsl:text>  </xsl:text><xsl:value-of select="ead/eadheader/filedesc/titlestmt/subtitle" />
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="property">dcterms:creator</xsl:attribute>
            <xsl:attribute name="resource">
                <!-- Grab name, hashify, store in $hashed_name, and add to end of URI -->
                <xsl:variable name="name" select="ead/archdesc/did/origination"></xsl:variable>
                 <xsl:variable name="hashed_name" select="md5($name)"></xsl:variable>
                 <xsl:text>http://gslis.simmons.edu/archival/ </xsl:text>
                 <xsl:value-of select="$hashed_name"/>   
            </xsl:attribute>
            </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="property">dcterms:extent</xsl:attribute>
            <xsl:attribute name="content">
                        <xsl:for-each select="//extent">
                            <xsl:apply-templates /><xsl:text> </xsl:text>
                    </xsl:for-each>
            </xsl:attribute>
        </xsl:element>
        <xsl:if test="ead/archdesc/did/abstract">
        <xsl:element name="div">
            <xsl:attribute name="property">dcterms:abstract</xsl:attribute>
            <xsl:attribute name="content">
                <xsl:value-of select="ead/archdesc/did/abstract"/>
            </xsl:attribute>
        </xsl:element>
        </xsl:if>
        <xsl:element name="div">
            <xsl:attribute name="rel">pvn:heldBy</xsl:attribute>
            <xsl:element name="div">
                <xsl:attribute name="about">http://www.library.umass.edu/spcoll#organization</xsl:attribute>
                <xsl:attribute name="typeof">foaf:Organization</xsl:attribute>
             <xsl:element name="span">
                    <xsl:attribute name="property">foaf:name</xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:for-each select="ead/archdesc/did/repository/corpname"><xsl:apply-templates /></xsl:for-each>
                    </xsl:attribute>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:element>  
        </div>
</xsl:template>

<xsl:template name="metadata">
<xsl:element name="meta">
<xsl:attribute name="http-equiv">content-type</xsl:attribute>
<xsl:attribute name="content">text/html; charset=utf-8</xsl:attribute>
</xsl:element>

<xsl:element name="meta">
<xsl:attribute name="name">dc.title</xsl:attribute>
<xsl:attribute name="content">
<xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper" />
<xsl:text>  </xsl:text><xsl:value-of select="ead/eadheader/filedesc/titlestmt/subtitle" />
</xsl:attribute>
</xsl:element>
<xsl:element name="meta">
<xsl:attribute name="name">dc.creator</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="ead/archdesc/did/origination" /></xsl:attribute>
</xsl:element>
<xsl:for-each select="ead//controlaccess/persname | ead//controlaccess/corpname"><xsl:choose>
<xsl:when test="@encodinganalog='600'">
<xsl:element name="meta"><xsl:attribute name="name">dc.subject</xsl:attribute><xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="@encodinganalog='610 | 697'"> 
<xsl:element name="meta"><xsl:attribute name="name">dc.subject</xsl:attribute><xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="@encodinganalog='611'"> 
<xsl:element name="meta">
<xsl:attribute name="name">dc.subject</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:when>
<xsl:when test="@encodinganalog='690'"> 
<xsl:element name="meta">
<xsl:attribute name="name">dc.subject</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:when>
<xsl:when test="@encodinganalog='700'"> 
<xsl:element name="meta">
<xsl:attribute name="name">dc.contributor</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:when>
<xsl:when test="@encodinganalog='710'"> 
<xsl:element name="meta">
<xsl:attribute name="name">dc.contributor</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:when>
<xsl:when test="@encodinganalog='790'"> 
<xsl:element name="meta">
<xsl:attribute name="name">dc.contributor</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:element name="meta">
<xsl:attribute name="name">dc.contributor</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
<xsl:for-each select="ead//controlaccess/subject | ead//controlaccess/famname | ead//controlaccess/function | ead//controlaccess/occupation">
<xsl:element name="meta">
<xsl:attribute name="name">dc.subject</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:for-each>
<xsl:element name="meta">
<xsl:attribute name="name">dc.title</xsl:attribute>
<xsl:attribute name="content">
<xsl:for-each select="ead/archdesc/did/unittitle">
<xsl:apply-templates select="text()|*[not(self::unitdate)]"/><xsl:if test="unitdate">, <xsl:apply-templates select="unitdate" /></xsl:if>
</xsl:for-each><xsl:if test="unitdate">, <xsl:apply-templates select="unitdate" /></xsl:if>
</xsl:attribute>
</xsl:element>
<xsl:element name="meta">
<xsl:attribute name="name">dc.type</xsl:attribute>
<xsl:attribute name="content">Text</xsl:attribute>
</xsl:element>
<xsl:element name="meta">
<xsl:attribute name="name">dc.format</xsl:attribute>
<xsl:attribute name="content">Manuscripts</xsl:attribute>
</xsl:element>
<xsl:element name="meta">
<xsl:attribute name="name">dc.format</xsl:attribute>
<xsl:attribute name="content">Finding aids</xsl:attribute>
</xsl:element>
<xsl:for-each select="ead//controlaccess/genreform">
<xsl:element name="meta">
<xsl:attribute name="name">dc.format</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:for-each>
<xsl:for-each select="ead//controlaccess/geogname">
<xsl:element name="meta">
<xsl:attribute name="name">dc.coverage</xsl:attribute>
<xsl:attribute name="content"><xsl:value-of select="." /></xsl:attribute>
</xsl:element>
</xsl:for-each>
<xsl:if test="ead/archdesc/did/abstract">
<xsl:element name="meta"><xsl:attribute name="id">dc.description</xsl:attribute><xsl:attribute name="content"><xsl:value-of select="ead/archdesc/did/abstract" /></xsl:attribute></xsl:element>
</xsl:if>
</xsl:template>



<xsl:template name="body">
    
<xsl:call-template name="rdfa"></xsl:call-template>    
<xsl:element name="div">
<xsl:attribute name="class">fcseal</xsl:attribute>
<xsl:for-each select="ead/eadheader/filedesc">
<xsl:call-template name="seal" />
</xsl:for-each>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">fcheader</xsl:attribute>
<xsl:call-template name="righthandframe" />
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">belowthefold</xsl:attribute>
<xsl:element name="p"><xsl:attribute name="class">lineabove</xsl:attribute></xsl:element>
<xsl:call-template name="restofthebody" />
</xsl:element>
</xsl:template>


<xsl:template name="righthandframe">
<xsl:for-each select="ead/archdesc/did">
<xsl:element name="div">
<xsl:attribute name="class">centerfront</xsl:attribute>
<xsl:attribute name="id">maintext</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">left</xsl:attribute>
<xsl:element name="span"><xsl:attribute name="class">fourteenpt</xsl:attribute>
    
<xsl:for-each select="unittitle">
<xsl:apply-templates select="text()|*[not(self::unitdate)]"/><xsl:if test="unitdate">, <xsl:apply-templates select="unitdate" /></xsl:if>
</xsl:for-each><xsl:if test="unitdate">, <xsl:apply-templates select="unitdate" /></xsl:if>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">thirteenpttitle</xsl:attribute>
<xsl:for-each select="physdesc">
<xsl:choose>
<xsl:when test="extent">
<xsl:for-each select="extent">
<xsl:apply-templates /><xsl:text>  </xsl:text>
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates />
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
<xsl:for-each select="unitid">
<xsl:element name="div">Collection number: <xsl:apply-templates /><xsl:if test="../physloc"><xsl:text> </xsl:text>(<xsl:apply-templates select="../physloc" />)</xsl:if></xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:for-each>
<xsl:element name="p"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">abstractspace</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">abstractsandwich</xsl:attribute>
<xsl:for-each select="ead/archdesc/did">
<xsl:element name="div">
<xsl:attribute name="class">lead</xsl:attribute>
<xsl:choose><xsl:when test="abstract/head"><xsl:value-of select="abstract/head" /></xsl:when><xsl:otherwise>Abstract:</xsl:otherwise></xsl:choose>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">abstract</xsl:attribute>
<xsl:for-each select="abstract">
<xsl:apply-templates />
</xsl:for-each>
</xsl:element>
<xsl:if test="ancestor::ead/archdesc//accessrestrict | ancestor::ead/archdesc//userestrict">
<xsl:element name="p"><xsl:attribute name="class">leftwoem</xsl:attribute>
<xsl:element name="span"><xsl:attribute name="class">ruddy</xsl:attribute>Terms of Access and Use:<xsl:text>  </xsl:text></xsl:element>
<xsl:if test="ancestor::ead/archdesc//accessrestrict">
<xsl:element name="div">
<xsl:if test="ancestor::ead/archdesc//userestrict">
<xsl:element name="span"><xsl:attribute name="style">color:#6b5a5a;</xsl:attribute>Restrictions on access: </xsl:element>
</xsl:if>
<xsl:for-each select="ancestor::ead/archdesc//accessrestrict">
<xsl:for-each select="*[not(ancestor::dsc)]">
<xsl:apply-templates select="." />
</xsl:for-each>
</xsl:for-each>
</xsl:element>
</xsl:if>
<xsl:if test="ancestor::ead/archdesc//userestrict">
<xsl:element name="span"><xsl:attribute name="style">color:#6b5a5a;</xsl:attribute>Restrictions on use: </xsl:element>
<xsl:for-each select="ancestor::ead/archdesc//userestrict">
<xsl:for-each select="*[not(ancestor::dsc)]">
<xsl:apply-templates select="." />
</xsl:for-each>
</xsl:for-each>
</xsl:if>
</xsl:element>
</xsl:if>

</xsl:for-each>
</xsl:element>
</xsl:element>
<xsl:for-each select="ead/archdesc/did">
<xsl:element name="div">
<xsl:element name="div"><xsl:attribute name="class">institutionright</xsl:attribute>
<xsl:for-each select="repository"><xsl:apply-templates /></xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:template>



<xsl:template name="restofthebody">
<xsl:if test="ead/archdesc/bioghist">
<xsl:call-template name="archdesc-bioghist" />
</xsl:if>
<xsl:if test="ead/archdesc/scopecontent | ead/archdesc/arrangement">
<xsl:call-template name="archdesc-scopecontent" />
<xsl:element name="br"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
</xsl:if>
<xsl:if test="ead/archdesc/userestrict | ead/archdesc/accessrestrict | ead/archdesc/prefercite | ead/archdesc/altformavail | ead/archdesc/acqinfo | ead/archdesc/custodhist | ead/archdesc/originalsloc | ead/archdesc/accruals | ead/archdesc/processinfo | ead/archdesc/appraisal | ead/archdesc/phystech | ead/archdesc/materialspec | ead/archdesc/descgrp//userestrict | ead/archdesc/descgrp//accessrestrict | ead/archdesc/descgrp//prefercite | ead/archdesc/descgrp//altformavail | ead/archdesc/descgrp//acqinfo | ead/archdesc/descgrp//custodhist | ead/archdesc/descgrp//originalsloc | ead/archdesc/descgrp//accruals | ead/archdesc/descgrp//processinfo | ead/archdesc/descgrp//appraisal | ead/archdesc/descgrp//phystech | ead/archdesc/descgrp//materialspec | ead/archdesc/index | ead/archdesc/descgrp//index | ead/archdesc/odd | ead/archdesc/descgrp//odd">
<xsl:element name="p"></xsl:element>
<xsl:call-template name="admin" />
</xsl:if>
<xsl:element name="br"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
<xsl:element name="p"></xsl:element>
<xsl:call-template name="addinfo" />
<xsl:if test="not(ead//odd | ead//index)">
<xsl:element name="br"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
</xsl:if>
<xsl:if test="ead/frontmatter/div">
<xsl:call-template name="frontmatter-div" />
</xsl:if>
<xsl:call-template name="dscrung" />
<xsl:element name="br"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
<xsl:for-each select="ead/archdesc/controlaccess">
<xsl:apply-templates select="." />
<xsl:element name="br"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
</xsl:for-each>
<xsl:for-each select="ead//odd[@id='odd-app'] | ead//odd[@altrender='endoffile']">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:attribute name="style">padding-top:1.5em;</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:for-each>
<xsl:for-each select="ead//index[@id='add-index'] | ead//index[@altrender='endoffile']">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:attribute name="style">padding-top:1.5em;</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:for-each>
<xsl:call-template name="footer" />
<xsl:element name="br"><xsl:attribute name="class">clearall</xsl:attribute></xsl:element>
</xsl:template>




<xsl:template name="frontmatter-div">
<xsl:for-each select="ead/frontmatter/div">
<xsl:apply-templates />
</xsl:for-each>
</xsl:template>

<xsl:template match="ead/frontmatter/div/head">
<xsl:element name="div"><xsl:attribute name="class">thirteenpt</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:template>


<xsl:template name="archdesc-bioghist">
<xsl:if test="ead/archdesc/bioghist[string-length(text()|*)!=0]">
<xsl:for-each select="ead/archdesc/bioghist">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">thirteenred</xsl:attribute><xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise>Biographical Note</xsl:otherwise>
</xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:if>
</xsl:template>

<xsl:template match="ead/archdesc/bioghist/bioghist">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:template>


<xsl:template name="archdesc-scopecontent">
<xsl:choose>
<xsl:when test="ead/archdesc/scopecontent[string-length(text()|*)!=0]">
<xsl:for-each select="ead/archdesc/scopecontent">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">thirteenred</xsl:attribute><xsl:attribute name="style">margin-top:3em;</xsl:attribute>
<xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise>Scope and contents of the collection</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:for-each>
<xsl:call-template name="archdesc-arrangement" />
</xsl:when>
<xsl:when test="ead/archdesc/arrangement[string-length(text() | *)!=0]">
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:call-template name="archdesc-arrangement" />
</xsl:element>
</xsl:when>
</xsl:choose>
</xsl:template>


<xsl:template name="archdesc-arrangement">
<xsl:for-each select="ead/archdesc/arrangement">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:choose>
<xsl:when test="head"></xsl:when>
<xsl:otherwise><xsl:element name="span"><xsl:attribute name="class">thirteenred</xsl:attribute>Organization of the collection</xsl:element></xsl:otherwise>
</xsl:choose>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template match="descgrp">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:template>




<xsl:template name="admin">
<xsl:element name="div">
<xsl:attribute name="class">dschead</xsl:attribute>Information on Use</xsl:element>
<xsl:for-each select="ead/archdesc">
<xsl:call-template name="restrict" />
<xsl:call-template name="citation" />
<xsl:call-template name="altform" />
<xsl:call-template name="provenance" />
<xsl:call-template name="responsibility" />
<xsl:call-template name="phystech" />
<xsl:call-template name="materialspec" />

<xsl:for-each select="index | descgrp/index">
<xsl:choose>
<xsl:when test="@id='add-index' or @altrender='endoffile'">
</xsl:when>
<xsl:otherwise>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute><xsl:attribute name="style">clear:both; margin-bottom:0.75em; margin-bottom:0.75em;</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Index</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:choose>
<xsl:when test="ancestor-or-self::index[@id='add-index']"></xsl:when>
<xsl:when test="ancestor-or-self::index[@altrender='endoffile']"></xsl:when>
<xsl:otherwise>
<xsl:apply-templates />
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
<xsl:for-each select="odd | descgrp/odd">
<xsl:choose>
<xsl:when test="@id='odd-app' or @altrender='endoffile'"></xsl:when>
<xsl:otherwise>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute><xsl:attribute name="style">clear:both; margin-bottom:0.75em; margin-bottom:0.75em;</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Other Descriptive Data</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:choose>
<xsl:when test="ancestor-or-self::odd[@id='odd-app']"></xsl:when>
<xsl:when test="ancestor-or-self::odd[@altrender='endoffile']"></xsl:when>
<xsl:otherwise>
<xsl:apply-templates />
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:for-each>
</xsl:template>



<xsl:template name="restrict">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute><xsl:attribute name="id">restrictions</xsl:attribute>Terms of Access and Use</xsl:element>
<xsl:if test="accessrestrict | descgrp//accessrestrict">
<xsl:element name="div"><xsl:attribute name="class">lead2</xsl:attribute>Restrictions on access: </xsl:element>
<xsl:for-each select="accessrestrict | descgrp//accessrestrict">
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="." />
</xsl:element>
</xsl:for-each>
</xsl:if>
<xsl:if test="userestrict | descgrp//userestrict">
<xsl:element name="div"><xsl:attribute name="class">lead2</xsl:attribute>Restrictions on use: </xsl:element>
<xsl:for-each select="userestrict | descgrp//userestrict">
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:for-each>
</xsl:if>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:template>


<xsl:template name="citation">
<xsl:for-each select="prefercite | descgrp//prefercite">
<xsl:element name="div"><xsl:attribute name="id">prefercite</xsl:attribute> <xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Preferred Citation</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:template>


<xsl:template name="provenance">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>History of the Collection</xsl:element>
<xsl:for-each select="acqinfo | descgrp//acqinfo">
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:choose>
<xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when>
<xsl:otherwise><xsl:attribute name="id">acqinfo</xsl:attribute></xsl:otherwise>
</xsl:choose>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:for-each select="custodhist | descgrp//custodhist">
<xsl:element name="div"><xsl:attribute name="class">lead2</xsl:attribute>
<xsl:choose>
<xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when>
<xsl:otherwise><xsl:attribute name="id">custodhist</xsl:attribute></xsl:otherwise>
</xsl:choose>Custodial history: </xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:for-each select="originalsloc | descgrp//originalsloc">
<xsl:element name="div"><xsl:attribute name="class">lead2</xsl:attribute><xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">originalsloc</xsl:attribute></xsl:otherwise></xsl:choose>
Location of originals: </xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:for-each select="accruals | descgrp//accruals">
<xsl:element name="div"><xsl:attribute name="class">lead2</xsl:attribute><xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">accruals</xsl:attribute></xsl:otherwise></xsl:choose>Accruals: </xsl:element>
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(descendant::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:template>


<xsl:template match="acqinfo">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="custodhist">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="accruals">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="originalsloc">
<xsl:apply-templates />
</xsl:template>




<xsl:template name="altform">
<xsl:if test="altformavail | descgrp//altformavail">
<xsl:element name="div">
<xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">altformavail</xsl:attribute></xsl:otherwise></xsl:choose>
</xsl:element>
<xsl:for-each select="altformavail | descgrp//altformavail">
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Alternative Formats Available</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:for-each>
</xsl:if>
</xsl:template>


<xsl:template name="responsibility">
<xsl:if test="processinfo | appraisal | descgrp//processinfo | descgrp//appraisal">
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>Processing Information</xsl:element>
</xsl:if>
<xsl:for-each select="processinfo | descgrp//processinfo">
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute><xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">processinfo</xsl:attribute></xsl:otherwise></xsl:choose>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:for-each select="appraisal | descgrp//appraisal">
<xsl:element name="div"><xsl:attribute name="class">lead2</xsl:attribute><xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">appraisal</xsl:attribute></xsl:otherwise></xsl:choose>
<xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise>Appraisal of records</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
</xsl:for-each>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:template>


<xsl:template name="phystech">
<xsl:for-each select="phystech | descgrp//phystech">
<xsl:element name="div">
<xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">phystech</xsl:attribute></xsl:otherwise></xsl:choose>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Physical and Technical Information</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:for-each>
</xsl:template>


<xsl:template name="materialspec">
<xsl:if test="materialspec |descgrp//materialspec">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute><xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">materialspec</xsl:attribute></xsl:otherwise></xsl:choose>
<xsl:choose>
<xsl:when test="@label"><xsl:value-of select="@label" /></xsl:when>
<xsl:otherwise>Material Specific Information</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:for-each select="materialspec | descgrp//materialspec">
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:for-each>
</xsl:if>
</xsl:template>


<xsl:template match="controlaccess">
<xsl:element name="div"><xsl:attribute name="class">thirteenred</xsl:attribute><xsl:choose><xsl:when test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:when><xsl:otherwise><xsl:attribute name="id">controlaccess</xsl:attribute></xsl:otherwise></xsl:choose>
<xsl:element name="div">
<xsl:attribute name="class">airabove</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">dschead</xsl:attribute>
<xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise>Search Terms</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">bodyunjust</xsl:attribute>
<xsl:for-each select="address | blockquote | chronlist | list | note | p | table">
<xsl:apply-templates select="." />
<xsl:element name="p" />
</xsl:for-each>
The following terms represent persons, organizations, and topics documented in this collection.  Use these headings to search for additional materials on this web site, in the <xsl:element name="a"><xsl:attribute name="href">http://fcaw.library.umass.edu:8991/F</xsl:attribute>Five College Library Catalog</xsl:element>, or in other library catalogs and databases.
<xsl:element name="p" />
<xsl:element name="div">
<xsl:attribute name="style">width:800px; margin-left:4em; </xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="style">width:390px; float:left;</xsl:attribute>
<xsl:choose>
<xsl:when test="ancestor::archdesc/controlaccess">
<xsl:if test="//*[@encodinganalog='600'] | //*[@encodinganalog='610'] | //*[@encodinganalog='611'] | //*[@encodinganalog='630'] | //*[@encodinganalog='650'] | //*[@encodinganalog='651'] | //*[@encodinganalog='690'] | //*[@encodinganalog='691']| //*[@encodinganalog='696'] | //*[@encodinganalog='697'] | //*[@encodinganalog='698'] | //*[@encodinganalog='699']">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>Subjects</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="*[@encodinganalog='600'] | *[@encodinganalog='610'] | *[@encodinganalog='611'] | *[@encodinganalog='630'] | *[@encodinganalog='650'] | *[@encodinganalog='651'] | *[@encodinganalog='690'] | *[@encodinganalog='691']| *[@encodinganalog='696'] | *[@encodinganalog='697'] | *[@encodinganalog='698'] | *[@encodinganalog='699']">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:if test="subject | geogname | title">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>
Subjects
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="subject | geogname | title">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="style">width:390px; float:right;</xsl:attribute>
<xsl:choose>
<xsl:when test="ancestor::archdesc/controlaccess">

<xsl:if test="*[@encodinganalog='100'] | *[@encodinganalog='110'] | *[@encodinganalog='111'] | *[@encodinganalog='700'] | *[@encodinganalog='710'] | *[@encodinganalog='711'] | *[@encodinganalog='752'] | *[@encodinganalog='790'] | *[@encodinganalog='791'] | *[@encodinganalog='792'] | *[@encodinganalog='793'] | *[@encodinganalog='796'] | *[@encodinganalog='797'] | *[@encodinganalog='798'] | *[@encodinganalog='799']">

<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>Contributors</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="*[@encodinganalog='100'] | *[@encodinganalog='110'] | *[@encodinganalog='111'] | *[@encodinganalog='700'] | *[@encodinganalog='710'] | *[@encodinganalog='711'] | *[@encodinganalog='752'] | *[@encodinganalog='790'] | *[@encodinganalog='791'] | *[@encodinganalog='792'] | *[@encodinganalog='793'] | *[@encodinganalog='796'] | *[@encodinganalog='797'] | *[@encodinganalog='798'] | *[@encodinganalog='799']">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
<xsl:if test="//*[@encodinganalog='655']">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>
Genre terms
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="*[@encodinganalog='655']">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
<xsl:if test="function | occupation">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>
Functions and occupations
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="function | occupation">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:if test="persname | famname | corpname">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>Names</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="famname | persname | corpname">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
<xsl:if test="genreform">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>
Genre terms
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="genreform">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
<xsl:if test="function | occupation">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>
Functions and occupations
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">controlaccess</xsl:attribute>
<xsl:element name="ul">
<xsl:for-each select="function | occupation">
<xsl:sort select="." order="ascending"/>
<xsl:element name="li"><xsl:apply-templates/></xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:element name="p"/>
</xsl:element>
</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:template>



<xsl:template name="addinfo">
<xsl:element name="div"><xsl:attribute name="id">contactinfo</xsl:attribute><xsl:attribute name="class">dschead</xsl:attribute>Additional Information</xsl:element>
<xsl:element name="table">
<xsl:attribute name="class">contacttable</xsl:attribute>
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">toppanelcontact</xsl:attribute>
Contact Information
</xsl:element>
</xsl:element>
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">innercontact</xsl:attribute>
<xsl:for-each select="ead/eadheader">
<xsl:call-template name="contactinfo" />
</xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:for-each select="ead/archdesc/did/langmaterial">
<xsl:element name="span"><xsl:attribute name="id">language</xsl:attribute></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>Language</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">insetmore</xsl:attribute>
<xsl:apply-templates select="." />
</xsl:element>
</xsl:for-each>
<xsl:for-each select="ead/archdesc | ead/archdesc/descgrp | ead/archdesc/descgrp/descgrp">
<xsl:if test="relatedmaterial">
<xsl:element name="div">
<xsl:attribute name="class">minspace</xsl:attribute>
<xsl:call-template name="relmat" />
</xsl:element>
</xsl:if>
<xsl:if test="separatedmaterial">
<xsl:element name="div">
<xsl:attribute name="class">minspace</xsl:attribute>
<xsl:call-template name="sepmat" />
</xsl:element>
</xsl:if>
<xsl:if test="otherfindaid">
<xsl:element name="div">
<xsl:attribute name="class">minspace</xsl:attribute>
<xsl:call-template name="otherfind" />
</xsl:element>
</xsl:if>
<xsl:if test="bibliography">
<xsl:element name="div">
<xsl:attribute name="class">minspace</xsl:attribute>
<xsl:call-template name="bibliography" />
</xsl:element>
</xsl:if>
<xsl:if test="note">
<xsl:element name="div">
<xsl:attribute name="class">minspace</xsl:attribute>
<xsl:apply-templates select="note" />
</xsl:element>
</xsl:if>
</xsl:for-each>
<xsl:for-each select="ead/eadheader/filedesc/titlestmt/sponsor">
<xsl:element name="span">
<xsl:attribute name="id">sponsor</xsl:attribute>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">minspace</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">lead1</xsl:attribute>Sponsor</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">bodyunjust</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:template>




<xsl:template name="sepmat">
<xsl:for-each select="separatedmaterial">
<xsl:element name="div">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Separated Material</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template name="relmat">
<xsl:for-each select="relatedmaterial">
<xsl:element name="div">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Related Materials</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template name="otherfind">
<xsl:for-each select="otherfindaid">
<xsl:element name="div">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Other Finding Aids</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template name="bibliography">
<xsl:for-each select="bibliography">
<xsl:element name="div">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Bibliography</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="*[not(ancestor::dsc)]" />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template match="bibref">
<xsl:element name="div">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:choose>
<xsl:when test="@href"><xsl:element name="a"><xsl:attribute name="href">
<xsl:value-of select="@href" /></xsl:attribute><xsl:apply-templates /></xsl:element></xsl:when>
<xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:template>


<xsl:template match="archref">
<xsl:element name="div">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:choose>
<xsl:when test="@href"><xsl:element name="a"><xsl:attribute name="href">
<xsl:value-of select="@href" /></xsl:attribute><xsl:apply-templates /></xsl:element></xsl:when>
<xsl:otherwise><xsl:apply-templates /></xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:template>



<xsl:template match="note">
<xsl:for-each select=".">
<xsl:element name="div">
<xsl:attribute name="class">lead1</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:choose>
<xsl:when test="@label"><xsl:value-of select="@label" /></xsl:when>
<xsl:otherwise>Note</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
<xsl:if test="position()=last()">
<xsl:element name="p" />
</xsl:if>
</xsl:for-each>
</xsl:template>



<xsl:template name="index">
</xsl:template>

<xsl:template match="index">
<xsl:element name="div"><xsl:attribute name="id"><xsl:choose><xsl:when test="@id"><xsl:value-of select="@id" /></xsl:when><xsl:otherwise>index</xsl:otherwise></xsl:choose></xsl:attribute><xsl:element name="div">
<xsl:attribute name="class">breakabove</xsl:attribute>
<xsl:element name="div"><xsl:attribute name="class"><xsl:choose><xsl:when test="descendant::index">dschead</xsl:when><xsl:otherwise>lead2</xsl:otherwise></xsl:choose></xsl:attribute><xsl:choose><xsl:when test="head"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Index</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates select="p | note | table | address | index | indexentry | blockquote | chronlist | list | listhead" />
</xsl:element>
</xsl:element>
<xsl:element name="br" />&#x00A0;
</xsl:element>
</xsl:template>



<xsl:template match="indexentry">
<xsl:element name="table">
<xsl:attribute name="style">width:98%;</xsl:attribute>
<xsl:for-each select=".">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="style">padding-left:2em; margin-left:0em; text-indent:-1em; width:75%; border-top:1px solid #ccc; padding-top:0.1em; padding-bottom:0.2em;</xsl:attribute>
<xsl:for-each select="corpname | famname | function | genreform | geogname | name | namegrp | occupation | persname | subject | title"><xsl:apply-templates /></xsl:for-each>
</xsl:element>
<xsl:element name="td">
<xsl:attribute name="style">width:25%; text-align:right; border-top:1px solid #ccc;</xsl:attribute>
<xsl:for-each select="ptr | ptrgrp | ref"><xsl:apply-templates /></xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:template>



<xsl:template match="odd">
<xsl:element name="div"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">lead1</xsl:attribute><xsl:attribute name="style">margin-bottom:0.75em; margin-bottom:0.75em;</xsl:attribute>
<xsl:choose><xsl:when test="head[string-length(text()|*)!=0]"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Other Descriptive Data</xsl:otherwise></xsl:choose></xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:template>



<xsl:template match="head">
<xsl:if test="@id"><xsl:element name="div"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:element></xsl:if>
<xsl:choose>
<xsl:when test="parent::odd[@id='odd-app'] | parent::odd[@altrender='endoffile']">
<xsl:element name="div"><xsl:attribute name="class">dschead</xsl:attribute><xsl:choose><xsl:when test="self::head[string-length(text()|*)!=0]"><xsl:value-of select="." /></xsl:when><xsl:otherwise>Other descriptive information</xsl:otherwise></xsl:choose></xsl:element>
</xsl:when>
<xsl:when test="parent::index[@id='add-index'] | parent::index[@altrender='endoffile']">
<xsl:element name="div"><xsl:attribute name="class">dschead</xsl:attribute><xsl:choose><xsl:when test="self::head[string-length(text()|*)!=0]"><xsl:value-of select="." /></xsl:when><xsl:otherwise>Other descriptive information</xsl:otherwise></xsl:choose></xsl:element>
</xsl:when>
<xsl:otherwise></xsl:otherwise>
</xsl:choose>
</xsl:template>



<xsl:template match="p">
<xsl:for-each select=".">
<xsl:element name="p"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if><xsl:apply-templates /></xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template name="footer">
<xsl:element name="div">
<xsl:attribute name="class">footerair</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">lineabove</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">footpt</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">inset</xsl:attribute>
Questions about this collection?  <xsl:element name="a">
<xsl:attribute name="href">./list#contact</xsl:attribute>Contact the archives</xsl:element>
<xsl:element name="br" />
<xsl:element name="a"><xsl:attribute name="href">../../index.html</xsl:attribute>Home</xsl:element> | <xsl:element name="a"><xsl:attribute name="href">../../help/index.html</xsl:attribute>Help</xsl:element> | <xsl:element name="a"><xsl:attribute name="href">../../about.html</xsl:attribute>About</xsl:element> | <xsl:element name="a"><xsl:attribute name="href">../../search/index.html</xsl:attribute>Search</xsl:element>
</xsl:element>
</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="p"><xsl:attribute name="class">lineabove</xsl:attribute></xsl:element>
</xsl:template>



<xsl:template match="*/lb">
<xsl:choose>
<xsl:when test="parent::abstract">
<xsl:element name="br" />
<xsl:element name="br" />
</xsl:when>
<xsl:otherwise>
<xsl:element name="br" />
</xsl:otherwise>
</xsl:choose>
</xsl:template>




<xsl:template match="*/table">
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:for-each select="head">
<xsl:element name="div">
<xsl:attribute name="class">tableheader</xsl:attribute><xsl:apply-templates />
</xsl:element>
</xsl:for-each>
<xsl:element name="table">
<xsl:attribute name="class">chronlisttable</xsl:attribute>
<xsl:for-each select="tgroup">
<xsl:element name="tr">
<xsl:for-each select="colspec">
<xsl:element name="td">
<xsl:if test="@colwidth"><xsl:attribute name="style">width:<xsl:value-of select="@colwidth" />;</xsl:attribute></xsl:if>
<xsl:if test="@align"><xsl:attribute name="class"><xsl:value-of select="@align" /></xsl:attribute></xsl:if>
</xsl:element>
</xsl:for-each>
</xsl:element>
<xsl:for-each select="thead">
<xsl:for-each select="row">
<xsl:element name="tr">
<xsl:for-each select="entry">
<xsl:element name="th">
<xsl:attribute name="class">left</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:for-each>
</xsl:for-each>
<xsl:for-each select="tbody">
<xsl:for-each select="row">
<xsl:element name="tr">
<xsl:for-each select="entry">
<xsl:element name="td"><xsl:attribute name="class">tablecell</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:for-each>
</xsl:for-each>
</xsl:for-each>
</xsl:element>
<xsl:element name="p" />
</xsl:element>
</xsl:template>



<xsl:template match="dao">
<xsl:choose>
<xsl:when test="@actuate='onrequest'">
<xsl:call-template name="daolink" />
</xsl:when>
<xsl:otherwise>
<xsl:element name="div">
<xsl:attribute name="class">
<xsl:choose>
<xsl:when test="@altrender">figure<xsl:value-of select="@altrender" /></xsl:when>
<xsl:otherwise>figureleft</xsl:otherwise>
</xsl:choose>
</xsl:attribute>
<xsl:element name="img">
<xsl:attribute name="src"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:choose>
<xsl:when test="daodesc">
<xsl:attribute name="alt"><xsl:value-of select="daodesc" /></xsl:attribute>
</xsl:when>
<xsl:otherwise>An image</xsl:otherwise>
</xsl:choose>
<xsl:attribute name="class">bordered</xsl:attribute>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">caption</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:template>



<xsl:template name="daodesc">
<xsl:apply-templates />
</xsl:template>


<xsl:template name="daolink">
<xsl:for-each select="daodesc">
<xsl:if test="head">
<xsl:element name="div"><xsl:attribute name="class">thirteenpt</xsl:attribute>
<xsl:apply-templates select="head" />
</xsl:element>
</xsl:if>
<xsl:if test="p">
<xsl:element name="p"><xsl:apply-templates select="p" /></xsl:element>
</xsl:if>
</xsl:for-each>
<xsl:element name="div"><xsl:attribute name="class">body</xsl:attribute>
<xsl:element name="a"><xsl:attribute name="href">
<xsl:value-of select="@href" /></xsl:attribute>
<xsl:value-of select="@title" />
</xsl:element>
</xsl:element>
</xsl:template>


<!-- The following template is from Mark Carlson at University of Washington. -->

<xsl:template match="*/daogrp">
<xsl:choose>
<!-- First, check whether we are dealing with one or two <arc> elements -->
<xsl:when test="arc[2]">
<a>
<xsl:for-each select="daoloc">
<!-- This selects the <daoloc> element that matches the @label attribute from <daoloc> and the @to attribute
from the second <arc> element -->
<xsl:if test="@label = following::arc[2]/@to">
<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
</xsl:if>
</xsl:for-each>
<xsl:for-each select="daoloc">
<xsl:if test="@label = following::arc[1]/@to">
<xsl:element name="img">
<xsl:attribute name="src"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:attribute name="class">daoimage</xsl:attribute>
<xsl:choose>
<xsl:when test="following::arc[1]/@title">
<xsl:attribute name="title"><xsl:value-of select="following::arc[1]/@title" /></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="following::arc[1]/@title" /></xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="alt"><xsl:value-of select="../../daogrp//daodesc" /></xsl:attribute>
</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:if test="string(daodesc)">
<xsl:apply-templates />
</xsl:if>
</xsl:if>
</xsl:for-each>
</a>

</xsl:when>
<!-- i.e. no second <arc> element -->
<xsl:otherwise>
<xsl:choose>
<xsl:when test="arc[1][@show='embed'] and arc[1][@actuate='onload']">
<xsl:for-each select="daoloc">
<xsl:if test="@label = following-sibling::arc[1]/@to">
<xsl:element name="img">
<xsl:attribute name="src"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:attribute name="class">daoimage</xsl:attribute>
<xsl:choose>
<xsl:when test="following::arc[1]/@title">
<xsl:attribute name="title"><xsl:value-of select="following::arc[1]/@title" /></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="following::arc[1]/@title" /></xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="alt"><xsl:value-of select="../../daogrp//daodesc" /></xsl:attribute>
</xsl:otherwise>
</xsl:choose>
</xsl:element>



<xsl:if test="string(daodesc)">
<xsl:apply-templates />
</xsl:if>
</xsl:if>
</xsl:for-each>
</xsl:when>
<xsl:when test="(arc[1]/@show='replace' or arc[1]/@show='new') and arc[1]/@actuate='onrequest'">
<a>
<xsl:choose>

<xsl:when test="string(resource)">
<xsl:for-each select="daoloc">
<xsl:if test="@label = following::arc[1]/@to">
<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:if test="following::arc[1]/@show='new'">
<xsl:attribute name="target">_blank</xsl:attribute>
</xsl:if>
</xsl:if>
</xsl:for-each>
<xsl:apply-templates />
</xsl:when>
<!--<xsl:otherwise>

<xsl:for-each select="daoloc">
<xsl:if test="@label = following::arc[1]/@to">
<xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:if test="following::arc[1]/@show='new'">
<xsl:attribute name="target">_blank</xsl:attribute>
</xsl:if>
</xsl:if>

<img src="{$pathToIcon}{$iconFilename}" border="0">
<xsl:if test="following::arc[1]/@title">
<xsl:attribute name="title"><xsl:value-of select="following::arc[1]/@title" /></xsl:attribute>
<xsl:attribute name="alt"><xsl:value-of select="following::arc[1]/@title" /></xsl:attribute>
</xsl:if>
</img>
</xsl:for-each>
</xsl:otherwise>-->
</xsl:choose>
</a>
</xsl:when>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:template>






<xsl:template match="*[@render='bold']">
<xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='italic']">
<xsl:element name="span"><xsl:attribute name="class">italic</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='underline']">
<xsl:element name="span"><xsl:attribute name="class">underline</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='boldunderline']">
<xsl:element name="span"><xsl:attribute name="class">boldunderline</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='bolditalic']">
<xsl:element name="span"><xsl:attribute name="class">bolditalic</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='smcaps']">
<xsl:element name="span"><xsl:attribute name="class">smcaps</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='sub']">
<xsl:element name="span"><xsl:attribute name="class">sub</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template> 


<xsl:template match="*[@render='super']">
<xsl:element name="span"><xsl:attribute name="class">sup</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='doublequote']">
<xsl:element name="span">"<xsl:apply-templates />"</xsl:element>
</xsl:template>


<xsl:template match="*[@render='boldsmcaps']">
<xsl:element name="span"><xsl:attribute name="class">boldsmcaps</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='boldunderline']">
<xsl:element name="span"><xsl:attribute name="class">boldunderline</xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


<xsl:template match="*[@render='bolddoublequote']">
<xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute>"<xsl:apply-templates />"</xsl:element>
</xsl:template>


<xsl:template match="*[@render='boldsinglequote']">
<xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute>'<xsl:apply-templates />'</xsl:element>
</xsl:template>


<xsl:template match="*[@render='singlequote']">
<xsl:element name="span">'<xsl:apply-templates />'</xsl:element>
</xsl:template>



<xsl:template match="*/list">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:for-each select="head"><xsl:element name="div"><xsl:attribute name="class">bold</xsl:attribute><xsl:apply-templates /></xsl:element></xsl:for-each>
<xsl:choose>
<xsl:when test="defitem">
<xsl:call-template name="defitemlist" />
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@type='ordered'">
<xsl:element name="ol">
<xsl:if test="@numeration='upperroman'">
<xsl:attribute name="type">I</xsl:attribute>
</xsl:if>
<xsl:if test="@numeration='lowerroman'">
<xsl:attribute name="type">i</xsl:attribute>
</xsl:if>
<xsl:if test="@numeration='upperalpha'">
<xsl:attribute name="type">A</xsl:attribute>
</xsl:if>
<xsl:if test="@numeration='loweralpha'">
<xsl:attribute name="type">a</xsl:attribute>
</xsl:if>
<xsl:if test="@numeration='arabic'">
<xsl:attribute name="type">1</xsl:attribute>
</xsl:if>
<xsl:for-each select="item">
<xsl:element name="li"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if><xsl:apply-templates /></xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:when>
<xsl:when test="@type='marked' or @type='simple'">
<xsl:element name="ul">
<xsl:for-each select="item">
<xsl:element name="li"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if><xsl:apply-templates /></xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:element name="ul">
<xsl:for-each select="item">
<xsl:element name="li"><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if><xsl:apply-templates /></xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template name="defitemlist">
<xsl:element name="div">
<xsl:attribute name="class">breakbelow</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="table">
<xsl:attribute name="class">chronlisttable</xsl:attribute>
<xsl:for-each select="defitem">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">defleft</xsl:attribute>
<xsl:for-each select="label">
<xsl:if test="@altrender"><xsl:attribute name="style">width:<xsl:value-of select="@altrender" />;</xsl:attribute></xsl:if>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:apply-templates select="." />
</xsl:for-each>
</xsl:element>
<xsl:element name="td">
<xsl:attribute name="class">defright</xsl:attribute>
<xsl:for-each select="item">
<xsl:if test="@altrender"><xsl:attribute name="style">width:<xsl:value-of select="@altrender" />;</xsl:attribute></xsl:if>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:apply-templates select="." />
</xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:template>


<xsl:template match="item">
<xsl:apply-templates />
</xsl:template>


<xsl:template match="label">
<xsl:apply-templates />
</xsl:template>


<xsl:template match="unitdate">
<xsl:choose>
<xsl:when test="@type='bulk'">(<xsl:element name="i">Bulk: </xsl:element><xsl:if test="@certainty='approximate'"><xsl:element name="i">ca.</xsl:element></xsl:if><xsl:apply-templates/>)</xsl:when>
<xsl:otherwise>
<xsl:if test="@certainty='supplied'">[</xsl:if>
<xsl:if test="@certainty='approximate'"><xsl:element name="i">ca.</xsl:element></xsl:if>
<xsl:apply-templates/><xsl:if test="following-sibling::unitdate"><xsl:text>  </xsl:text></xsl:if>
<xsl:if test="@certainty='supplied'">]</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template match="date">
<xsl:choose>
<xsl:when test="@type='bulk'">(<xsl:element name="i">Bulk: </xsl:element><xsl:if test="@certainty='approximate'"><xsl:element name="i">ca.</xsl:element></xsl:if><xsl:apply-templates/>)</xsl:when>
<xsl:otherwise>
<xsl:if test="@certainty='supplied'">[</xsl:if>
<xsl:if test="@certainty='approximate'"><xsl:element name="i">ca.</xsl:element></xsl:if>
<xsl:apply-templates/><xsl:if test="following-sibling::date"><xsl:text>  </xsl:text></xsl:if>
<xsl:if test="@certainty='supplied'">]</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template match="blockquote">
<xsl:element name="div"><xsl:attribute name="class">blockquote</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:template>


<xsl:template match="*/chronlist">
<xsl:element name="div">
<xsl:attribute name="class">breakbelow</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="div"><xsl:attribute name="class">lead1chronlist</xsl:attribute><xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise></xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:element name="table">
<xsl:attribute name="class">chronlisttable</xsl:attribute>
<xsl:for-each select="listhead">
<xsl:element name="tr">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if><xsl:element name="br" />
<xsl:element name="td">
<xsl:attribute name="class">frontmattertable</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute><xsl:apply-templates select="head01" /></xsl:element></xsl:element>
<xsl:element name="td"><xsl:attribute name="class">frontmattertable</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute><xsl:apply-templates select="head02" /></xsl:element></xsl:element>
</xsl:element>
</xsl:for-each>
<xsl:for-each select="chronitem">
<xsl:element name="tr">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:element name="td">
<xsl:attribute name="class">defleft</xsl:attribute>
<xsl:for-each select="date">
<xsl:if test="@altrender"><xsl:attribute name="style">width:<xsl:value-of select="@altrender" />;</xsl:attribute></xsl:if>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:apply-templates select="." />
</xsl:for-each>
</xsl:element>
<xsl:element name="td">
<xsl:attribute name="class">defright</xsl:attribute>
<xsl:for-each select="event | eventgrp">
<xsl:if test="@altrender"><xsl:attribute name="style">width:<xsl:value-of select="@altrender" />;</xsl:attribute></xsl:if>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:apply-templates select="." />
</xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:element>
</xsl:template>


<xsl:template match="eventgrp">
<xsl:for-each select="event">
<xsl:element name="div">
<xsl:apply-templates />
</xsl:element>
</xsl:for-each>
</xsl:template>


<xsl:template match="event">
<xsl:apply-templates />
</xsl:template>



<xsl:template match="*/extref">
<xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="@href" /></xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:template>





<xsl:template match="address">
<xsl:choose>
<xsl:when test="parent::repository | parent::publicationstmt">
<xsl:for-each select="addressline">
<xsl:element name="br" /><xsl:apply-templates />
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:for-each select="addressline">
<xsl:element name="br" /><xsl:apply-templates />
</xsl:for-each>
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template match="subarea">
<xsl:element name="br" /><xsl:apply-templates />
</xsl:template>



<xsl:template match="*/ref">
<xsl:element name="a"><xsl:attribute name="href">#<xsl:value-of select="@target" /></xsl:attribute><xsl:apply-templates /></xsl:element>
</xsl:template>


</xsl:stylesheet>
