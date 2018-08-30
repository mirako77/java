<%@page import="net.mickanel.business.ActeurImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
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
	Recherche d'un acteur avec Hibernate</br>
	On a recherché ici uniquement UN/UNE acteur/actrice</br>
		
	</br></br>
	Acteur:  ${acteur}
</body>
</html>