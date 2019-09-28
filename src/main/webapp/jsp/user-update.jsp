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
        <p><label><input type="password" value="password" />Password</label></p>
        <p> <input type="password" value="password-repeat" /></p>
        <p> <input type="text" value="firstname" placeholder="${user.firstName}"/></p>
        <p><input type="text" value="lastname" placeholder="${user.firstName}"/></p>
        <input type="submit" value="Save" placeholder="${user.firstName}"/>
        <input type="submit" value="Cancel" formaction="${pageContext.request.contextPath}/jsp/main.jsp"/>

    </form>
</c:if>

</body>
</html>
