<%@page import="net.mickanel.business.ActeurImpl"%>
<%@page import="net.mickanel.business.Film"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring MVC - Hibernate</title>
</head>
<body>
	<%
	/*String f=(String)request.getAttribute("message");
	out.println(f+"</br>");
	
	ActeurImpl Rn=(ActeurImpl)request.getAttribute("acteur");
	out.println(Rn.getNom()+"</br>");
	
	Film film=(Film)request.getAttribute("film");
	out.println(film.getTitre()+"</br>");*/
	%>
	
<ul>
	Liste des acteurs avec Hibernate</br>
	<c:forEach var="act" items="${acteurs}">
		<li>${act.identifiant} ${act.nom} ${act.prenom}</li>
	</c:forEach>
</ul>
</body>
</html>