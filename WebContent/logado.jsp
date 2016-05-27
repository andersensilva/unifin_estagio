
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONException"%>
<%@page import="snapcity.model.Evento"%>
<%@page import="java.util.List"%>
<%@page language="java" import="snapcity.dao.DaoEvento"%>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<style type="text/css"> //janela modal
    .bs-example{
            margin: 20px;
    }
</style>


<script>

var nome = localStorage.nome
var id = localStorage.id 
var email = localStorage.email

//função usada para captar o id do evento para poder alterar
function idevento(id){
	localStorage . setItem ( 'idevento' , id );
	
}


//função para passar imagem para base 64
function encodeImageFileAsURL() {
	var filesSelected = document.getElementById("foto").files;
	if (filesSelected.length > 0) {
		var fileToLoad = filesSelected[0];
		var fileReader = new FileReader();
		fileReader.onload = function(fileLoadedEvent) {
			var srcData = fileLoadedEvent.target.result; // <--- data: base64
			var newImage = document.createElement('img');
			newImage.src = srcData;
			jsonString = srcData;
			
		}
		fileReader.readAsDataURL(fileToLoad);
		return encodeImageFileAsURL;
	}
}


//função para quando clicar em sair limpar todos os cookies
function sair(){
	localStorage.clear();
	var url = "http://localhost:2020/snapcity/login.jsp";  
	$(location).attr('href', url);
}



//Função para excluir um evento
function exclui(id){
	
			var del = new Object();
			del.id = id;
			
			$.ajax({
				url : "http://localhost:2020/snapcity/rest/evento/delete",
				contentType : "application/json; charset=utf-8",
				type : "post",
				dataType : "json",
				data : JSON.stringify({
					id : del.id,
					
				}),
				success : function(data) {
					

				}
			});
			var url = "http://localhost:2020/snapcity/logado.jsp";  
			$(location).attr('href', url);
}


//Funão que carrega os pontos conforme seus eventos
function carregarPontos() {
	
    $.getJSON('rest/usuarios/'+id+'/evento', function(evento) {
 
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

//Função que pega o endereço e pega a latitude e a longitude e cadastra no banco
$(document).ready(function () {
    
    $("#btnEndereco").click(function() {
        if($(this).val() != "")
            carregarNoMapa($("#txtEndereco").val());
    })
 
    $("#txtEndereco").blur(function() {
        if($(this).val() != "")
            carregarNoMapa($(this).val());
    })
 
	 
    function carregarNoMapa(endereco) {
        geocoder.geocode({ 'address': endereco + ', Brasil', 'region': 'BR' }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
 
                    $('#txtEndereco').val(results[0].formatted_address);
                    $('#txtLatitude').val(latitude);
                    $('#txtLongitude').val(longitude);
 
                    var location = new google.maps.LatLng(latitude, longitude);
                    marker.setPosition(location);
                    map.setCenter(location);
                    map.setZoom(16);
                }
            }
        });
        
        $(document).ready(function () {
            
        	 
            $("#txtEndereco").autocomplete({
                source: function (request, response) {
                    geocoder.geocode({ 'address': request.term + ', Brasil', 'region': 'BR' }, function (results, status) {
                        response($.map(results, function (item) {
                            return {
                                label: item.formatted_address,
                                value: item.formatted_address,
                                latitude: item.geometry.location.lat(),
                                longitude: item.geometry.location.lng()
                            }
                        }));
                    })
                },
                select: function (event, ui) {
                    $("#txtLatitude").val(ui.item.latitude);
                    $("#txtLongitude").val(ui.item.longitude);
                    var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
                    marker.setPosition(location);
                    map.setCenter(location);
                    map.setZoom(16);
                }
            });
        });
        
    }
});


function imprimir(){
	document.write("<h1>"+localStorage.nome+"</h1>");
	document.write("<h3>"+localStorage.email+"</h3>");
}

//Função para atualizar o evento
$(document).ready(function() {
	  
	$("#atualizar").click(function() {
			var p = new Object();
			p.foto = jsonString;
			$.ajax({
				url : "http://localhost:2020/snapcity/rest/evento",
				contentType : "application/json; charset=utf-8",
				type : "PUT",
				dataType : "json",
				data : JSON.stringify({
					id : localStorage.idevento,
					foto : p.foto,
					descricao : $('#descricao').val(),
					longitude : $('#txtLongitude').val(),
					latitude : $('#txtLatitude').val(),
					tags : $('#tags').val(),
					id_usuario : localStorage.id
				}),
				success : function(data) {
					console.log(data);
				}
			});
			var url = "http://localhost:2020/snapcity/logado.jsp";  
			$(location).attr('href', url);
		});
	});
	
</script>
<body>
 <div class="container-fluid">
	<div class="row">
	<%@ include file="menu.jsp"%>
	<input type="submit" id="sair" class="btn btn-default" 
					onclick="sair();"	value="Sair" />
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
					<h1>Seja Bem Vindo!</h1>
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
					<th>Alterar</th>
					<th>Excluir</th>
				
				</thead>
				<tbody>
				</tbody>
			</table>
		</section>
		</div>
	</div>
</div>

    
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Atualiza Evento</h4>
                </div>
                <div class="modal-body">
				<div id="msg"></div>
				<div class="form-group">
					<input id="id" name="id" type="hidden" value="${localStorage.idevento}">
				</div>
				<div class="form-group">
					<input id="foto" type="file" onchange="encodeImageFileAsURL();" />
					<!-- <input id="foto" type="text" name="foto" value="asdasdasd" /> -->

				</div>
				<div class="form-group">
					<label for="inputlg">Descricao</label> <input class="form-control"
						id="descricao" name="descricao" type="text">
				</div>
				<div class="form-group">
					<label for="inputsm">Tags</label> <input class="form-control"
						id="tags" name="tags" type="text">
				</div>

				<fieldset>
					<div>
						<label for="txtEndereco">Endereco:</label> <input type="text"
							id="txtEndereco" name="txtEndereco" class="form-control" />
					</div>
					<div>
						<input type="button" id="btnEndereco" name="btnEndereco"
							value="Mostrar no mapa" />
					</div>
					<div id="mapa" style="height: 200px; width: 20%">
						<script type="text/javascript"
							src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCE_c3WG1QxjcPrwWNtp3MBZGnrues5Nk0&amp;sensor=false"></script>
					</div>
					<input type="hidden" id="txtLatitude" name="txtLatitude" /> <input
						type="hidden" id="txtLongitude" name="txtLongitude" />
				</fieldset>
					</div>
                </div>
                
                
                
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <!-- Id do usu·rio -->
					<input id="id_usuario" name="id_usuario" type="hidden" value="${localStorage.id}">
		
					<!-- input criado para poder gravar em evento -->
					<input id="id" name="id" type="hidden" > 
					<input type="button" id="atualizar" class="btn btn-default" value="Enviar" />
                
                </div>
         </div>
  </div>

</body>
</html>