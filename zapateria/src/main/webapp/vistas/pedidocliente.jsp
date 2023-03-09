<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle pedido</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body class="bg-light">
	<jsp:include page="menu.jsp"/>
					<div class="page-header m-4">
				    	<h1>Detalle del pedido</h1>
				<table class="table table-striped table-sm" >					
					<tr>
						<th>ID</th>
						<th>Fecha</th>
						<th>Categoria</th>
						<th>Producto</th>
						<th>Cantidad</th>
						<th>Precio</th>
					</tr>
				<c:set var="Total" value="0.0" />	
				<c:forEach var="ele" items="${pedido}"   varStatus="contador">
				<c:choose>
			       <c:when test="${contador.count == 1}">
			       		<ul class="list-group m-4">
				     	  	<li class="list-group-item"><b>Cliente:</b> ${ele.pedido.usuario.nombre} ${ele.pedido.usuario.apellido}</li>
						    <li class="list-group-item"><b>Dirección de entrega:</b> ${ele.pedido.direccion.calle} ${ele.pedido.direccion.numero}</li>
						    <li class="list-group-item"><b>Localidad:</b> ${ele.pedido.direccion.localidad} <b> Código postal:</b> ${ele.pedido.direccion.codigoPostal}</li>
						    <li class="list-group-item"><b>Método de pago tarjeta Nº:</b> ${ele.pedido.tarjeta.numero}</li>	
				 		</ul> 
			       </c:when>
			  	</c:choose>
				<c:set var="Total" value="${Total + (ele.producto.precio * ele.cantidad)}"/>
					<tr>	
						<td>${ele.idDetalle }</td>
						<td>${ele.pedido.fecha}</td>
						<td>${ele.producto.categoria }</td>
						<td>${ele.producto.nombre }</td>
						<td>${ele.cantidad }</td>
						<td>${ele.producto.precio }</td>
					</tr>
				</c:forEach>
						<ul class="list-group m-4">
				     	  	<li class="list-group-item"><b>Precio total:</b> <fmt:formatNumber value="${Total}" pattern="#,##0.00" /></li>
				 		</ul> 
				</table>
			</div>
</body>
</html>
