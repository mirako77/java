<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="appPath" value="${pageContext.request.contextPath}"/>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="fr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- CSS Ressources -->
	<spring:url value="resource/css/mickanel.css" var="coreCss" />
	<spring:url value="resource/css/bootstrap.min.css" var="bootstrapCss" />
	<spring:url value="resource/css/font-awesome.min.css" var="fontawesomeCss" />
	<link href="${coreCss}" rel="stylesheet" />
	<link href="${bootstrapCss}" rel="stylesheet" />
	<link href="${fontawesomeCss}" rel="stylesheet" />
</head>
<body>
 <div class="navbar navbar-inverse navbar-fixed-left">
     <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a class="navbar-brand" href="http://mickanel.net">http://mickanel.net</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
    
        <li ><a href="<%=contextPath%>/app/info/">info</a></li>
        <li><a  href="<%=contextPath%>/app/info/hello/Bandy">Welcome</a></li>
        <li><a href="#">Page 2</a></li> 
        <li><a href="#">Page 3</a></li> 
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="<%=contextPath%>/app/info/locale?locale=en"><span class="glyphicon glyphicon-user"></span> FR | EN </a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
  </div>