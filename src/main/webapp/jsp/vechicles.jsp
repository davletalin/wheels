<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Vechicles List</title>
</head>
<body>
<c:out value="${param.id}"/>
<c:forEach var="vechicle" items="${vechiclesList}">
    <p>${vechicle.make}</p>
</c:forEach>
<c:forEach var="paramm" items="${paramValues}">
    <p>${paramm}</p>
</c:forEach>

</body>
</html>