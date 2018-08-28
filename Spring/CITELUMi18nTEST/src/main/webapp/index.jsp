<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>Citelum Project</title>

<!--     Load CSS and scripts common to all pages -->
<%-- <%@ include file="WEB-INF/jsp/shared/imports_head.jspf"%> --%>
<!--     /Load CSS and scripts common to all pages -->

<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.css" rel="stylesheet">

<style>

	body {
		font-family: verdana;
		}

	* {
		margin: 0;
		padding: 0;
	}

	.logo {
		width: 200px;
	}

	.h1Title {
		color: orange;
	}

	.heading {
		background: white;
		width: 500px;
		margin: 0 auto;
		text-align: center;
	}

	.wrapper {
		background: #f6f6f6;
		width: 100%;
		height: 500px;
	}

	.authentication {
		width: 300px;
		height: 100%;
		margin: 0 auto;
	}

	.left {
		float: left;
		width: 100px;
	}

	.right {
		float: right;
		margin-left: 20%;
	}

	.loginButton {
		width: 50px;
		height: 30px;
	}

	.authenticationInput {
		height: 20px;
	}

	.coolBtn {
		width: 100px;
		height: 30px;
		margin-left: 45%;
	}

</style>


</head>
<body>
	Language : <a href="?lang=en">English</a>|<a href="?lang=fr">Français</a>

	<h3>
		<%-- people say : <spring:message code="citelum.welcome" text="default text" /> --%>
		people say : <spring:message code="citelum.welcome" />
	</h3>

	here we speak: <spring:message code="citelum.language" /></br>
	Current Locale : ${pageContext.response.locale}

	<div class="heading">
		<img class="logo" src="pictures/logo.png">

		<br><br><br>
		<h1 class="h1Title">Citelum Proposals</h1>
		<br><br><br>
	</div>


	<!--  =========================== JUMP LOGIN  BUTTONS  ===========================  -->
	<!--
	<br><br><br>
	<a href="/CitelumApp/web/profile"><button class="coolBtn">go to main</button></a>
	<a href="/CitelumApp/views/login-fail.jsp"><button class="coolBtn">go to login-fail</button></a>
	<br> <br>
	-->



	<div class="wrapper">
	<div class="authentication">

	<br><br>
		<form action="LdapAuthorization" method="post">
		<div class="left">
			Login:
			<br><br>
			Password:
		</div>

		<div class="right">

		</div>
			 <input class="authenticationInput" type="text" name="yourName" size="20">
			<br><br>
			 <input class="authenticationInput" type="password" name="yourPassword" size="20">
			<br><br>
			<input class="loginButton" type="submit" value="Login" />
		</form>

	<c:if test="${loginFailed}">
	<br>
	<div class = "alert alert-danger" >
	 Identifiant erroné
	</div>
	</c:if>

	</div>
	<br>

		<!--
		user: uid=admin,ou=system
		-->

		<div style="color: white;">
			Login: admin
			<br><br>
			Password: secret
		</div>


	<br><br><br><br>
	</div>





</body>
</html>