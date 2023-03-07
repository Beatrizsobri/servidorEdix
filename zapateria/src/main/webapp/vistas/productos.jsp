<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado productos</title>
</head>
<body>
	<h1>Listado de productos</h1>
	<table border="2">
	<tr>
		<th>Id</th><th>nombre</th><th>descripción</th><th>precio</th><th>categoria</th><th>stock</th>
	</tr>
		<c:forEach var="producto" items="${listaProductos}">
		<tr>
			<td>${producto.idProducto}</td>
			<td>${producto.nombre}</td>
			<td>${producto.descripcion}</td>
			<td>${producto.precio}</td>
			<td>${producto.categoria}</td>
			<td>${producto.stock}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>