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
        .ad-form {
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
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.make"/></div>
        <select type="text" name="make" value=""></select><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.model"/></div>
        <input type="text" name="model" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.country"/></div>
        <input type="text" name="country" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.body"/></div>
        <input type="text" name="body" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.color"/></div>
        <input type="text" name="color" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.engine"/></div>
        <input type="text" name="engine" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.tranmission"/></div>
        <input type="text" name="transmission" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.country"/></div>
        <input type="text" name="mileage" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.wheel"/></div>
        <input type="text" name="wheel_drive" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.price"/></div>
        <input type="text" name="price" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.city"/></div>
        <input type="text" name="city" value=""><br>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.description"/></div>
        <input type="text" name="description" value=""><br>
        <input type="file" name="images" multiple accept="image/*, image/jpeg, image/png" value="<fmt:message bundle="${lang}" key="locale.wheel"/>"><br>
        <input type="submit" name="Post"><br>
    </form>
</main>
</body>
</html>
