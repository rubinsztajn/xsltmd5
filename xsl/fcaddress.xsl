<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:strip-space elements="*" />
    <xsl:output method="xml" encoding="utf-8" doctype-public="-//W3C//DTD XHTML+RDFa 1.0//EN" doctype-system="http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd" />


<xsl:template name="contactinfo">
<xsl:choose>
<xsl:when test="eadid[@mainagencycode='ma']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Amherst College Archives and Special Collections</xsl:element></xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute>Robert Frost Library
<xsl:element name="br" />PO Box 5000
<xsl:element name="br" />Amherst, MA 01002-5000
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 542-2299
<xsl:element name="br" />Fax: (413) 542-2692
<xsl:element name="p" />Email Reference Form: <xsl:element name="a"><xsl:attribute name="href">http://www.amherst.edu/library/archives/askus</xsl:attribute>http://www.amherst.edu/library/archives/askus</xsl:element>
<xsl:element name="br" />URL: <xsl:element name="a"><xsl:attribute name="href">http://www.amherst.edu/library/archives</xsl:attribute>http://www.amherst.edu/library/archives</xsl:element>
</xsl:element>
</xsl:when>

<xsl:when test="eadid[@mainagencycode='mah']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>Susan A. Dayall</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Hampshire College Archives</xsl:element>
<xsl:element name="br" />Johnson Library Center
<xsl:element name="br" />Hampshire College
<xsl:element name="br" />Amherst, MA 01002
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 559-5761
<xsl:element name="br" />Fax: (413) 559-5419
<xsl:element name="p" />Email: <xsl:element name="a"><xsl:attribute name="href">mailto:sdayall@hampshire.edu</xsl:attribute>sdayall@hampshire.edu</xsl:element>
<xsl:element name="br" />URL: <xsl:element name="a"><xsl:attribute name="href">http://library.hampshire.edu/archives/</xsl:attribute>http://library.hampshire.edu/archives/</xsl:element>
</xsl:element>
</xsl:when>

<xsl:when test="eadid[@mainagencycode='mshm']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Mount Holyoke College Archives and Special Collections</xsl:element></xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute>8 Dwight Hall
<xsl:element name="br" />50 College St.
<xsl:element name="br" />South Hadley, MA 01075
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 538-2013
<xsl:element name="br" />Fax: (413) 538-2370
<xsl:element name="p" />Email Reference Form: <xsl:element name="a"><xsl:attribute name="href">http://www.mtholyoke.edu/lits/library/arch/forms/areq.htm</xsl:attribute>http://www.mtholyoke.edu/lits/library/arch/forms/areq.htm</xsl:element>
<xsl:element name="br" />URL: <xsl:element name="a"><xsl:attribute name="href">http://www.mtholyoke.edu/lits/library/arch/</xsl:attribute>http://www.mtholyoke.edu/lits/library/arch/</xsl:element>
</xsl:element>
</xsl:when>

<xsl:when test="eadid[@mainagencycode='manosca']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Smith College Archives</xsl:element></xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute>Northampton, MA 01063
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 585-2970
<xsl:element name="br" />Fax: (413) 585-2886
<xsl:element name="p" />Email: <xsl:element name="a"><xsl:attribute name="href">mailto:nyoung@smith.edu</xsl:attribute>nyoung@smith.edu</xsl:element>
<xsl:element name="br" />URL: <xsl:element name="a"><xsl:attribute name="href">http://www.smith.edu/libraries/libs/archives</xsl:attribute>http://www.smith.edu/libraries/libs/archives</xsl:element>
</xsl:element>
</xsl:when>

<xsl:when test="eadid[@mainagencycode='mnsss']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Sophia Smith Collection</xsl:element></xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute>Smith College
<xsl:element name="br" />Northampton, MA 01063
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 585-2970
<xsl:element name="br" />Fax: (413) 585-2886
<xsl:element name="p" />Email Reference Form: <xsl:element name="a"><xsl:attribute name="href">http://www.smith.edu/libraries/libs/ssc/emailform.html</xsl:attribute>http://www.smith.edu/libraries/libs/ssc/emailform.html</xsl:element> 
<xsl:element name="br" />URL: <xsl:element name="a"><xsl:attribute name="href">http://www.smith.edu/libraries/libs/ssc/</xsl:attribute>http://www.smith.edu/libraries/libs/ssc/</xsl:element>
</xsl:element>
</xsl:when>

<xsl:when test="eadid[@mainagencycode='manoscmr']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Mortimer Rare Book Room</xsl:element></xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute>William Allan Neilson Library
<xsl:element name="br" />Smith College
<xsl:element name="br" />Northampton, MA 01063
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 585-2906
<xsl:element name="br" />Fax: (413) 585-4486
<xsl:element name="p" />Email: <xsl:element name="a"><xsl:attribute name="href">mailto:mrbr@smith.edu</xsl:attribute>mrbr@smith.edu</xsl:element>
<xsl:element name="br" />URL: <xsl:element name="a"><xsl:attribute name="href">http://www.smith.edu/libraries/libs/rarebook</xsl:attribute>http://www.smith.edu/libraries/libs/rarebook</xsl:element>
</xsl:element>
</xsl:when>

<xsl:when test="eadid[@mainagencycode='mu']">
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute><xsl:element name="span"><xsl:attribute name="class">institutionname</xsl:attribute>Special Collections and University Archives</xsl:element></xsl:element>
<xsl:element name="div"><xsl:attribute name="class">marginlefttwofive</xsl:attribute>W.E.B. Du Bois Library
<xsl:element name="br" />University of Massachusetts Amherst
<xsl:element name="br" />Amherst, MA 01003-9275
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">inset</xsl:attribute>
<xsl:element name="br" />Phone: (413) 545-2780
<xsl:element name="br" />Fax: (413) 577-1399
<xsl:element name="div"><xsl:attribute name="class">minspace</xsl:attribute>Link to: 
<xsl:element name="div"><xsl:attribute name="class">linktodata</xsl:attribute>[ <xsl:element name="a"><xsl:attribute name="href">http://www.library.umass.edu/spcoll/askanarc.htm</xsl:attribute>Email reference form</xsl:element> | <xsl:element name="a"><xsl:attribute name="href"> http://www.library.umass.edu/spcoll/</xsl:attribute>SCUA home</xsl:element> | <xsl:element name="a"><xsl:attribute name="href"> http://www.library.umass.edu/spcoll/umarmot/</xsl:attribute>UMarmot catablog</xsl:element> ]</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="div"><xsl:attribute name="class">center</xsl:attribute>
<xsl:element name="a"><xsl:attribute name="href">http://www.library.umass.edu/spcoll/</xsl:attribute>
<xsl:element name="img"><xsl:attribute name="src">http://www.library.umass.edu/spcoll/images/sunny.gif</xsl:attribute><xsl:attribute name="alt">Link to SCUA</xsl:attribute></xsl:element></xsl:element>
</xsl:element>

</xsl:when>

<xsl:otherwise>
<xsl:apply-templates select="eadid" />
</xsl:otherwise>

</xsl:choose>
</xsl:template>





<xsl:template name="seal">
<xsl:choose>
<xsl:when test="../eadid[@mainagencycode='manosca'] or ../eadid[@mainagencycode='mnsss'] or ../eadid[@mainagencycode='manoscmr']">
<xsl:element name="div"><xsl:attribute name="style">position:absolute; top:-47px; left:0px; font-size:80%;</xsl:attribute>
<a href="{$file}_main.html">&lt; &lt;  Browse the finding aid</a>
</xsl:element>
</xsl:when>
</xsl:choose>
<xsl:choose>
<xsl:when test="../eadid[@mainagencycode='ma']">
<xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/amherstseal.gif</xsl:attribute><xsl:attribute name="alt">Amherst College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='mah']">
<xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/hampshireseal.gif</xsl:attribute><xsl:attribute name="alt">Hampshire College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='mshm']">
<xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/mhc_logoblu.gif</xsl:attribute><xsl:attribute name="alt">Mount Holyoke College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='manosca'] or ../eadid[@mainagencycode='mnsss'] or ../eadid[@mainagencycode='manoscmr']">
<xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/smithseal.gif</xsl:attribute><xsl:attribute name="alt">Smith College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='mu']">
<xsl:element name="a"><xsl:attribute name="href">http://www.library.umass.edu/spcoll/</xsl:attribute><xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/umassseal175.gif</xsl:attribute><xsl:attribute name="alt">UMass Amherst seal</xsl:attribute></xsl:element>
</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="." />
</xsl:otherwise>
</xsl:choose>
</xsl:template>




<xsl:template name="miniseal">
<xsl:choose>
<xsl:when test="../eadid[@mainagencycode='ma']">
<xsl:element name="a"><xsl:attribute name="href">http://www.amherst.edu/library/archives/</xsl:attribute><xsl:element name="img"><xsl:attribute name="src">../../static/images/amherstseal_50.gif</xsl:attribute><xsl:attribute name="alt">Amherst College seal</xsl:attribute></xsl:element></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='mah']">
<xsl:element name="img"><xsl:attribute name="src">../../static/images/hampshireseal_50.gif</xsl:attribute><xsl:attribute name="alt">Hampshire College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='mshm']">
<xsl:element name="img"><xsl:attribute name="src">../../static/images/mhc_logoblu_50.gif</xsl:attribute><xsl:attribute name="alt">Mount Holyoke College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='manosca'] or ../eadid[@mainagencycode='mnsss'] or ../eadid[@mainagencycode='manoscmr']">
<xsl:element name="img"><xsl:attribute name="src">../../static/images/smithseal_50.gif</xsl:attribute><xsl:attribute name="alt">Smith College seal</xsl:attribute></xsl:element>
</xsl:when>
<xsl:when test="../eadid[@mainagencycode='mu']">
<xsl:element name="a"><xsl:attribute name="href">http://www.library.umass.edu/spcoll/</xsl:attribute><xsl:element name="img"><xsl:attribute name="src">../../static/images/umassseal_50.gif</xsl:attribute><xsl:attribute name="alt">UMass Amherst seal</xsl:attribute></xsl:element>
</xsl:element>
</xsl:when>
<xsl:otherwise>
</xsl:otherwise>
</xsl:choose>
</xsl:template>




<xsl:template name="masthead">
<xsl:element name="div">
<xsl:attribute name="class">fcmasthead</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">fcinterior</xsl:attribute>
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/index.html</xsl:attribute>
<xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/medstar.gif</xsl:attribute><xsl:attribute name="class">fclogo</xsl:attribute><xsl:attribute name="alt">Five Colleges Logo</xsl:attribute>
</xsl:element></xsl:element>
<xsl:element name="img"><xsl:attribute name="src">http://asteria.fivecolleges.edu/static/images/titletext.gif</xsl:attribute><xsl:attribute name="alt">Five College Archives and Manuscript Collections</xsl:attribute><xsl:attribute name="class">fcimage</xsl:attribute>
</xsl:element>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">fcheaderlinks</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">rightyw</xsl:attribute>
<xsl:element name="a"><xsl:attribute name="href">../../index.html</xsl:attribute>home</xsl:element> | <xsl:element name="a"><xsl:attribute name="href">../../help/index.html</xsl:attribute>help</xsl:element> | <xsl:element name="a"><xsl:attribute name="href">../../about.html</xsl:attribute>about</xsl:element> | <xsl:element name="a"><xsl:attribute name="href">../../search/index.html</xsl:attribute>search</xsl:element>
</xsl:element>
</xsl:element>
<xsl:element name="div">
<xsl:attribute name="class">fcunderbar</xsl:attribute>
<xsl:call-template name="crumbs" />
</xsl:element>
</xsl:element>
</xsl:template>


<xsl:template name="crumbs">
<xsl:element name="div">
<xsl:attribute name="class">marginlefttwofive</xsl:attribute>
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/index.html</xsl:attribute>Home</xsl:element> &gt;&gt; <xsl:call-template name="institutions" /> &gt;&gt; <xsl:value-of select="ead/eadheader/filedesc/titlestmt/titleproper" />
</xsl:element>
</xsl:template>




<xsl:template name="institutions">
<xsl:choose>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='ma']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/amherst/list</xsl:attribute>Amherst College Archives &amp; Special Collections</xsl:element>
</xsl:when>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='mah']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/hampshire/list</xsl:attribute>Hampshire College Archives</xsl:element>
</xsl:when>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='mshm']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/mountholyoke/list</xsl:attribute>Mount Holyoke College Archives &amp; Special Collections</xsl:element>
</xsl:when>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='manosca']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/smitharchives/list</xsl:attribute>Smith College Archives</xsl:element>
</xsl:when>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='mnsss']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/sophiasmith/list</xsl:attribute>Sophia Smith Collection</xsl:element>
</xsl:when>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='manoscmr']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/mortimer/list</xsl:attribute>Mortimer Rare Book Room</xsl:element>
</xsl:when>
<xsl:when test="ead/eadheader/eadid[@mainagencycode='mu']">
<xsl:element name="a"><xsl:attribute name="href">http://asteria.fivecolleges.edu/findaids/umass/list</xsl:attribute>Special Collections &amp; University Archives, W.E.B. Du Bois Library</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="." />
</xsl:otherwise>
</xsl:choose>
</xsl:template>


</xsl:stylesheet>
