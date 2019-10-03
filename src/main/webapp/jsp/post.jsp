<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale : initParam['sessionLocale']}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="locale" var="lang"/>
<html>
<head>
    <title><fmt:message bundle="${lang}" key="locale.adpost"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
    <style>
        .ad-form{
           padding-top: 20px;
        }


    </style>
</head>
<body>
<header class="header">
    <jsp:include page="header.jsp"/>
</header>
<main>
    <form method="post" action="${pageContext.request.contextPath}/post" class="ad-form" enctype="multipart/form-data">
        <input type="text" name="make" placeholder="make" value=""><br>
        <input type="text" name="model" placeholder="model" value=""><br>
        <input type="text" name="country" placeholder="country" value=""><br>
        <input type="text" name="body" placeholder="body" value=""><br>
        <input type="text" name="color" placeholder="color" value=""><br>
        <input type="text" name="engine" placeholder="engine" value=""><br>
        <input type="text" name="transmission" placeholder="transmission" value=""><br>
        <input type="text" name="mileage" placeholder="mileage" value=""><br>
        <input type="text" name="wheel_drive" placeholder="wheel drive" value=""><br>
        <input type="text" name="price" placeholder="price" value=""><br>
        <input type="text" name="city" placeholder="city" value=""><br>
        <input type="text" name="description" placeholder="description" value=""><br>
        <input type="file" name="images" placeholder="image" multiple accept="image/*, image/jpeg, image/png"><br>
        <input type="submit" name="Post"><br>
    </form>
</main>
</body>
</html>
