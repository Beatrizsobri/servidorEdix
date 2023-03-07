<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>${mensaje}</h2>
 	<form action="/usuarios/alta/${action}" method="post">
		<input type="text" placeholder="Nombre" name="nombre">
		<input type="text" placeholder="Apellido" name="apellido">
		<input type="password" placeholder="Contraseña" name="password">
		<input type="email" placeholder="email" name="email">
		<input type="tel" placeholder="teléfono" name="telefono">
		<input type="submit" value="Enviar"/>
	</form>
	<h2>${info}</h2>
	<h2><a href="/menu">Volver</a></h2>
</body>
</html>