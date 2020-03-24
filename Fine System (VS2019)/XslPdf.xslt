<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:output version="1.0" method="xml" encoding="ISO-8859-1" indent="no"/>
	<xsl:param name="SV_OutputFormat" select="'PDF'"/>
	<xsl:variable name="XML" select="/"/>
	<xsl:variable name="fo:layout-master-set">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="default-page" page-height="11in" page-width="8.5in" margin-left="0.6in" margin-right="0.6in">
				<fo:region-body margin-top="0.79in" margin-bottom="0.79in"/>
			</fo:simple-page-master>
		</fo:layout-master-set>
	</xsl:variable>
	<xsl:template match="/">
		<fo:root>
			<xsl:copy-of select="$fo:layout-master-set"/>
			<fo:page-sequence master-reference="default-page" initial-page-number="1" format="1">
				<fo:flow flow-name="xsl-region-body">
					<fo:block>
						<xsl:for-each select="$XML">
							<fo:table table-layout="fixed" background-color="#a0a0ff" width="100%" border="solid 1pt gray" border-spacing="2pt">
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-body start-indent="0pt">
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" text-align="center" display-align="center">
											<fo:block>
												<fo:inline>
													<xsl:text>COMPORTAMIENTO FINANCIERO HISTORICO</xsl:text>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
							<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-body start-indent="0pt">
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline>
													<xsl:text>Número de Identificación : </xsl:text>
												</fo:inline>
												<xsl:for-each select="root">
													<xsl:for-each select="data">
														<xsl:for-each select="iduser">
															<fo:inline>
																<xsl:apply-templates/>
															</fo:inline>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
							<xsl:if test="root/data/historical">
								<fo:table table-layout="fixed" background-color="#d2d2d2" width="100%" border="solid 1pt gray" border-spacing="2pt">
									<fo:table-column column-width="174"/>
									<fo:table-column column-width="100%"/>
									<fo:table-column column-width="158"/>
									<fo:table-header start-indent="0pt">
										<fo:table-row>
											<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
												<fo:block>
													<fo:inline>
														<xsl:text>Mes</xsl:text>
													</fo:inline>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
												<fo:block>
													<fo:inline>
														<xsl:text>Descripción</xsl:text>
													</fo:inline>
												</fo:block>
											</fo:table-cell>
											<fo:table-cell border="solid 1pt gray" padding="2pt" text-align="center" display-align="center">
												<fo:block>
													<fo:inline left="inherit">
														<xsl:text>Puntaje</xsl:text>
													</fo:inline>
												</fo:block>
											</fo:table-cell>
										</fo:table-row>
									</fo:table-header>
									<fo:table-body start-indent="0pt">
										<xsl:for-each select="root">
											<xsl:for-each select="data">
												<xsl:for-each select="historical">
													<fo:table-row>
														<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
															<fo:block>
																<xsl:for-each select="month">
																	<fo:inline>
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
															<fo:block>
																<xsl:for-each select="description">
																	<fo:inline>
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
															<fo:block>
																<xsl:for-each select="score">
																	<fo:inline>
																		<xsl:apply-templates/>
																	</fo:inline>
																</xsl:for-each>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
									</fo:table-body>
								</fo:table>
							</xsl:if>
							<fo:table table-layout="fixed" width="100%" border="solid 1pt gray" border-spacing="2pt">
								<fo:table-column column-width="proportional-column-width(1)"/>
								<fo:table-body start-indent="0pt">
									<fo:table-row>
										<fo:table-cell border="solid 1pt gray" padding="2pt" display-align="center">
											<fo:block>
												<fo:inline>
													<xsl:text>Fin del reporte</xsl:text>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
								</fo:table-body>
							</fo:table>
							<fo:block>
								<fo:leader leader-pattern="space"/>
							</fo:block>
						</xsl:for-each>
					</fo:block>
					<fo:block id="SV_RefID_PageTotal"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
	<xsl:template name="double-backslash">
		<xsl:param name="text"/>
		<xsl:param name="text-length"/>
		<xsl:variable name="text-after-bs" select="substring-after($text, '\')"/>
		<xsl:variable name="text-after-bs-length" select="string-length($text-after-bs)"/>
		<xsl:choose>
			<xsl:when test="$text-after-bs-length = 0">
				<xsl:choose>
					<xsl:when test="substring($text, $text-length) = '\'">
						<xsl:value-of select="concat(substring($text,1,$text-length - 1), '\\')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$text"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat(substring($text,1,$text-length - $text-after-bs-length - 1), '\\')"/>
				<xsl:call-template name="double-backslash">
					<xsl:with-param name="text" select="$text-after-bs"/>
					<xsl:with-param name="text-length" select="$text-after-bs-length"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
