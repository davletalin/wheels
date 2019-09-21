<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<br>
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">--%>
    <title>Title</title>
</head>
<body>
<div class="main-container">

Main jsp

<p><a href="${pageContext.request.contextPath}/login">Войти</a></p>
<p><a href="${pageContext.request.contextPath}/registration">Регистрация</a></p>
<p><a href="${pageContext.request.contextPath}/vechicle">List of vechicles</a></p>
<form method="get" action="${pageContext.request.contextPath}/vechicle">
    <p><label><input type="text" name="id">Vechicle Id</label></p>
    <input type="submit" value="Показать"/>
</form>
</div>
</body>
</html>
