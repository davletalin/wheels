<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale: initParam['sessionLocale']}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="locale" var="lang"/>
<html>
<head>
    <style>
        .profile {
            text-align: ;
        }
    </style>
    <title>Update user</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<c:if test="${user!=null}">
    <div class="profile-cont">
        <form method="post" class="profile" action="${pageContext.request.contextPath}/profile">
            <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.password"/></div>
            <input type="password" name="password" value="${user.password}"/>
            <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.passwordrepeat"/></div>
            <input type="password" name="password-repeat" value="${user.password}"/>
            <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.name"/></div>
            <input type="text" name="firstname" value="${user.firstName}"/>
            <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.surname"/></div>
            <input type="text" name="lastname" value="${user.lastName}"/>
            <div class="auth-form-label">Email</div>
            <input type="email" name="email" value="${user.email}"/>
            <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.phone"/></div>
            <input type="tel" name="phone"value="${user.phone}"/>
            <p><input type="submit" value="<fmt:message bundle="${lang}" key="locale.save"/>"/>
            <input type="submit" value="<fmt:message bundle="${lang}" key="locale.cancel"/>"
                   formaction="${pageContext.request.contextPath}/jsp/main.jsp"/></p>
        </form>
    </div>
</c:if>
</body>
</html>
