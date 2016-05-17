<%@page import="snapcity.model.Evento"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page language="java" import="snapcity.dao.DaoEvento"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"> </script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<script src="http://code.jquery.com/jquery-2.0.3.min.js" type="text/javascript"></script>
<script src="js/mapa.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCE_c3WG1QxjcPrwWNtp3MBZGnrues5Nk0&amp;sensor=false"></script>

 <script>
  
 
 function carregarPontos() {
	 
	    $.getJSON('rest/evento', function(evento) {
	 
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

</script>
<title>SnapCity</title>
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<img alt="SnapCity" src="/snapcity/img/snapcity.jpg" class="img-circle" height="140" width="140" /><h1> SnapCity</h1>
			<hr>
			<div class="jumbotron">
				
				<div id="mapa" style="height: 350px; width: 100%">
        </div>
 
        <!-- Maps API Javascript -->
        <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCE_c3WG1QxjcPrwWNtp3MBZGnrues5Nk0&amp;sensor=false"></script>
 
        <!-- Arquivo de inicialização do mapa -->
        <script src="js/mapa.js"></script>
        <h2>
					Bem vindos!
				</h2>
				<h3>
					Estágio da Faculdade UNIFIN  <br/>
					Objetivo e usar as tecnologias de mercado nesta cadeira de estágio.<p>E nesta cadeira estamos desenvolvendo um sistema REST. Nós temos o objetivo de desenvolver um aplicativo android e mostrar através de fotos tiradas do seu celular a situação de sua cidade, buracos, encanamentos abertos ou qualquer situação que possa alertar as autoridades para tomar uma ação.<br/>
				</h3>
        			<h3>Entre</h3>
					
					<a class="btn btn-primary btn-large" href="/snapcity/login.jsp">Login</a>
					<a class="btn btn-primary btn-large" href="/snapcity/CadastroUsuario.jsp">Cadastre-se</a>
				</p>
			</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>


</body>
</html>