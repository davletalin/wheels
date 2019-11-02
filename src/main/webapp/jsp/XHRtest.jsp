<%--
  Created by IntelliJ IDEA.
  User: Armat
  Date: 21.10.2019
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale: initParam['sessionLocale']}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="locale" var="lang"/>
<html>
<head>
    <title>XHR test</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xhr.js"></script>
</head>
<body>
<script type="text/javascript">
    f();
</script>
<button onclick="f()">F</button>

</body>
</html>
