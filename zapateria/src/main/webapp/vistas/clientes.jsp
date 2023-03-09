<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Listado de clientes</title>

</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="container">	
	<div class="row">	
		<div class="col-10">
			<div class="page-header m-4">
		    	<h1>Listado de clientes</h1>
		  	</div>
		  	<div class="row">
		  		<table class="table table-striped table-sm" >
	  				<tr>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Email</th>
						<th>Teléfono</th>
						<th>Ver ficha</th>
					</tr>
					<c:forEach var="cliente" items="${listaUsuarios}" >
						<tr>
							<td>${cliente.nombre }</td>
							<td>${cliente.apellido}</td>
							<td>${cliente.email}</td>
							<td>${cliente.telefono}</td>
							<td>
							<a href="/usuarios/verficha/${cliente.idUsuario}" class="btn btn-primary">Ficha</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>	
		</div>	
		<div class="col-2">
			<jsp:include page="carrito.jsp"/>
		</div>
	</div>
</div>

			
</body>
</html>
