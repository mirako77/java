<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="fr">
<head>
	<spring:url value="/app/static/css/main.css" var="mainCss" />
	<spring:url value="/app/static/js/jquery.1.10.2.min.js" var="jqueryJs" />
	<spring:url value="/app/static/js/main.js" var="mainJs" />
	
	<link href="${mainCss}" rel="stylesheet" />
    <script src="${jqueryJs}"></script>
    <script src="${mainJs}"></script>
    
</head>
<body>
hello, &lt; spring:url &gt; is used here !
<h1>1. Test CSS</h1>

<h2>2. Test JS</h2>
<div id="msg"></div>

</body>
</html>