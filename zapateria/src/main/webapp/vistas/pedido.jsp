<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Busque los pedidos de los clientes por fecha</h1>
		<form action="" method="post">
			<input type="date" class="form-control" name="fecha">
			<button type="submit" class="btn btn-primary">Enviar</button>
		</form>
		
<h3>${listaPedidosClientes}</h3>
</body>
</html>