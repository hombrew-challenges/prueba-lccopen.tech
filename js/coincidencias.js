$(document).ready(function(){

	// Función que ejecuta "callback" tantos "ms" después de ser llamada,
	// pero resetea el timeout si se vuelve a llamar antes de transcurridos los "ms"
	var delay = (function(){
		var timer = 0;
		return function(callback, ms){
			clearTimeout (timer);
			timer = setTimeout(callback, ms);
		};
	})();


	// Función que se ejecuta después de presionar cada letra en el input "#busqueda"
	// esto se hace con la intención de no sobrecargar el servidor
	$( "#busqueda" ).on("keyup", function() {

		// Un segundo después de presionar la última tecla:
		delay(function(){

			var words = $( "#busqueda" ).val().trim().split(" ");

			$.ajax({
				type:     "POST",
				dataType: "json",
				data:     {words:words},
				url:      "php/coincidencias.php",
				success:  function(data){

					var resultado    = "";
					// resultado = data;

					data.forEach(function(entry) {

						// entry[0] es el string
						// entry[1] es el estilo

						// si tiene estilo, envuelve el string entre las etiquetas del mismo
						if (entry[1] != "") {

							var wrapper = entry[1].split(" ");
							entry[0]    = wrapper[0] + entry[0] + wrapper[1];
						}

						resultado += entry[0] + " ";
					});

					resultado = resultado.trim();
					$( "#resultado" ).html("<strong>Resultados:</strong> " + resultado);
				}
			});
		}, 1000 );
	});

});