<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
</head>
<body>
<div class="header">
    <div class="jaguar">
<%--    <img src="<c:url value="/img/jaguar.jpg"/>"/>--%>
    </div>
    <div class="user-menu">
        <c:if test="${user==null}">
            <p><a href="${pageContext.request.contextPath}/login">Войти</a></p>
            <p><a href="${pageContext.request.contextPath}/registration">Регистрация</a></p>
        </c:if>
        <c:if test="${user!=null}">
            <a href="${pageContext.request.contextPath}/profile">${user.login}</a>
            <a href="${pageContext.request.contextPath}/logout">Выйти</a>
        </c:if>
    </div>
</div>
</body>
</html>
