<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale : initParam['sessionLocale']}" scope="session"/>
<fmt:setLocale value="${language}"/>
<html>
<br>
<head>
    <%--    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <title>Main jsp</title>
    <style>
        .adforms {
            background: white;
            height: 600px;
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }

        .adform1 {
            height: 200px;
            width: 200px;
            background: bisque;
            border: 1px black;
        }

        .adform2 {
            height: 200px;
            width: 200px;
            background: bisque;
        }

        .adform3 {
            height: 200px;
            width: 200px;
            background: bisque;
        }

    </style>
</head>
<body>
<jsp:include page="header.jsp"/>


<div class="main-cont">
    <h1></h1>
    <div class="adforms">
        <div class="adform1">

        </div>
        <div class="adform2">

        </div>
        <div class="adform3">

        </div>


    </div>


    <%--    <p><a href="${pageContext.request.contextPath}/vechicle">List of vechicles</a></p>--%>
    <%--    <form method="get" action="${pageContext.request.contextPath}/vechicle">--%>
    <%--        <p><label><input type="text" name="id">Vechicle Id</label></p>--%>
    <%--        <input type="submit" value="Показать"/>--%>
    <%--    </form>--%>
    <%--    <form method="get" action="${pageContext.request.contextPath}/vechicle">--%>
    <%--        <select name="make" ONKEYUP="function getMakeList(){--%>
    <%--                var make=${'make'}.--%>
    <%--                }">--%>
    <%--        </select>--%>
    <%--    </form>--%>
    <%--    <p><a href="${pageContext.request.contextPath}/delete">Удалить пользователя</a></p>--%>
</div>
</body>
</html>
