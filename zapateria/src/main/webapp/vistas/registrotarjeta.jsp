<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body class="bg-light">
<jsp:include page="menu.jsp"/>
	<div class="container border rounded bg-white">
		<h1 class="mt-3">Registre nueva tarjeta</h1>
		<div class="alert alert-success">
		  	${mensaje}
		</div>
		<form action="" method="post">
			<div class="form-group">
				<label for="titular">Titular</label>
				<input type="text" class="form-control" id="titular" placeholder="Ingrese el titular de la tarjeta" name="titular">
			</div>
			<div class="form-group">
				<label for="numero">Número tarjeta</label>
				<input type="number" class="form-control" id="numero" placeholder="Ingrese el número de la tarjeta" name="numero" min="1" max="99999999">
			</div>
			<button type="submit" class="btn btn-primary">Enviar</button>
		</form>
	</div>
</body>
</html>
