<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8" indent="yes" />

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes"><![CDATA[<!DOCTYPE html>]]>
		</xsl:text>

		<html lang="en">
			<head>
				<title>
					<xsl:value-of select="concat(/résumé/about/name/first, ' ', /résumé/about/name/last, ' - ')" />Curriculum vitæ / Résumé
				</title>

				<link rel="stylesheet" href="résumé.css" />
			</head>

			<body>
				<div>
					<div>
						<p>
							<xsl:for-each select="/résumé/about/social/link">
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="@href" />
									</xsl:attribute>

									<xsl:attribute name="rel">nofollow</xsl:attribute>

									<xsl:element name="img">
										<xsl:attribute name="src">
											<xsl:value-of select="image/@src" />
										</xsl:attribute>

										<xsl:attribute name="alt">
											<xsl:value-of select="image/@title" />
										</xsl:attribute>

										<xsl:attribute name="height">22</xsl:attribute>
									</xsl:element>
								</xsl:element>

								<xsl:if test="following-sibling::link">
									<xsl:text> </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</p>

						<address>
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="/résumé/about/address/@href" />
								</xsl:attribute>

								<xsl:value-of select="/résumé/about/address" disable-output-escaping="yes" />
							</xsl:element>
						</address>

						<ul>
							<li>
								<xsl:value-of select="/résumé/about/contact/tele" />
							</li>

							<li>
								<xsl:element name="a">
									<xsl:attribute name="href">
										<xsl:value-of select="concat('mailto:', /résumé/about/contact/email)" />
									</xsl:attribute>

									<xsl:value-of select="/résumé/about/contact/email" />
								</xsl:element>
							</li>
						</ul>
					</div>

					<header>
						<h1>
							<xsl:value-of select="concat(/résumé/about/name/first, ' ', /résumé/about/name/last)" />
						</h1>

						<p>
							<xsl:value-of select="/résumé/statement" />
						</p>
					</header>

					<section>
						<h2>Skills</h2>

						<xsl:for-each select="/résumé/skills/set">
							<section>
								<h3>
									<xsl:value-of select="@title" />
								</h3>

								<p>
									<xsl:value-of select="." />
								</p>
							</section>
						</xsl:for-each>
					</section>

					<xsl:for-each select="/résumé/experience/section">
						<section>
							<h2>
								<xsl:value-of select="@title" />
							</h2>

							<xsl:for-each select="entry">
								<article>
									<h3>
										<xsl:choose>
											<xsl:when test="@href">
												<xsl:element name="a">
													<xsl:attribute name="href">
														<xsl:value-of select="@href" />
													</xsl:attribute>

													<xsl:if test="@rel">
														<xsl:attribute name="rel">
															<xsl:value-of select="@rel" />
														</xsl:attribute>
													</xsl:if>

													<xsl:value-of select="title" />
												</xsl:element>
											</xsl:when>

											<xsl:otherwise>
												<xsl:value-of select="title" />
											</xsl:otherwise>
										</xsl:choose>

										<xsl:text> </xsl:text>

										<small>
											<xsl:value-of select="@from" />

											<xsl:if test="@to">
												<xsl:text> - </xsl:text>

												<xsl:value-of select="@to" />
											</xsl:if>
										</small>
									</h3>

									<p>
										<xsl:value-of select="content" disable-output-escaping="yes" />
									</p>
								</article>
							</xsl:for-each>
						</section>
					</xsl:for-each>

					<footer>
						<p>
							<a href="https://github.com/MartinGallagher/Resume" rel="nofollow">Source Code</a>
						</p>
					</footer>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>