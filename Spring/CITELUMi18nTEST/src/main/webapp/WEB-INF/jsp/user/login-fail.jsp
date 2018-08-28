<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Citelum Project - Login Unauthorized</title>


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
		width: 100px;
		height: 30px;
	}

	.authenticationInput {
		height: 20px;
	}

</style>


</head>
<body>
<br>
<br>
	
	<div class="heading">
		<img class="logo" src="${pageContext.request.contextPath}/pictures/logo.png">

		<br><br><br>
		<h1 class="h1Title">Citelum Proposals</h1>
		<br><br><br>
	</div>

	<br><br><br>

	<div class="wrapper">
	<div class="authentication">

	<br><br>
		
	<div class = "alert alert-danger" >
	Vous n'avez pas la permission d'accéder à cette application. Veuillez contacter l'administrateur système.
	</div>
	<br><br>
	<a href="/CitelumApp/"><button class="loginButton">
Réessayer</button></a>
	
	</div>


	</div>












</body>
</html>