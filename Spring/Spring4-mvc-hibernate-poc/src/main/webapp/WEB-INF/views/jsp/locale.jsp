<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%@ page session="false"%>
<html lang="fr">

<head>
    <title>
        <spring:message code="label.title" />
    </title>
</head>

<body>
    <form method="post" action="login">
        <table>
            <tr>
                <td><label><strong><spring:message code="label.firstName" /></strong></label></td>
                <td><input name="firstName" /></td>
            </tr>
            <tr>
                <td><label> <strong><spring:message code="label.lastName" /></strong></label></td>
                <td><input name="lastName" /></td>
            </tr>
            <tr>
                <spring:message code="label.submit" var="labelSubmit"/>
                <td colspan="2"><spring:message code="label.submit" /><input type="submit" value="${labelSubmit}" /></td>
            </tr>
        </table>
    </form>
</body>

</html>