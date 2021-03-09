<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<c:set var="appPath" value="${pageContext.request.contextPath}"/>
 --%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="fr">
<head>
	<title>Spring4 POC</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- CSS Ressources -->
	<spring:url value="/app/static/css/main.css" var="mainCss" />
	<spring:url value="/app/static/css/bootstrap.min.css" var="bootstrapcss" />
	<spring:url value="/app/static/css/font-awesome.min.css" var="fontawesomecss" />
	<link href="${mainCss}" rel="stylesheet" />
	<link href="${bootstrapcss}" rel="stylesheet" />
	<link href="${fontawesomecss}" rel="stylesheet" />  
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
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="<%=contextPath%>/app/info/locale?locale=en"><span class="glyphicon glyphicon-user"></span> FR | EN </a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
  </div>