<%@page import="net.mickanel.business.ActeurImpl"%>
<%@page import="net.mickanel.business.Film"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
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
	Liste les noms des acteurs avec Hibernate</br>
	Uniquement les noms et pas les prénoms</br>
	<%	
		Collection<ActeurImpl> _col=(Collection<ActeurImpl>) request.getAttribute("acteursList");
		Iterator<ActeurImpl> it = _col.iterator();
		ActeurImpl _act;
		while(it. hasNext()){
				out.println("<li>"+it.next()+"</li>");
				//out.println("<li>"+_act.getNom()+"</li>");
		}
	%>
	<hr>
	Méme chose mais avec les JSTL/EL</br>
	<c:forEach var="act" items="${acteursList}">
		<li>${act}</li>
	</c:forEach>
	<hr>
</body>
</html>