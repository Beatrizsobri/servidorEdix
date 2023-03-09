<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ficha cliente</title>
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
		    	<h1>Ficha cliente</h1>
				<c:choose>
			       <c:when test="${info == null}">
			       </c:when>
			       <c:otherwise>
		             	<div class="alert alert-success">
							${info}
						</div>
			       </c:otherwise>
			  	</c:choose>
		    	<h2 class="mt-2"></h2>
		  	</div>
		  	<div>
				<form>				
					<label for="Nombre">Nombre: ${cliente.nombre}</label><br>
					<label for="Apellido">Apellido: ${cliente.apellido}</label><br>
					<label for="Email">Email: ${cliente.email}</label><br>
					<label for="Teléfono">Teléfono: ${cliente.telefono}</label>
				</form>

				<c:choose>
			       <c:when test="${fn:length(requestScope.listapedidos) > 0}">
					<table class="table table-striped table-sm" >
	  				<tr>			
						<th>Pedido</th>
						<th>Fecha</th>
						<th>Ver Pedido</th>	
					</tr>
					<c:forEach var="pedido" items="${listapedidos}" >
						<tr>
							<td>${pedido.idPedido}</td>
							<td>${pedido.fecha}</td>
							<td>ver</td>
						</tr>
					</c:forEach>
				</table>

			       </c:when>
			       <c:otherwise>
			             	<div class="alert alert-warning">
								Este cliente no ha realizado pedidos
							</div>
			       </c:otherwise>
			  	</c:choose>
				

			</div>	
		</div>	
	</div>
</div>
</body>
</html>
