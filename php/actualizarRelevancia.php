<?php

	$coincidencias = $_POST['coincidencias'];

	$servername = "localhost";
	$username   = "Manuel";
	$password   = "clavefacil";
	$database   = "lccopentech";

	// Conectarse a la base de datos
	$conn = mysqli_connect($servername, $username, $password, $database)
           or die("Falló la conexión" . mysqli_error());

	// ----------------------------------------------------
	// Algoritmo de relevancia

	// Se recorre la lista de coincidencias
	foreach ($coincidencias as &$coincidencia) {
		// Si ya existe en la tabla, incrementa en uno las veces que la han buscado
		$relevancias = mysqli_query($conn,"SELECT * FROM relevancias WHERE relevancia='" . $coincidencia . "'");
		if($relevancia = mysqli_fetch_array($relevancias, MYSQLI_ASSOC)) {
			$cantidadDeBusquedas = (int)$relevancia["veces_buscada"];
			$cantidadDeBusquedas++;
			mysqli_query($conn,"UPDATE relevancias SET veces_buscada=".$cantidadDeBusquedas." WHERE id=".$relevancia["id"]);
		}
		// si no, la creas con veces_buscada = 1
		else mysqli_query($conn,"INSERT INTO relevancias (relevancia, veces_buscada) VALUES ('".$coincidencia."', '1')");
	}

	mysqli_close($conn);
?>
