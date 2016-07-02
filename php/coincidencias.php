<?php
	$words = $_POST['words'];
	$json  = array();


	$servername = "localhost";
	$username   = "Manuel";
	$password   = "clavefacil";
	$database   = "lccopentech";


	// Conectarse a la base de datos
	$conn = mysqli_connect($servername, $username, $password, $database)
           or die("Falló la conexión" . mysqli_error());

	// ----------------------------------------------------
    // Algoritmo de coincidencias

	$cantidadDePalabras = count($words);
	if($cantidadDePalabras > 0) {

		// $j -> posición de comienzo de palabra a considerar para consulta
		// $i -> cantidad de palabras a considerar por iteración para consulta
		for($j = 0; $j < $cantidadDePalabras; $j++){

			for($i = 1; $i <= $cantidadDePalabras - $j; $i++) {
				$campoConformado       = array_slice($words, $j ,$i);
				$stringCampoConformado = "";
				foreach ($campoConformado as &$palabra) {
					$stringCampoConformado .= $palabra . " ";
				}
				trim($stringCampoConformado);
				$estilo = "";
				$estiloEncontrado = false;
				if(marca($conn, strtolower($stringCampoConformado))) {
					$estilo = "<b> </b>";
					$estiloEncontrado = true;
				}
				else if(ropa($conn, strtolower($stringCampoConformado))) {
					$estilo = "<i> </i>";
					$estiloEncontrado = true;
				}
				else if(equipo($conn, strtolower($stringCampoConformado))) {
					$estilo = "<ins> </ins>";
					$estiloEncontrado = true;
				}
				// Si se encontró el estilo, devuelve el string con su estilo,
				// se sale del ciclo y comienza a buscar coincidencias
				// justo después del string devuelto
				if($estiloEncontrado) {
					array_push($json, array($stringCampoConformado, $estilo));
					$j += $i - 1;
					break;
				}
			}
			if(!$estiloEncontrado) {
				array_push($json, array($words[$j], ""));
			}
		}
	}

	// Devuelve las coincidencias con su estilo
	echo json_encode($json);
	mysqli_close($conn);


	// ----------------------------------------------------
	// Funciones

	// Revisa si la palabra es una marca
	function marca($conn, $word) {
		$marcas = mysqli_query($conn,"SELECT * FROM marcas WHERE marca='" . $word . "'");
		if($marca = mysqli_fetch_array($marcas, MYSQLI_ASSOC)) {
			return true;
		}
		return false;
	}

	// Revisa si la palabra es un tipo de ropa
	function ropa($conn, $word) {
		$ropas = mysqli_query($conn,"SELECT * FROM ropas WHERE ropa='" . $word . "'");
		if($ropa = mysqli_fetch_array($ropas, MYSQLI_ASSOC)) {
			return true;
		}
		return false;
	}

	// Revisa si la palabra es un equipo
	function equipo($conn, $word) {
		$equipos = mysqli_query($conn,"SELECT * FROM equipos WHERE equipo='" . $word . "'");
		if($equipo = mysqli_fetch_array($equipos, MYSQLI_ASSOC)) {
			return true;
		}
		return false;
	}
?>
