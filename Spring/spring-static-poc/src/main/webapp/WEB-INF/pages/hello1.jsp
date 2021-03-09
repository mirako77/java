<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <link href="<c:url value="/app/static/css/main.css" />" rel="stylesheet">
    <script src="<c:url value="/app/static/js/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/app/static/js/main.js" />"></script>
</head>
<body>
hello, <b>&lt; c:url &gt; </b> is used here !

<h1>1. Test CSS</h1>

<h2>2. Test JS</h2>
<div id="msg"></div>

</body>
</html>