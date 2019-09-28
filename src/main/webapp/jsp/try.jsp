<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<p><a href="${pageContext.request.contextPath}/logout" >Выйти</a></p>
Successfully logged in
${sessionScope.user}
</br>
<fmt:setBundle basename="locale"  var="lang" />
    <fmt:message key="q" bundle="${lang}" />

</body>
</html>
