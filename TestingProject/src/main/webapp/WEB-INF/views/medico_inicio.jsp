<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Médico</title>
</head>
<body>
	<h1>MÉDICO CONTROLLER</h1>
	
	<form action="/medico/main" method="post" id="login">
		<input id="username" type="text" name="username" placeholder="ID Medico" required>
		<input type="submit" value="Entrar">
	</form>
</body>
</html>