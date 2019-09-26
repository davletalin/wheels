<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="locale"  var="lang" />
<html>
<head>
    <title>Registration</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<form method="post" action="${pageContext.request.contextPath}/registration">
    <p><input type="text" name="login" placeholder="login" minlength="4" maxlength="20" required>
        <c:choose>
            <c:when test="${error}==601">
                <fmt:message key="q" bundle="${lang}" />
            </c:when>
        </c:choose></p>
    <p><input type="password" name="password" placeholder="password" minlength="4" maxlength="20" required></p>
    <p><input type="password" name="password2" placeholder="repeat password" minlength="4" maxlength="20" required></p>
    <p><input type="text" name="first_name" placeholder="First name" maxlength="45" required></p>
    <p><input type="text" name="last_name" placeholder="Last name" maxlength="45" required></p>
    <p><input type="text" name="email" placeholder="e-mail" minlength="4" maxlength="45" required></p>
    <p><input type="submit" name="Registration"></p>
</form>
</body>
</html>
