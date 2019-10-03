<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Update user</title>
</head>
<body>
<c:if test="${user!=null}">
    <form method="post" class="profile">
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.password"/></div>
        <p><input type="password" value="password" /></p>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.passwordrepeat"/></div>
        <p> <input type="password" value="password-repeat" /></p>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.name"/></div>
        <p> <input type="text" value="firstname" /></p>
        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.surname"/></div>
        <p><input type="text" value="email" /></p>
        <p><input type="text" value="lastname" /></p>
        <input type="submit" value="Save" placeholder="${user.firstName}"/>
        <input type="submit" value="Cancel" formaction="${pageContext.request.contextPath}/jsp/main.jsp"/>

    </form>
</c:if>

</body>
</html>
