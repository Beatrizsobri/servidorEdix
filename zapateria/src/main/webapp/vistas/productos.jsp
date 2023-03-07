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
		<th>nombre</th><th>categoria</th><th colspan=3>Acciones</th>
	</tr>
		<c:forEach var="producto" items="${listaProductos}">
		<tr>
			<td>${producto.nombre}</td>
			<td>${producto.categoria}</td>
			<td><a href="/productos/detalle/${producto.idProducto}">Detalle</a></td>
			<td><a href="/productos/eliminar/${producto.idProducto}">Eliminar</a></td>
			<td><a href="/productos/modificar/${producto.idProducto}">Modificar</a></td>
		</tr>
		</c:forEach>
	</table>
	<h3><a href="/productos/alta">Alta Producto</a></h3>
	<h2><a href="/menu">Volver</a></h2>
		<h2>${info}</h2>
</body>
</html>