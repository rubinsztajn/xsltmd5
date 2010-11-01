<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="xml" omit-xml-declaration="yes"/>

<!-- http://hg.openjdk.java.net/jdk7/jsn/jdk (google code search [md5 lang:java]) -->

<!-- silliness -->
<xsl:template match="numbers">
4 + 3 = <xsl:value-of select="x + y" />
</xsl:template>

<!-- nonsilliness -->
<xsl:template name="md5II"> <!-- TODO: implement FF, GG, HH -->
	<xsl:param name="a">0</xsl:param>
	<xsl:param name="b">0</xsl:param>
	<xsl:param name="c">0</xsl:param>
	<xsl:param name="d">0</xsl:param>
	<xsl:param name="x">0</xsl:param>
	<xsl:param name="s">0</xsl:param>
	<xsl:param name="ac">0</xsl:param>

	<!--
        a += (c ^ (b | (~d))) + x + ac;
        return ((a << s) | (a >>> (32 - s))) + b;

	becomes...

	notd = ~d; // TODO: write bitwise NOT
	tmp1 = b | notd; // TODO: write bitwise OR
	tmp2 = c ^ tmp1; // TODO: write bitwise XOR
	a = a + tmp2;
	a = a + x;
	a = a + ac;

	tmp3 = a << s; // TODO: write bitwise shl
	tmp4 = 32 - s;
	tmp5 = a >>> tmp4; // TODO: write bitwise lshr
	tmp6 = tmp3 | tmp5;
	tmp7 = tmp6 + b;
	return tmp7;
	-->
</xsl:template>

</xsl:stylesheet>
