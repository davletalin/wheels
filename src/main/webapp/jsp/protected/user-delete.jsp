<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Delete user</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/delete">
    <input type="text" name="login" placeholder="username" >
    <input type="submit" value="Delete">
</form>

</body>
</html>
