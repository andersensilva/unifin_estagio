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
				<h2>
					Bem vindos!
				</h2>
				<p>
					Est�gio da Faculdade UNIFIN  <br/>
					Objetivo e usar as tecnologias de mercado nesta cadeira de est�gio.<p>E nesta cadeira estamos desenvolvendo um sistema REST. N�s temos o objetivo de desenvolver um aplicativo android e mostrar atrav�s de fotos tiradas do seu celular a situa��o de sua cidade, buracos, encanamentos abertos ou qualquer situa��o que possa alertar as autoridades para tomar uma a��o.<br/>
					<h3>Entre</h3>
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="/snapcity/Cadastro.jsp">Usu�rios</a>
					<a class="btn btn-primary btn-large" href="/snapcity/MostraEvento.jsp">Eventos</a>
				</p>
			</div>
		</div>
		<div class="col-md-3">
		</div>
	</div>
</div>


</body>
</html>