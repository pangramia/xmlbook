<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="html" indent="yes"/>
    <xsl:param name="brand" select="'alibaba'"/>
    <xsl:param name="url">
        <xsl:choose>
            <xsl:when test="not($brand) and not(string($brand))">alibaba</xsl:when>
            <xsl:otherwise><xsl:value-of select="$brand"/></xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xsl:template match="/">
        <h1><xsl:value-of select="$url"/></h1>
        <div vocab="http://schema.org/" typeof="ItemList">
            <link property="url" href="http://{$url}?filters%5Bprice%5D%5BLTE%5D=39600" />
            <span property="numberOfItems"><xsl:value-of select="count(//product)"/></span>
            <xsl:apply-templates />
        </div>
    </xsl:template>
    <xsl:template match="product">
        <div property="itemListElement" typeof="Product">
            <img property="image" alt="Photo of product"
                 src="http://img01.multivarki.ru/c9/f1/a5fe6642-18d0-47ad-b038-6fca20f1c923.jpeg" />
            <a property="url" href="http://multivarki.ru/brand_502/">
                <span property="name"><xsl:value-of select="name"/></span>
            </a>
            <span class="description"><xsl:value-of select="description"/></span>
            <div property="offers" typeof="Offer">
                <meta property="schema:priceCurrency" content="USD">USD</meta>
                <meta property="schema:price" content="{price}"><xsl:value-of select="price"/></meta>
                <link property="schema:itemCondition" href="http://schema.org/NewCondition"/>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>