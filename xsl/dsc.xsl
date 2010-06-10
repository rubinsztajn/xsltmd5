<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:strip-space elements="*" />
    <xsl:output method="xml" encoding="utf-8" doctype-public="-//W3C//DTD XHTML+RDFa 1.0//EN" doctype-system="http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd" />



<xsl:variable name="number">
<xsl:for-each select="ead/archdesc/dsc/c01">
<xsl:number value="position()" format="1" />
</xsl:for-each>
</xsl:variable>


<xsl:template name="dscrung">
<xsl:for-each select="ead/archdesc/dsc">
<xsl:element name="div"><xsl:attribute name="id"><xsl:value-of select="@type" /></xsl:attribute><xsl:attribute name="style">clear:both;</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">dschead</xsl:attribute>
<xsl:choose>
<xsl:when test="head"><xsl:value-of select="head" /></xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@type='analyticover'">Series Descriptions</xsl:when>
<xsl:otherwise>Contents List</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:element>
<xsl:apply-templates select="*[not(self::c01)]" />
<xsl:for-each select="c01">
<xsl:call-template name="c01" />
</xsl:for-each>
</xsl:element>
</xsl:for-each>
</xsl:template>



<!--********************* end dsc rung stuff **************************-->


<xsl:template name="c01">
<xsl:element name="table">
<xsl:attribute name="style">margin-left:1.5em; width:95%; font-size:90%; border-collapse:collapse; <xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']"></xsl:when>
<xsl:otherwise><xsl:if test="@level='series'"><xsl:if test="$number &gt; 1">margin-top:2em;</xsl:if></xsl:if>
</xsl:otherwise>
</xsl:choose></xsl:attribute>
<xsl:element name="tr">
<xsl:choose>
<xsl:when test="self::*[@level='collection'] or self::*[@level='series'] or self::*[@level='fonds'] or self::*[@level='recordgrp'] or self::*[@level='subseries']">


<xsl:element name="td">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:attribute name="class">titlecelllg</xsl:attribute>
<xsl:attribute name="style">width:55%; margin-left:1em; text-indent:-1em;<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']"></xsl:when>
<xsl:otherwise><xsl:if test="@level='series'">
<xsl:if test="$number &gt; 1">border-top: solid 2px #655443;</xsl:if></xsl:if>
</xsl:otherwise>
</xsl:choose></xsl:attribute>

<xsl:choose>
<xsl:when test="parent::dsc[@type='analyticover']">
<xsl:if test="@level='collection' or @level='series' or @level='recordgrp' or @level='fonds'">
<xsl:element name="div"><xsl:attribute name="id">series<xsl:number />
</xsl:attribute>
<xsl:element name="a"><xsl:attribute name="href">#boxfolder<xsl:number /></xsl:attribute>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
</xsl:element>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:element name="div"><xsl:attribute name="id">boxfolder<xsl:number />
</xsl:attribute>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:element name="td">
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:attribute name="style">width:55%;<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']"></xsl:when>
<xsl:otherwise><xsl:if test="@level='series'">
<xsl:if test="$number &gt; 1">border-top: solid 2px #655443;</xsl:if></xsl:if>
</xsl:otherwise>
</xsl:choose></xsl:attribute>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
</xsl:otherwise>
</xsl:choose>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']">
<xsl:attribute name="style">padding-left:2em;</xsl:attribute>
<xsl:attribute name="class">justifyfadelg</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="style">padding-left:1em;</xsl:attribute>
<xsl:attribute name="class">justifyfade</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c02"><xsl:call-template name="c02" /></xsl:for-each>
</xsl:element>
</xsl:template>



<xsl:template name="c02">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']">
<xsl:attribute name="class">justifyfadelg</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="class">justifyfade</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
<xsl:attribute name="style">padding-left:6em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c03"><xsl:call-template name="c03" /></xsl:for-each>
</xsl:template>



<xsl:template name="c03">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']">
<xsl:attribute name="class">justifyfadelg</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="class">justifyfade</xsl:attribute>
</xsl:otherwise>
</xsl:choose>
<xsl:attribute name="style">padding-left:8em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c04"><xsl:call-template name="c04" /></xsl:for-each>
</xsl:template>



<xsl:template name="c04">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:10em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c05"><xsl:call-template name="c05" /></xsl:for-each>
</xsl:template>


<xsl:template name="c05">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:12em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c06"><xsl:call-template name="c06" /></xsl:for-each>
</xsl:template>


<xsl:template name="c06">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:14em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c07"><xsl:call-template name="c07" /></xsl:for-each>
</xsl:template>


<xsl:template name="c07">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:16em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c08"><xsl:call-template name="c08" /></xsl:for-each>
</xsl:template>


<xsl:template name="c08">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:18em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c09"><xsl:call-template name="c09" /></xsl:for-each>
</xsl:template>


<xsl:template name="c09">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:20em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c10"><xsl:call-template name="c10" /></xsl:for-each>
</xsl:template>


<xsl:template name="c10">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:22em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c11"><xsl:call-template name="c11" /></xsl:for-each>
</xsl:template>


<xsl:template name="c11">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:24em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

<xsl:for-each select="c12"><xsl:call-template name="c12" /></xsl:for-each>
</xsl:template>


<xsl:template name="c12">
<xsl:element name="tr">
<xsl:element name="td">
<xsl:attribute name="class">hangingindent</xsl:attribute>
<xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute></xsl:if>
<xsl:call-template name="thingsinauthtitle" />
</xsl:element>
<xsl:call-template name="rest" />
</xsl:element>

<xsl:element name="tr">
<xsl:element name="td"><xsl:attribute name="class">justifyfade</xsl:attribute>
<xsl:attribute name="style">padding-left:26em;</xsl:attribute>
<xsl:attribute name="colspan">3</xsl:attribute>
<xsl:call-template name="cellscope" />
</xsl:element>
</xsl:element>

</xsl:template>





<xsl:template name="rest">
<xsl:element name="td"><xsl:attribute name="style">width:14%;<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']"></xsl:when>
<xsl:otherwise><xsl:if test="@level='series'"><xsl:if test="$number &gt; 1">border-top: solid 2px #655443;</xsl:if></xsl:if>
</xsl:otherwise>
</xsl:choose></xsl:attribute>
<xsl:call-template name="datement" /></xsl:element>
<xsl:element name="td"><xsl:attribute name="style">width:13%;<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']"></xsl:when>
<xsl:otherwise><xsl:if test="@level='series'"><xsl:if test="$number &gt; 1">border-top: solid 2px #655443;</xsl:if></xsl:if>
</xsl:otherwise>
</xsl:choose></xsl:attribute>
<xsl:call-template name="format" /></xsl:element>
<xsl:element name="td"><xsl:attribute name="style">width:18%;<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']"></xsl:when>
<xsl:otherwise><xsl:if test="@level='series'"><xsl:if test="$number &gt; 1">border-top: solid 2px #655443;</xsl:if></xsl:if>
</xsl:otherwise>
</xsl:choose></xsl:attribute>
<xsl:call-template name="container" /></xsl:element>
</xsl:template>


<!--*************** things in authtitle stuff ******************-->

<xsl:template name="thingsinauthtitle">
<xsl:element name="div">
<xsl:choose>
<xsl:when test="self::c02">
<xsl:attribute name="class">twoem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c03">
<xsl:attribute name="class">threeem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c04">
<xsl:attribute name="class">fourem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c05">
<xsl:attribute name="class">fiveem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c06">
<xsl:attribute name="class">sixem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c07">
<xsl:attribute name="class">sevenem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c08">
<xsl:attribute name="class">eightem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c09">
<xsl:attribute name="class">nineem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c10">
<xsl:attribute name="class">tenem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c11">
<xsl:attribute name="class">elevenem</xsl:attribute>
</xsl:when>
<xsl:when test="self::c12">
<xsl:attribute name="class">twelveem</xsl:attribute>
</xsl:when>
<xsl:otherwise>
<xsl:attribute name="class">titlec</xsl:attribute>
</xsl:otherwise>
</xsl:choose>


<xsl:choose>
<xsl:when test="ancestor::dsc[@type='analyticover']">
<xsl:element name="a"><xsl:attribute name="href">#boxfolder<xsl:number /></xsl:attribute>
<xsl:call-template name="unitidunittitle" />
</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@level='series' or @level='subseries' or @level='collection' or @level='fonds' or @level='recordgrp'">
<xsl:element name="span"><xsl:attribute name="class">fourteenpt</xsl:attribute>
<xsl:call-template name="unitidunittitle" />
</xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:call-template name="unitidunittitle" />
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
<xsl:for-each select="did/materialspec">
<xsl:element name="br" /><xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute><xsl:value-of select="@label" /></xsl:element>:  
<xsl:apply-templates />
</xsl:for-each>
<xsl:for-each select="did/note">
<xsl:element name="br" /><xsl:if test="@label"><xsl:element name="span"><xsl:attribute name="class">bold</xsl:attribute><xsl:value-of select="@label" /></xsl:element>: </xsl:if>
<xsl:apply-templates />
</xsl:for-each>
</xsl:element>
</xsl:template>

<!--************** end of things in authtitle stuff ****************-->


<xsl:template name="unitidunittitle">
<xsl:for-each select="did/unitid">
<xsl:apply-templates /><xsl:text>.  </xsl:text>
</xsl:for-each>
<xsl:for-each select="did/origination">
<xsl:element name="span">
<xsl:attribute name="class">origination</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:for-each>
<xsl:if test="did/origination and did/unittitle">,<xsl:text> </xsl:text>
</xsl:if>
<xsl:for-each select="did/unittitle">
<xsl:apply-templates select="text()|*[not(self::unitdate)]" />
</xsl:for-each>
<xsl:if test="did/dao">
<xsl:for-each select="did">
<xsl:apply-templates select="dao" />
</xsl:for-each>
</xsl:if>
</xsl:template>
<!--*************** end of things in authtitle stuff ***************-->


<!--************** datement stuff********************-->
<xsl:template name="datement">
<xsl:element name="div">
<xsl:attribute name="class">othercell</xsl:attribute>
<xsl:choose>
<xsl:when test="did/unitdate | did/unittitle/unitdate">
<xsl:for-each select="did/unitdate | did/unittitle/unitdate">
<xsl:choose>
<xsl:when test="@type='bulk'">(<xsl:element name="i">bulk </xsl:element><xsl:if test="@certainty='approximate'"><xsl:element name="i">ca.</xsl:element></xsl:if><xsl:apply-templates />)</xsl:when>
<xsl:otherwise>
<xsl:if test="@certainty='supplied'">[</xsl:if>
<xsl:if test="@certainty='approximate'"><xsl:element name="i">ca.</xsl:element></xsl:if>
<xsl:apply-templates /><xsl:if test="following-sibling::unitdate"><xsl:text> </xsl:text></xsl:if>
<xsl:if test="@certainty='supplied'">]</xsl:if>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:element name="br" />
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:template>


<!--*********************end datement stuff**************************-->


<!--********************* format stuff**************************-->
<xsl:template name="format">
<xsl:element name="div">
<xsl:attribute name="class">othercell</xsl:attribute>
<xsl:choose>
<xsl:when test="did/physdesc">
<xsl:for-each select="did/physdesc">
<xsl:apply-templates />
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:element name="br" />
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:template>

<!--*********************end format stuff**************************-->


<!--********************* cellscope stuff**************************-->
<xsl:template name="cellscope">
<xsl:call-template name="scopecontentc0x" />
<xsl:choose>
<xsl:when test="daogrp">
<xsl:apply-templates select="daogrp" />
</xsl:when>
</xsl:choose>
<xsl:for-each select="odd">
<xsl:apply-templates />
</xsl:for-each>
</xsl:template>

<!--***********end cellscope stuff*******************-->


<!--***************** scopecontentc0x stuff ******************-->

<xsl:template name="scopecontentc0x">
<xsl:for-each select="acqinfo | arrangement | accessrestrict | accruals |altformavail | appraisal | bibliography | bioghist | custodhist | dao | descgrp | fileplan | note | odd | originalsloc | otherfindaid | phystech | prefercite | processinfo | relatedmaterial | scopecontent | separatedmaterial | userestrict">
<xsl:if test="self::bioghist">Biographical note: </xsl:if>
<xsl:if test="self::scopecontent">
<xsl:choose>
<xsl:when test="parent::*/acqinfo | parent::*/arrangement | parent::*/acessrestrict | parent::*/accruals | parent::*/altformavail | parent::*/appraisal | parent::*/bibliography | parent::*/bioghist | parent::*/custodhist | dao | parent::*/descgrp | parent::*/fileplan | parent::*/note | parent::*/odd | parent::*/originalsloc | parent::*/otherfindaid | parent::*/phystech | parent::*/prefercite | parent::*/processinfo | parent::*/relatedmaterial | parent::*/separatedmaterial | parent::*/userestrict">Scope and content: </xsl:when>
<xsl:otherwise></xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="self::arrangement">Arrangement: </xsl:if>
<xsl:if test="self::accessrestrict">Restrictions on access: </xsl:if>
<xsl:if test="self::accruals">Accruals: </xsl:if>
<xsl:if test="self::altformavail">Alternative formats available: </xsl:if>
<xsl:if test="self::appraisal">Appraisal note: </xsl:if>
<xsl:if test="self::bibliography">Bibliography: </xsl:if>
<xsl:if test="self::acqinfo">Provenance: </xsl:if>
<xsl:if test="self::custodhist">Custodial history: </xsl:if>
<xsl:if test="self::descgrp"><xsl:value-of select="head" />: </xsl:if>
<xsl:if test="self::fileplan">File plan: </xsl:if>
<xsl:if test="self::note"><xsl:choose><xsl:when test="@label"><xsl:value-of select="@label" />: </xsl:when><xsl:otherwise>Note: </xsl:otherwise></xsl:choose></xsl:if>
<xsl:if test="self::odd"><xsl:choose><xsl:when test="head"><xsl:value-of select="head" /></xsl:when><xsl:otherwise>Other descriptive information: </xsl:otherwise></xsl:choose></xsl:if>
<xsl:if test="self::originalsloc">Location of originals: </xsl:if>
<xsl:if test="self::otherfindaid">Other finding aids: </xsl:if>
<xsl:if test="self::phystech">Physical characteristics: </xsl:if>
<xsl:if test="self::prefercite">Preferred citation: </xsl:if>
<xsl:if test="self::processinfo">Processing information: </xsl:if>
<xsl:if test="self::relatedmaterial">Related material: </xsl:if>
<xsl:if test="self::separatedmaterial">Separated material: </xsl:if>
<xsl:if test="self::userestrict">Restrictions on use: </xsl:if>
<xsl:element name="div">
<xsl:attribute name="class">insetdsc</xsl:attribute>
<xsl:apply-templates />
</xsl:element>
</xsl:for-each>
<xsl:for-each select="controlaccess">
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:element name="div">
<xsl:attribute name="class">ruddy</xsl:attribute>
Search Terms
</xsl:element>
<xsl:for-each select="subject | persname | corpname | famname | function | title | occupation | genreform">
<xsl:sort select="." order="ascending" />
<xsl:apply-templates />
<xsl:element name="p" />
</xsl:for-each>
</xsl:element>
</xsl:for-each>
<xsl:if test="index">
<xsl:element name="div">
<xsl:attribute name="class">body</xsl:attribute>
<xsl:call-template name="index" /><xsl:element name="p" />
</xsl:element>
</xsl:if>
</xsl:template>


<!--*****************end scopecontent stuff********************-->


<!--********************* container stuff **************************-->
<xsl:template name="container">
<xsl:element name="div">
<xsl:attribute name="class">othercellright</xsl:attribute>
<xsl:choose>
<xsl:when test="did/physloc | did/container">
<xsl:choose>
<xsl:when test="did/physloc">
<xsl:for-each select="did/physloc">
<xsl:apply-templates />
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
<xsl:for-each select="did/container">
<xsl:choose>
<xsl:when test="following-sibling::container | preceding-sibling::container">
<xsl:if test="attribute::type='box'">
Box <xsl:value-of select="." />
<xsl:choose>
<xsl:when test="ancestor::ead//eadid[@mainagencycode='mu']">
<xsl:if test="following-sibling::container[@type='folder']">:<xsl:value-of select="following-sibling::container[@type='folder']" /></xsl:if>
<xsl:if test="following-sibling::container[@type='reel']">, reel <xsl:value-of select="following-sibling::container[@type='reel']" /></xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="following-sibling::container[@type='folder']">: folder <xsl:value-of select="following-sibling::container[@type='folder']" /></xsl:when>
<xsl:when test="following-sibling::container[@type='reel']">, reel <xsl:value-of select="following-sibling::container[@type='reel']" /></xsl:when>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="attribute::type='reel'">
<xsl:choose>
<xsl:when test="preceding-sibling::container[@type='box'] | following-sibling::container[@type='box']"></xsl:when>
<xsl:otherwise>Reel <xsl:value-of select="." />, fr.<xsl:value-of select="following-sibling::container[@type='frame']" />
</xsl:otherwise>
</xsl:choose>
</xsl:if>
<xsl:if test="attribute::type='volume'">
Vol. <xsl:value-of select="." />
<xsl:choose><xsl:when test="following-sibling::container[@type='page']">, p.<xsl:value-of select="." /></xsl:when><xsl:when test="following-sibling::container[@type='folio']">, fol.<xsl:value-of select="." /></xsl:when>
<xsl:otherwise /></xsl:choose>
</xsl:if>
<xsl:if test="attribute::type='mapcase'">
Map case <xsl:value-of select="." />
<xsl:choose><xsl:when test="following-sibling::container[@type='drawer']">, drawer <xsl:value-of select="following-sibling::container[@type='drawer']" /></xsl:when>
<xsl:otherwise /></xsl:choose>
</xsl:if>
<xsl:if test="attribute::type='oversize'">
O.S. <xsl:value-of select="." />
<xsl:choose>
<xsl:when test="following-sibling::container[@type='folder']">: <xsl:value-of select="following-sibling::container[@type='folder']" />
</xsl:when>
</xsl:choose>
</xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:choose>
<xsl:when test="@type='box' or @type='box-folder' or @type='folder' or @type='reel' or @type='volume' or @type='page' or @type='folio' or @type='frame' or @type='mapcase' or @type='drawer' or @type='oversize' or @type='othertype'">
<xsl:if test="@type='box'">Box <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='box-folder'">Box <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='folder'">Folder <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='reel'">Reel <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='reel-frame'">Reel <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='mapcase'">Map case <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='drawer'">Drawer <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='volume'">Vol. <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='page'">p.<xsl:apply-templates /></xsl:if>
<xsl:if test="@type='folio'">fol.<xsl:apply-templates /></xsl:if>
<xsl:if test="@type='frame'">fr.<xsl:apply-templates /></xsl:if>
<xsl:if test="@type='oversize'">O.S. <xsl:apply-templates /></xsl:if>
<xsl:if test="@type='othertype'"><xsl:apply-templates /></xsl:if>
</xsl:when>
<xsl:otherwise>
<xsl:apply-templates />
</xsl:otherwise>
</xsl:choose>
</xsl:otherwise>
</xsl:choose>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</xsl:when>
<xsl:otherwise>
<xsl:element name="br" />
</xsl:otherwise>
</xsl:choose>
</xsl:element>
</xsl:template>



</xsl:stylesheet>
