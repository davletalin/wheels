<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post" action="${pageContext.request.contextPath}/login">
    <p><label><input type="text" name="login" >Логин</label></p>
    <p><label><input type="text" name="password" >Пароль</label></p>
    <input type="submit" value="Войти"/>
</form>
${user}
</body>
</html>