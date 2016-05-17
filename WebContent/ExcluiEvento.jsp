<%@page import="snapcity.model.Evento"%>
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
	
	<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script>
	$(document).ready(function() {
		$("#exclui").click(function() {

			var del = new Object();
			del.id = $('#id').val();

			$.ajax({
				url : 'http://localhost:2020/snapcity/rest/evento/' + del.id,
				type : 'DELETE',
				dataType : 'json',
				success : function(data, textStatus, xhr) {
					alert("Evento "+ del.id + "foi excluído com sucesso.");
				},
				error : function(xhr, textStatus, errorThrown) {
					console.log('Error in Operation');
				}
			});
		});
	});
</script>



<title>Exclui Eventos</title>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-md-12">
		<%@ include file="menu.jsp" %>
	
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Exclui Evento</h3>
			</div>
			<div class="panel-body">
				
				<form >	
					<div class="form-group">
						<label for="inputlg">ID</label> 
						<input class="form-control" id="id" name="id" type="text">
					</div>
					

					<input type="button" id="exclui" value="Excluir" />
				</form>
			</div>
		</div>
	
	</div>
</div>
</div>

</body>
</html>