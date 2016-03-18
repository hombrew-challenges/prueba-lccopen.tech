$(document).ready(function(){

	$.ajax({
		type:     "POST",
		url:      "php/palabras_relevantes.php",
		success:  function(data){

			if(data != "") {
				$( "#palabras-relevantes" ).html( "<strong>Palabras Relevantes:</strong> " + data);
			}
		}
	});
});