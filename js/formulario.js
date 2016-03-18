$(document).ready(function(){ 

	
	// Función que se ejecuta tras intentar subir el formularo
	$('#formulario').submit(function(event) {
		event.preventDefault();

		var string      = "Su búsqueda contiene:\n\n";
		var coincidencias = new Array();


		// enlista todas las marcas de la búsqueda
		string += "Marcas:\n";
		var iteracion = 0;
		$( "b" ).each(function( index ) {

			iteracion++;
			string += " - "+ $(this).html() +"\n";
			coincidencias.push($(this).html());
		});
		if(iteracion == 0) string += "- cero marcas\n";


		// enlista todos los tipos de ropa de la búsqueda
		string += "\nTipos de ropa:\n";
		iteracion = 0;
		$( "i" ).each(function( index ) {

			iteracion++;
			string += " - "+ $(this).html() +"\n";
			coincidencias.push($(this).html());
		});
		if(iteracion == 0) string += "- cero tipos de ropa\n";


		// enlista todos los Equipos deportivos de la búsqueda
		string += "\nEquipos deportivos:\n";
		iteracion = 0;
		$( "ins" ).each(function( index ) {

			iteracion++;
			string += " - "+ $(this).html() +"\n";
			coincidencias.push($(this).html());
		});
		if(iteracion == 0) string += "- cero equipos deportivos\n";

		// muestra la lista de todo lo buscado
		alert(string);


		// Actualiza en la base de datos las palabras más relevantes
		$.ajax({
			type:     "POST",
			dataType: "json",
			data:     {coincidencias:coincidencias},
			url:      "php/actualizarRelevancia.php"
		});

	});
});