<?php

	$servername = "localhost";
	$username   = "Manuel";
	$password   = "clavefacil";
	$database   = "lccopentech";

	$rel = array();
	$string = "";

	// Conectarse a la base de datos
	$conn = mysqli_connect($servername, $username, $password, $database)
           or die("Falló la conexión" . mysqli_error());

	// obtiene las tres búsquedas más relevantes
	$relevancias = mysqli_query($conn,"SELECT * FROM relevancias ORDER BY veces_buscada DESC LIMIT 3");
	while ($relevancia = mysqli_fetch_array($relevancias, MYSQLI_ASSOC)) {
		$string = $string . "| " . $relevancia["relevancia"] . " ";
	}

	echo $string . "|";
	mysqli_close($conn);
?>
