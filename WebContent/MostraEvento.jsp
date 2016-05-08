<%@page import="snapcity.model.Evento"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@page language="java" import="snapcity.dao.DaoEvento"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"> </script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<script src="http://code.jquery.com/jquery-2.0.3.min.js" type="text/javascript"></script>
<script src="js/script.js" type="text/javascript"></script>
 <script>
         $(document).ready(function () {
             $("#exclui").click(function () {
                
                 var del = new Object();
                 del.id = $('#id').val();
                 
 
                 $.ajax({
                     url: 'http://localhost:8080/snapcity/rest/evento/'+del.id,
                     type: 'DELETE',
                     dataType: 'json',
                     //data:del,
                     success: function (data, textStatus, xhr) {
                         console.log(data);
                     },
                     error: function (xhr, textStatus, errorThrown) {
                         console.log('Error in Operation');
                     }
                 });
             });
         });
    </script>
<title>Mostra Eventos</title>
</head>
<body onload="carregarItens()">
	<div class="container">
	<%@ include file="menu.jsp" %>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Mostra Todos os Eventos</h3>
			</div>
			<div class="panel-body">
				
		<section>
			<h1>Eventos</h1>
			<!--�rea que mostrar� carregando-->
			<h2></h2>
			<!--Tabela-->
			<table id="minhaTabela" class="table table-striped">
				<caption>Retorno de dados</caption>
				<thead>
					<th>id</th>
					<th>Longitude</th>
					<th>Latitude</th>
					<th>Descricao</th>
					<th>Data de Cadastro</th>
					<th> A��es </th>
					
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