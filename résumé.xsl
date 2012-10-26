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

				<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
				<meta name="apple-mobile-web-app-capable" content="yes" />
				<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

				<link rel="stylesheet" href="résumé.css" />

				<xsl:if test="/résumé/analytics/@id">
					<xsl:variable name="apos" select='"&apos;"'/>

					<script>
						var _gaq = _gaq || [];

						<xsl:value-of select="concat('_gaq.push([', $apos, '_setAccount', $apos, ', ', $apos, /résumé/analytics/@id)" />']);
						_gaq.push(['_trackPageview']);

						(function() {
						var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
						ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
						var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
						})();
					</script>
				</xsl:if>
			</head>

			<body>
				<div itemscope="itemscope" itemtype="http://data-vocabulary.org/Person">
					<div>
						<ul>
							<xsl:for-each select="/résumé/about/social/link">
								<li>
									<xsl:element name="a">
										<xsl:attribute name="href">
											<xsl:value-of select="@href" />
										</xsl:attribute>

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
								</li>
							</xsl:for-each>
						</ul>

						<address itemprop="address" itemscope="itemscope" itemtype="http://data-vocabulary.org/Address">
							<xsl:element name="a">
								<xsl:attribute name="href">
									<xsl:value-of select="/résumé/about/address/@href" />
								</xsl:attribute>

								<xsl:for-each select="/résumé/about/address/line">
									<xsl:if test="preceding-sibling::line">
										<br />
									</xsl:if>

									<xsl:choose>
										<xsl:when test="@type">
											<xsl:element name="span">
												<xsl:attribute name="itemprop">
													<xsl:value-of select="@type" />
												</xsl:attribute>

												<xsl:value-of select="." />
											</xsl:element>
										</xsl:when>

										<xsl:otherwise>
											<xsl:value-of select="." />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>
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
						<h1 itemprop="name">
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
									<xsl:value-of select="." disable-output-escaping="yes" />
								</p>
							</section>
						</xsl:for-each>
					</section>

					<xsl:for-each select="/résumé/experience/section">
						<section>
							<h2>
								<xsl:value-of select="@title" />
							</h2>

							<xsl:variable name="sectionTitle" select="@title" />

							<xsl:for-each select="entry">
								<xsl:variable name="roleTitle">
									<xsl:choose>
										<xsl:when test="@to = 'Current' and $sectionTitle = 'Employment'">
											<span itemprop="affiliation">
												<xsl:value-of select="title" />
											</span>
										</xsl:when>

										<xsl:otherwise>
											<xsl:value-of select="title" />
										</xsl:otherwise>
									</xsl:choose>
								</xsl:variable>

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

													<xsl:copy-of select="$roleTitle" />
												</xsl:element>
											</xsl:when>

											<xsl:otherwise>
												<xsl:value-of select="$roleTitle" />
											</xsl:otherwise>
										</xsl:choose>

										<br />

										<xsl:if test="role">
											<strong>
												<xsl:if test="@to = 'Current' and $sectionTitle = 'Employment'">
													<xsl:attribute name="itemprop">title</xsl:attribute>
												</xsl:if>

												<xsl:value-of select="role" />
											</strong>

											<xsl:text> </xsl:text>
										</xsl:if>

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