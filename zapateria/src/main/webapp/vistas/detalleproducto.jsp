<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalle producto</title>
</head>
<body>
	<jsp:include page="menu.jsp"/>
<div class="container">	
	<div class="row">	
		<div class="col-10">
			<div class="page-header m-4">
		    	<h1>Detalle producto</h1>
		    	   	
				<c:choose>
			       <c:when test="${mensaje == null}">
			       </c:when>
			       <c:otherwise>
			             	<div class="alert alert-info">
								${mensaje}
							</div>
			       </c:otherwise>
			  	</c:choose>

		  	</div>
		  	<div class="row">
	     	  <ul class="list-group m-4">
	     	  	<li class="list-group-item">
		     	  	<h2>
		      			${producto.nombre}
		      		</h2>
				</li>
			    <li class="list-group-item"><b>Descripción:</b> ${producto.descripcion}</li>
			    <li class="list-group-item"><b>Precio:</b> ${producto.precio}€</li>
			    <li class="list-group-item"><b>Stock:</b> ${producto.stock}</li>
			    <li class="list-group-item"><b>ID:</b> ${producto.idProducto}</li>
			    			    			    			    
				<sec:authorize access="!isAuthenticated()">
					<li class="list-group-item">
						<div class="alert alert-warning">
							Debe iniciar sesión para comprar
						</div>
					</li>
				</sec:authorize>
			    			    
			    <sec:authorize access="isAuthenticated()">
				    <li class="list-group-item">
				    <form action="/pedidos/addCarrito/${producto.getIdProducto()}" method="post">
					    <div class="form-group row">		    
							  <div class="col-xs-3">
									<input type="number" class="form-control" placeholder="Cant." name="cantidad" min="1">
							  </div>
							  <div class="col-xs-3 ml-2">
									<input type="submit" class="btn btn-primary" value="Añadir al carrito"/>
							  </div>					    
						</div>		
					</form>		    
				    </li>
			    </sec:authorize>
			  </ul>
			</div>	
		</div>	
		<div class="col-2">
			<jsp:include page="carrito.jsp"/>
		</div>
	</div>
</div>
</body>
</html>



