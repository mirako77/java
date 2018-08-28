<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--Jquery-->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!--Jquery ends here-->

	<!--Bootstrap-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--Bootstrap ends here-->

	<!--Fonts Family starts here-->
	<link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
	<!--Fonts Family ends here-->

	<!--Style-->
	<link rel="stylesheet" type="text/css" href="styles/styleFrancisco.css">
	<!--Style ends here-->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>





<style>
	
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
	
		.coolBtn {
		width: 100px;
		height: 30px;
		margin-left: 45%;
	}

</style>


<body>

<br><br>


<div class="container-fluid col-sm-12">
	<div class="col-sm-3" hidden="true">
		<br><br><br><br><br><br><br><br><br>
		<img src="./pictures/pic.png">
	</div>

	<div class="col-sm-3">
		<br><br><br><br><br><br><br><br><br>
		<ul>
			<li><a href="#">one</a></li>
			<li><a href="#">two</a></li>
			<li><a href="#">three</a></li>
			<li><a href="#">four</a></li>
			<li><a href="#">five</a></li>
			<li><a href="#">six</a></li>
			<li><a href="#">seven</a></li>
			<li><a href="#">eight</a></li>
			<li><a href="#">nine</a></li>
			<li><a href="#">ten</a></li>
			
		</ul>
		<a href="/CitelumApp/views/list.jsp"><button class="coolBtn">go to list</button></a>
		<a href="/CitelumApp/index.jsp"><button class="coolBtn">go to index</button></a>
	</div>
	<br> <br>
	

<div class="col-sm-6">
	<div class="heading">
		<img class="logo" src="../pictures/logo.png">

		<br><br><br>
		<h1 class="h1Title">Citelum Proposals</h1>
		<br><br><br>
	</div>


	<iframe class="frame" src="ckeditor.jsp" width="100%" height="1000px" frameborder="0"></iframe>

</div>





</div>

</body>
</html>