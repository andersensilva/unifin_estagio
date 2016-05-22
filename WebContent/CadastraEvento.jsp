<%@page import="snapcity.model.Evento"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page language="java" import="snapcity.dao.DaoEvento"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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



<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.js"></script>

<script src="js/mapa.js"></script>
<script type="text/javascript" src="js/jquery-ui.custom.min.js"></script>

<script type='text/javascript'>

var id = localStorage.id 

function redirecionar(){
	var url = "http://localhost:2020/snapcity/logado.jsp";  
	$(location).attr('href', url);
}
	
function encodeImageFileAsURL() {
  var filesSelected = document.getElementById("foto").files;
  if (filesSelected.length > 0) {
    var fileToLoad = filesSelected[0];
    var fileReader = new FileReader();
    fileReader.onload = function(fileLoadedEvent) {
      var srcData = fileLoadedEvent.target.result; // <--- data: base64
      var newImage = document.createElement('img');
      newImage.src = srcData; 
   
   
      document.getElementById("imgTest").innerHTML = srcData;
    
      jsonString = document.getElementById("imgTest").innerHTML;
      
     
    }
    fileReader.readAsDataURL(fileToLoad);
    return encodeImageFileAsURL;
  }
}

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


$(document).ready(function() {
   
	$("#cadastrar").click(function() {
			var p = new Object();
			p.foto = jsonString;
			$.ajax({
				url : "http://localhost:2020/snapcity/rest/evento",
				contentType : "application/json; charset=utf-8",
				type : "post",
				async: false,
				dataType : "json",
				data : JSON.stringify({
					id : $('#id').val(),
					foto : p.foto,
					descricao : $('#descricao').val(),
					longitude : $('#txtLongitude').val(),
					latitude : $('#txtLatitude').val(),
					tags : $('#tags').val(),
					id_usuario : localStorage.id
				}),
				
				error: function (data, textStatus, xhr) {
					console.log(data)
				},
				success : function(data) {
					

				}

			});
		});

	});
	

</script>

<title>Cadastra Eventos</title>
</head>
<body>
	<div class="container">
		<%@ include file="menu.jsp"%>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Cadastra Evento</h3>
			</div>
			<div class="panel-body">
				<div id="msg"></div>
				<form action="" method="POST">
					<div class="form-group">
						<input id="foto" type="file" onchange="encodeImageFileAsURL();" />
						<!-- <input id="foto" type="text" name="foto" value="asdasdasd" /> -->

					</div>
					<div class="form-group">
						<label for="inputlg">Descrição</label> <input class="form-control"
							id="descricao" name="descricao" type="text">
					</div>
					<div class="form-group">
						<label for="inputsm">Tags</label> <input class="form-control"
							id="tags" name="tags" type="text">
					</div>

					<fieldset>


						<div>
							<label for="txtEndereco">Endereço:</label> <input type="text"
								id="txtEndereco" name="txtEndereco" class="form-control" />
						</div>
						<div id="mapa" style="height: 500px; width: 100%">
							<script type="text/javascript"
								src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCE_c3WG1QxjcPrwWNtp3MBZGnrues5Nk0&amp;sensor=false"></script>
						</div>
						<input type="hidden" id="txtLatitude" name="txtLatitude" /> <input
							type="hidden" id="txtLongitude" name="txtLongitude" />
					</fieldset>
			</div>
			<!-- Id do usuário -->
			<input id="id_usuario" name="id_usuario" type="hidden" value="${localStorage.id}">
			<script>
			</script>
			<!-- input criado para poder gravar em evento -->
			<input id="id" name="id" type="hidden" value="0"> <input
				type="button" id="cadastrar" onclick="redirecionar();" class="btn btn-default" value="Enviar" />

			</form>
		</div>
	</div>

	<div id="imgTest" style="color:#FFF"></div>


</body>

</html>