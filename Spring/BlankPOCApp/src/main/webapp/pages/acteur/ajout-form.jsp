<%@page import="net.mickanel.business.ActeurImpl"%>
<%@page import="net.mickanel.business.Film"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form avec Spring MVC</title>
</head>
<body>
	Rappel: l'attribut commandName du formulaire corresspond au backing bean.(bean Formulaire ds Struts)</br>
	l'attribut action est l'url qui sera appel� a la validation de celui ci.</br>
	Si l'attribut action n'est pas sp�cifi� c'est la m�me url d'appel qui sera utilis�</br></br>
	<form:form commandName="ajoutcmd" action="ajoute.do">
		nom : <form:input path="nom" /><form:errors path="nom"/></br>
		prenom : <form:input path="prenom" /><form:errors path="prenom"/></br>
		<input type="submit" value="valider"/>
	</form:form>
</body>
</html>