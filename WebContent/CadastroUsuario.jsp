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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script>

<!-- ..//JQuery Source\\.. -->
<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
<!-- ..//JavaScript Code for this page\\.. -->
<script type="text/javascript">
			$(document).ready(function(){
				$("#login_frm").submit(function(){
 
					//remove previous class and add new "myinfo" class
					$("#msgbox").removeClass().addClass('myinfo').text('Validating Your Login ').fadeIn(1000);
 
						this.timer = setTimeout(function () {
							$.ajax({
								url: 'check.jsp',
								data: 'un='+ $('#login_id').val() +'&pw=' + $('#password').val(),
								type: 'post',
							success: function(msg){
								if(msg != 'ERROR') // Message Sent, check and redirect
								{                // and direct to the success page
 
								$("#msgbox").html('Login Verified, Logging in.....').addClass('myinfo').fadeTo(900,1,
								function()
								{
									//redirect to secure page
									document.location='login.jsp?user='+msg;
								});
 
								}
								else
								{
									$("#msgbox").fadeTo(200,0.1,function() //start fading the messagebox
								{
								//add message and change the class of the box and start fading
									$(this).html('Sorry, Wrong Combination Of Username And Password.').removeClass().addClass('myerror').fadeTo(900,1);
								});
 
							}
						}
 
					});
				}, 200);
		return false;
	});
 
});
 

</script>	
<body>

<title>Cadastra Usuario</title>
	<div class="container">
	<ul class="nav nav-pills">
	</ul>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Usuário</h3>
			</div>
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
</body>
</html>