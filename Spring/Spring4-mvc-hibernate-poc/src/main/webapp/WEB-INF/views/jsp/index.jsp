<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<title>Spring4 POC</title>
	<!-- CSS Ressources -->
	<spring:url value="/static/cust/main.css" var="mainCss" />
	<spring:url value="/app/static/css/bootstrap.min.css" var="bootstrapCss" />
	<link href="${bootstrapCss}" rel="stylesheet" />
	<link href="${mainCss}" rel="stylesheet" />
	
	<!-- JS Ressources -->
	<spring:url value="/app/static/js/jquery.min.js" var="jquerymin" />
	<spring:url value="/app/static/js/bootstrap.min.js" var="bootstrapJs" />
	<spring:url value="/static/cust/main.js" var="myJs" />
	<script src="${jquerymin}"></script>
	<script src="${bootstrapJs}"></script>
	<script src="${myJs}"></script>
</head>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Project Name</a>
		</div>
	</div>
</nav>

<div class="jumbotron">
	<div class="container">
		<h1>${title}</h1>
		<p>
			<c:if test="${not empty msg}">
				Hello ${msg}
			</c:if>

			<c:if test="${empty msg}">
				Tonga Soa nareo !
			</c:if>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
		</p>
	</div>
</div>

	<hr>
	<footer>
		<p>&copy; http://mickanel.net 2021</p>
	</footer>
<!-- </div> -->

</body>
</html>