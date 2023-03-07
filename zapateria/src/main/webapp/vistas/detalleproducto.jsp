<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle producto</title>
</head>
<body>
	<h1>Detalle del producto ${producto.nombre} </h1>
	<table border="2">
	<tr>
		<th>idProducto</th><th>nombre</th><th>precio</th><th>descripción</th><th>stock</th>
	</tr>
		<tr>
			<td>${producto.idProducto}</td>
			<td>${producto.nombre}</td>
			<td>${producto.precio}€</td>
			<td>${producto.descripcion}</td>
			<td>${producto.stock}</td>
		</tr>
	</table>
	<h2><a href="/productos/todos">Volver</a></h2>
</body>
</html>