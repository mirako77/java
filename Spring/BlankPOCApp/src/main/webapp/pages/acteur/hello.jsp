<%@page import="net.mickanel.business.ActeurImpl"%>
<%@page import="net.mickanel.business.Film"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Spring MVC</title>
</head>
<body>
	<%
	String f=(String)request.getAttribute("message");
	out.println(f+"</br>");
	
	ActeurImpl Rn=(ActeurImpl)request.getAttribute("acteur");
	out.println(Rn.getNom()+"</br>");
	
	Film film=(Film)request.getAttribute("film");
	out.println(film.getTitre()+"</br>");
	%>
</body>
</html>