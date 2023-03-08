<?xml version="1.0" encoding='utf-8'?>
<!-- Módulo: Lenguaje de marcas y sistema de gestión de la información. 
     Tarea: Tarea Evaluación 02 - XSLT
     UD: UD4
     Autor: Keidy Yesenia Coello Garay
     Fecha: 09/03/2023
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="about:legacy-compat" />
	<xsl:template match='/reservaeventos'>
		<html lang="es">
			
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
				<meta charset="utf-8"/>
				<meta name="description" content="Página principal" />
				<title>titulo de la web</title>
			</head>
			
			<body>
				<header>
					<img src= "../img/logotipo.png" alt= "Reservas" />
					<a href="teatro.xml">Teatro</a>
					<a href="restaurante.xml">Restaurante</a>
					<a href="festival.xml">Festival</a>
				</header>
				
				<main>
				<!-- Creamos una variable para cargar el dato del nombre del restaurante -->
					<xsl:variable name="resNom"  select='restaurante/nombrerestaurante' />
					
					<!-- Al clicar encima del nombre del restaurante se abrirá un link a la página oficial. -->
					<h1><a href="{restaurante/informacion}" target="_blank"><xsl:value-of select='$resNom' /> - <xsl:value-of select='restaurante/ciudad' /></a></h1>
					
					<xsl:for-each select="restaurante">
					<!-- Seleccionamos solo el primer restaurante -->
						<xsl:if test="position()=1">
						<!-- Seleccionamos y mostramos los tipo de menu -->
							<xsl:for-each select="menu">
								<article class="restaurante">
									<h3><xsl:value-of select='@tipo' /></h3>
									<!-- Seleccionamos y mostramos los platos. -->
									<xsl:for-each select="plato">
										<p><xsl:value-of select='.' /></p>
									</xsl:for-each>
								</article> 
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>

				</main>
				
				<footer>
					<address>&#169; 2020 desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>