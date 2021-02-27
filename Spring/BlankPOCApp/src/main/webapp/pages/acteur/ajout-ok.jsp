<%@page import="net.mickanel.business.ActeurImpl"%>
<%@page import="net.mickanel.business.Film"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form avec Spring MVC</title>
</head>
<body>
		l'acteur ${ajoutcmd.nom} ${ajoutcmd.prenom} a été créé.
</body>
</html>