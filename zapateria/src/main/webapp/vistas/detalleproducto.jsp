<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="alert alert-info">
					${mensaje}
				</div>
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



