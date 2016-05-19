<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>


<%@page language="java" import="snapcity.dao.DaoUsuario"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="js/scriptUsuario.js" type="text/javascript"></script>
<script src="js/BuscaEvento.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCE_c3WG1QxjcPrwWNtp3MBZGnrues5Nk0&amp;sensor=false"></script>
<script src="js/mapa.js"></script>

<script>

function getUrlVars () 
{ 
    var vars =  [], hash ; 
    var hashes = window . location . href . slice ( window . location . href . indexOf ( '?' )  +  1 ). split ( '&' ); 
    for ( var i =  0 ; i < hashes . length ; i ++) 
    { 
        hash = hashes [ i ]. split ( '=' ); 
        vars . push ( hash [ 0 ]); 
        vars [ hash [ 0 ]]  = hash [ 1 ]; 
    } 
    return vars ; 
}

var user = getUrlVars () [ "user" ]; 
var nome = getUrlVars () [ "nome" ]; 
var email = getUrlVars () [ "email" ];

function carregarPontos() {
	
    $.getJSON('rest/usuarios/login?user='+user, function(evento) {
 
        $.each(evento , function(index, evento) {
 
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(evento.latitude, evento.longitude),
                map: map,

            });          	 
            var infowindow = new google.maps.InfoWindow(), marker;
            	 
            	google.maps.event.addListener(marker, 'click', (function(marker, i) {
            	    return function() {
            	    	
            	        infowindow.setContent("<h3>"+evento.descricao+"</h3><p>Tags: "+evento.tags+"</p>");
            	        
            	        infowindow.open(map, marker);
            	    }
            	})(marker))
        });
 
    });
 
}
 
carregarPontos();

function imprimir(){
	document.write("");
	document.write("<h1>Bem Vindo<h1> <h3>" + nome + " </h3> <h3> " + email +"</h3");
}
</script>
<body>
 <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
					<script>imprimir();</script>
				</div>
				<div class="col-md-8">
				 		<div id="mapa" style="height: 400px; width: 100%">
        				</div>	  
				</div>
			</div>
			
			<h3>
				Eventos Cadastrados
			</h3>
				<section>
				 <body onload="carregarItensBusca1()">
			<!--Área que mostrará carregando-->
			<h2></h2>
			<!--Tabela-->
			<table id="minhaTabelaBusca1" class="table table-striped">
				<caption>Retorno de dados</caption>
				<thead>
					<th>id</th>
					<th>Foto</th>
					<th>Longitude</th>
					<th>Latitude</th>
					<th>Descricao</th>
					<th>Data de Cadastro</th>
				
				</thead>
				<tbody>
				</tbody>
			</table>
		</section>
		</div>
	</div>
</div>
</body>
</html>