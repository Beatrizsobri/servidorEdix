<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestión producto</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body class="bg-light">
	<jsp:include page="menu.jsp"/>
<div class="container">	
	<div class="row m-3">	
		<div class="col-10">
			<div class="page-header m-4">
		    	<h1>${mensaje}</h1>
		    	<div class="alert alert-success">
				  ${info}
				</div>
		    	<h2 class="mt-2"></h2>
		  	</div>
		  	<div>
				<form method="post">
					<div class="form-group">
						<label for="nombre">Nombre</label>
						<input type="text" class="form-control" id="nombre" placeholder="Ingrese el nombre" name="nombre" value="${producto.nombre}">
					</div>
					<div class="form-group">
						<label for="descripcion">Descripción</label>
						<input type="text" class="form-control" id="descripcion" placeholder="Ingrese la descripción" name="descripcion" value="${producto.descripcion}">
					</div>
					<div class="form-group">
						<label for="precio">Precio</label>
						<input type="number" class="form-control" id="precio" placeholder="Ingrese el precio" name="precio" step=".01" value="${producto.precio}">
					</div>
					<div class="form-group">
						<label for="categoria">Categoría</label>
						<input type="text" class="form-control" id="categoria" placeholder="Ingrese la categoría" name="categoria" value="${producto.categoria}">
					</div>
					<div class="form-group">
						<label for="stock">Stock</label>
						<input type="number" class="form-control" id="stock" placeholder="Ingrese el stock" name="stock" value="${producto.stock}">
					</div>
					<button type="submit" class="btn btn-primary">Enviar</button>
				</form>
			</div>	
		</div>	
	</div>
</div>
</body>
</html>
