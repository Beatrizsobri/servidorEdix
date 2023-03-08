<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Catálogo de productos</title>

</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="container">	
	<div class="row">	
		<div class="col-10">
			<div class="page-header m-4">
		    	<h1>Catálogo de productos</h1>
		  	</div>
		  	<div class="row">
			<c:forEach var="producto" items="${listaProductos}">
			  <div class="col-sm-4 mb-4">
				 <div class="card" >
				  <div class="card-body">
				    <h4 class="card-title">${producto.nombre}</h4>
				    <p class="card-text">${producto.categoria}</p>
				    <a href="/productos/detalle/${producto.idProducto}" class="btn btn-primary">Detalle</a>
				    <sec:authorize access="hasAuthority('Administrador')">				    
					    <div class="btn-group mt-2">
							<a class="btn btn-danger" href="/productos/eliminar/${producto.idProducto}">Eliminar</a>
							<a class="btn btn-info" href="/productos/modificar/${producto.idProducto}">Modificar</a>
						</div>
					</sec:authorize>    
				  </div>
				</div>
			  </div>
			</c:forEach>
			</div>	
		</div>	
		<div class="col-2">
			<jsp:include page="carrito.jsp"/>
		</div>
	</div>
</div>

			
</body>
</html>
