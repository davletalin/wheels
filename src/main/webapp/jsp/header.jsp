<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
</head>
<body>
<div class="header">
    <div class="jaguar">
        <%--    <img src="<c:url value="/img/jaguar.jpg"/>"/>--%>
    </div>

    <div class="user-menu">
        <c:if test="${user==null}">
            <p><a href="${pageContext.request.contextPath}/login">Войти</a></p>
            <%--            <p><a href="${pageContext.request.contextPath}/registration">Регистрация</a></p>--%>
            <button onclick="show('block')" class="regbutton">Регистрация</button>
            <%--Задний прозрачный фон--%>
            <div onclick="show('none')" id="gray"></div>
            <div id="window">
                <img class="close" onclick="show('none')" src="${pageContext.request.contextPath}/img/close.png" alt="">
                <div class="form">
                    <h2>Регистрация</h2>
                    <form method="post" action="${pageContext.request.contextPath}/registration" name="f1">
                        <input type="text" placeholder="login" name="login" class="input">
                        <input type="text" placeholder="First name" name="first_name" class="input">
                        <input type="text" placeholder="Last name" name="last_name" class="input">
                        <input type="email" placeholder="email" name="email" class="input">
                        <input type="password" placeholder="password" name="password" class="input">
                        <input type="password" placeholder="repeat password" name="password2" class="input">
                        <input type='tel' placeholder="phone" name="phone" class="input">
                        <input type="submit" value="Registration" class="input">
                    </form>
                </div>
            </div>
            <script>
                function show(state) {
                    document.getElementById('window').style.display = state;
                    document.getElementById('gray').style.display = state;
                }
            </script>

        </c:if>
        <c:if test="${user!=null}">
            <a href="${pageContext.request.contextPath}/profile">${user.login}</a>
            <a href="${pageContext.request.contextPath}/logout">Выйти</a>
        </c:if>
    </div>
</div>
</body>
</html>
