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
	<spring:url value="/static/cust/main.css" var="mainCss" />
	<spring:url value="/app/static/css/bootstrap.min.css" var="bootstrapcss" />
	<spring:url value="/app/static/css/font-awesome.min.css" var="fontawesomecss" />
	<link href="${mainCss}" rel="stylesheet" />
	<link href="${bootstrapcss}" rel="stylesheet" />
	<link href="${fontawesomecss}" rel="stylesheet" /> 
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	  <a class="navbar-brand" href="http://mickanel.net">mickanel.net</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" 
	  		data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarColor01">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="<%=contextPath%>/app/info/home">Home
	          <span class="sr-only">(current)</span>
	        </a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%=contextPath%>/app/market/customers">Customers</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Sign up</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Sign in</a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" 
	        		role="button" aria-haspopup="true" aria-expanded="false">Dropdown info</a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="<%=contextPath%>/app/info/">info</a>
	          <a class="dropdown-item" href="<%=contextPath%>/app/info/hello/Bandy">Welcome action</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">About Separated link</a>
	        </div>
	      </li>
	      <li class="nav-item">
	      	<a class="nav-link" href="<%=contextPath%>/app/info/locale?locale=en">FR | EN </a>
	      </li>
	    </ul>
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="text" placeholder="Search">
	      <button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
	    </form>
	  </div>
	</nav>

  <c:if test="${saveSuccess !=null}">
    <div class="alert alert-success alert-dismissible">
	  <button type="button" class="close" data-dismiss="alert">&times;</button>
	  <strong> ${saveSuccess}</strong>
	</div>
  </c:if>

	<c:if test="${saveError !=null}">
		<div class="alert alert-danger alert-dismissible">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>${saveError}</strong> 
		</div>
	</c:if>