<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestión producto</title>
</head>
<body class="bg-light">
	<div class="container border bg-light rounded">
		<h2 class="mt-3">${mensaje}</h2>
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
		<h2 class="mt-5">${info}</h2>
		<h2 class="mt-3"><a href="/productos/todos" class="btn btn-link">Volver</a></h2>
	</div>
</body>
</html>
