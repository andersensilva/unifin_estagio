<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
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
<script src="js/jquery-1.12.3.min.js"></script>
<script>
    $(document).ready(function () {
        $("#buscar").click(function () {
       	 	var mostra = new Object();
            mostra.id = $('#id').val();
            $.ajax({
                url: 'http://localhost:2020/snapcity/rest/evento/'+mostra.id,
                type: 'GET',
                dataType: 'json',
                data:mostra, 
                success: function (data, textStatus, xhr) {
               	 	$('#formExclui').css("display","block");
               	 	$('#carregando').hide();
		 			$("#resBusca").html('<b>Resultado da busca</b><br /><br/><table class="table"><tr><th rowspan="5" ><img class="img-thumbnail" height="200px" width="200px" src="'+ data.foto + '"</th> <td> Descrição: '+data.descricao+'</td></tr><tr><td> Tags:'+data.tags+' </td></tr><tr><td> Latitude: '+data.latitude+' </td></tr><tr><td> Longitude: '+data.longitude+'</td></tr><tr><td> Data de Criação: '+data.datacriacao+'</td></tr></table>');
                } 
            });
        }); 
    });
 
</script>

<title>Busca Eventos</title>
</head>
<body>
<div class="container">
	<%@ include file="menu.jsp" %>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Busca Evento </h3>
			</div>
			<div class="panel-body">
				<form>	
					<div class="form-group">
						<label for="inputlg">ID</label> 
						<input class="form-control" id="id" name="id" type="number" min="0">
					</div>
					<input type="button" id="buscar" value="Buscar" />
				</form>
			</div>	
		</div>
	<br/>
	<div id="carregando" style="display:none;"><img src="img/carregandoAjax.gif" /></div>
	<!--Aqui é onde vai aparecer o resultado da busca-->
	<div id="resBusca"><div>	
	
	<div id="formExclui" name="formExclui" style="display:none;">
		<form >	<input type="button" id="exclui" value="Excluir" /></form>
	</div>
	
</div> 
	
</body>
</html>