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
				
				<section class="festival">
					<h1>Festivales de rock</h1>
					<table>
						<tr>
							<th>FESTIVAL</th>
							<th>CONCIERTO</th>
							<th>FECHA</th>
							<th>HORA</th>
							<th>LUGAR</th>
						</tr>
						<!-- Seleccionamos el concierto por tipo de música que queremos mostrar y les aplicamos la plantilla -->
						<xsl:apply-templates select="festival/conciertos/concierto/grupo[@tipomusica='rock']" />
					</table>			 
				</section>
				
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<!-- Formateamos los festivales de acuerdo al tipo de musica-->
	<xsl:template match="festival/conciertos/concierto/grupo[@tipomusica='rock']">
		
		<tr>
		<!-- Mostramos el nombre del festival, el tipo de grupo, su fecha, su hora  y el lugar-->
			<td><xsl:value-of select='../../../nombrefesti' /></td>
			<td><xsl:value-of select='../grupo' /></td>
			<td><xsl:value-of select='../fecha' /></td>
			<td><xsl:value-of select='../hora' /></td>
			<td><xsl:value-of select='../carpa' /></td>
		</tr> 
	</xsl:template>
</xsl:stylesheet>