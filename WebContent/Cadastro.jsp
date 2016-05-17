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
	
<script>
	$(function() {
		$("#tabs").tabs();
	});

	//Metodo chamada Ajax para cadastro de usuario
	$(document).ready(function() {
		$("#cadastrar").click(function() {
			$.ajax({
				url : "http://localhost:8080/snapcity/rest/usuarios",
				contentType : "application/json; charset=utf-8",
				type : "post",
				dataType : "json",
				data : JSON.stringify({
					nome : $('#nome').val(),
					senha : $('#senha').val(),
					email : $('#email').val()
				}),
				success : function(data) {
					console.log(data);

				}

			});
		});

	});

	// Metodo de chamada Ajax para Alterar o Cadastro
	$(document).ready(function() {
		$("#alterar").click(function() {
			$.ajax({
				url : "http://localhost:8080/snapcity/rest/usuarios",
				contentType : "application/json; charset=utf-8",
				type : "put",
				dataType : "json",
				data : JSON.stringify({
					id : $('#id1').val(),
					nome : $('#nome1').val(),
					senha : $('#senha1').val(),
					email : $('#email1').val()
				}),
				success : function(data) {
					console.log(data);
				}

			});
		});

	});

	
	//Metodo de chamada Ajax para buscar um Usuario pelo ID
	$(document).ready(function() {
		$("#buscar").click(function() {
			var mostra = new Object();
			mostra.id = $('#id').val();
				$.ajax({
					url : "http://localhost:8080/snapcity/rest/usuarios/"+ mostra.id,
					type : 'GET',
					dataType : 'json',
					data : mostra,
					error: function (data, textStatus, xhr) {
                   	 $("#resBusca1").html('Não foi encontrado nada');
                    },
                    success: function (data, textStatus, xhr) {
                   	 
                   	 	$('#carregando').hide();
						 	$("#resBusca1").html('<b>Resultado da busca</b><br /><br/><table> <tr> <th></th> </tr><tr><td>Id='+data.id+'</td> </tr> <td>Nome: '+ data.nome +'</td> </tr><tr> <td>Senha: '+ data.senha +'</td> </tr><tr> <td>Email: '+ data.email+'</td> </tr><tr>  <td>Data de criação: '+ data.datacriacao+'</td> </tr></table>');
                    }

				});
			});
	});

	$(document).ready(function() {
		$("#buscarEvento").click(function() {
			var mostra = new Object();
			mostra.id = $('#id5').val();
				$.ajax({
					url : "http://localhost:8080/snapcity/rest/usuarios/"+ mostra.id +"/evento",
					type : 'GET',
					dataType : 'json',
					data : mostra,
					error: function (data, textStatus, xhr) {
		                   	 $("#resBusca").html('Não foi encontrado nada');
		                    },
		            success: function (data, textStatus, xhr) {
		            	 for(var i = 0; i<data.length; i++){
		                   	 	$('#carregando').hide();
		                   	 $("#resBusca2").html('<br /><br/><table> <tr> <th></th> </tr><tr> <td><h3>Nome: '+ data[i].nome +'</h3></td> </tr></table>');
		            	 }
		                    }

				});
			});
	});
	

	//Metodo de chamada Ajax para excluir usuario pelo seu ID
	$(document).ready(function() {
		$("#excluir").click(function() {

			var del = new Object();
			del.id = $('#id2').val();

			$.ajax({
				url : 'http://localhost:8080/snapcity/rest/usuarios/' + del.id,
				type : 'DELETE',
				dataType : 'json',
				//data:del,
				success : function(data, textStatus, xhr) {
					console.log(data);

				},
				error : function(xhr, textStatus, errorThrown) {
					console.log('Error in Operation');
				}
			});
		});
	});

</script>
</head>
<body>
			
<title>Cadastra Usuario</title>
	<div class="container">
	<ul class="nav nav-pills">
  		<li role="presentation" class="active"><a href="index.jsp">Home</a></li>
  		<li role="presentation"><a href="CadastraEvento.jsp">Cadastra Eventos</a></li>
	</ul>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Usuário</h3>
			</div>

	<div id="tabs">
		<ul>
			<li><a href="#tabs-1">Cadastro</a></li>
			<li><a href="#tabs-2">Alterar Cadastro</a></li>
			<li><a href="#tabs-3">Buscar Cadastro</a></li>
			<li><a href="#tabs-5">Mostra Usuarios</a></li>
			<li><a href="#tabs-4">Excluir Cadastro</a></li>
			<li><a href="#tabs-6">Mostra Eventos </a></li>
		</ul>

		<div id="tabs-1">
			<p>
			<div class="panel-body">
				<form action="" method="POST">
					<div class="form-group">
						<label for="inputlg">Nome Completo</label> <input
							class="form-control" id="nome" name="nome" type="text">
					</div>
					<div class="form-group">
						<label for="inputlg">Senha</label> <input class="form-control"
							id="senha" name="senha" type="text">
					</div>
					<div class="form-group">
						<label for="inputsm">Email</label> <input class="form-control"
							id="email" name="email" type="text">
					</div>
					<input type="submit" id="cadastrar" class="btn btn-default"
						value="Enviar" />

				</form>
			</div>
			</p>
		</div>

		<div id="tabs-2">
			<p>
			<div class="panel-body">
				<form action="" method="POST">
					<div class="form-group">
						<label for="inputlg">Id</label> <input class="form-control"
							id="id1" name="id1" type="text">
					</div>

					<div class="form-group">
						<label for="inputlg">Nome Completo</label> <input
							class="form-control" id="nome1" name="nome1" type="text">
					</div>
					<div class="form-group">
						<label for="inputlg">Senha</label> <input class="form-control"
							id="senha1" name="senha1" type="text">
					</div>
					<div class="form-group">
						<label for="inputsm">Email</label> <input class="form-control"
							id="email1" name="email1" type="text">
					</div>
					<input type="submit" id="alterar" class="btn btn-default"
						value="Alterar Cadastro" />
				</form>
			</div>

		</div>

		<div id="tabs-3">
			<p>
			<div class="panel-body">
				<form>
					<div class="form-group">
						<label for="inputlg">ID</label> <input class="form-control"
							id="id" name="id" type="number" min="0">
					</div>
					<input type="button" id="buscar" value="Buscar" />
				</form>
			</div>
			<!--Aqui é onde vai aparecer o resultado da busca-->
			<div id="resBusca1"></div>
		</div>
		<div id="tabs-4">
			<p>
			<div class="panel-body">
				<div class="form-group">
					<label for="inputlg">ID</label> <input class="form-control"
						id="id2" name="id" type="text">
				</div>
				<input type="submit" id="excluir" class="btn btn-default"
					value="Excluir" />
			</div>
			</p>
		</div>
		<div id="tabs-5">
			<p>
			<div class="panel-body">
				<title>Mostra Usuarios</title>
				<body onload="carregarItens()">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Mostra Todos os Usuario</h3>
					</div>


					<section>
						<h1>Usuarios</h1>
						<!--Área que mostrará carregando-->
						<h2></h2>
						<!--Tabela-->
						<table id="minhaTabela" class="table table-striped">
							<caption>Retorno de dados</caption>
							<thead>
								<th>id</th>
								<th>Nome</th>
								<th>Senha</th>
								<th>Email</th>
								<th>Data de Criação</th>
								<th>Ações</th>

							</thead>
							<tbody>
							</tbody>
						</table>
					</section>
			</div>
		</div>
		</div>
		<div id="tabs-6">
			<p>
			<div class="panel-body">
				<form >
					<div class="form-group">
						<label for="inputlg">ID Usuario</label> <input class="form-control"
							id="id5" name="id" type="number" min="0">
					</div>
					<input type="button" id="buscarEvento" value="Buscar" onclick="carregarItensBusca()" />
				</form>
				<section>
			<h1>Usuario</h1> <div id="resBusca2"></div>
			<!--Área que mostrará carregando-->
			<h2></h2>
			<!--Tabela-->
			<table id="minhaTabelaBusca" class="table table-striped">
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
		</div>
		</p>
</div>
</body>
</html>