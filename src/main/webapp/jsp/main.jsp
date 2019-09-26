<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale : initParam['sessionLocale']}" scope="session" />
<fmt:setLocale value="${language}"/>
<html>
<br>
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Wheels</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="main-cont">
    <h1>Main jsp</h1>
    <p><a href="${pageContext.request.contextPath}/vechicle">List of vechicles</a></p>
    <form method="get" action="${pageContext.request.contextPath}/vechicle">
        <p><label><input type="text" name="id">Vechicle Id</label></p>
        <input type="submit" value="Показать"/>
    </form>
    <form method="get" action="${pageContext.request.contextPath}/vechicle">
        <select name="make" ONKEYUP="function getMakeList(){
                var make=${'make'}.
                }">
        </select>
    </form>
    <p><a href="${pageContext.request.contextPath}/delete">Удалить пользователя</a></p>
</div>
</body>
</html>
