<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale: initParam['sessionLocale']}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="locale" var="lang"/>
<html>
<head>
    <title>Test</title>

</head>
<body>
<p>For test</p>
<form action="{pageContext.request.contextPath}/test" method="post">
    <select name="selctedOne">
        <option> --<fmt:message bundle="${lang}" key="locale.make"/>--</option>
        <c:out value="${makes}"/>
        <c:forEach items="${makes}" var="make">
            <option value="${make.id}">${make.name} </option>
        </c:forEach>
    </select>
</form>
<c:forEach items="${users}" var="user">
    <c:out value="${user}"/>
</c:forEach>
</body>
</html>
