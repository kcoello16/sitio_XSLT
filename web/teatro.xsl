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
				
				<main class="principal">	
					<section class="teatro">
						<!-- Listado de obras de Teatro -->
						<h1>PROXIMAS OBRAS DE TEATRO</h1>
						
						<!-- Seleccionamos y mostramos la fecha para las obras de teatro de enero de 2023 
						y las ordenamos por las más recientes -->
						<xsl:for-each select="teatro/fechahora[substring(@dia,1,7)='2023-01']">
							<xsl:sort select="@dia" order="descending" />
							<ul> 
							<!-- Las obras con precio menor de 20€ se mostrarán subrayadas. -->
								<xsl:if test="../precio&lt;20 ">
									<li class="subrayado"><xsl:value-of select='@dia'/> : <xsl:value-of select='../obra' /></li>
								</xsl:if>
								<xsl:if test="../precio > 20 ">
									<li><xsl:value-of select='@dia' /> : <xsl:value-of select='../obra' /></li>
								</xsl:if>
								
							</ul>	
						</xsl:for-each>
					</section>
				</main>
				
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>