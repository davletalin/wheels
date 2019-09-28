<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>

</head>
<body>
<div class="header">
    <div class="user-menu">
        <c:if test="${user==null}">

<%--            <p><a href="${pageContext.request.contextPath}/login">Войти</a></p>--%>
            <%--            <p><a href="${pageContext.request.contextPath}/registration">Регистрация</a></p>--%>
            <button onclick="showlogin('block')" class="logbutton">Войти</button>
            <div onclick="showlogin('none')" id="gray"></div>
            <div id="window-login">
                <img class="close" onclick="showlogin('none')" src="${pageContext.request.contextPath}/img/close.png" alt="">
                <div class="form">
                    <h2>Авторизация</h2>
                    <form method="post" action="${pageContext.request.contextPath}/registration" name="f1">
                        <div class="auth-form-label">Логин</div>
                        <input type="text" name="login" class="input" required autofocus>
                        <div class="auth-form-label">
                            Пароль</div>
                        <input type="password" name="password" minlength="5" maxlength="45" class="input" required autofocus>
                        <input type="submit" value="Войти" class="input-login" autofocus ><input type="submit" onclick="showlogin('none')" value="Отмена" class="input-login" autofocus >

                    </form>
                </div>
            </div>
            <button onclick="show('block')" class="regbutton">Регистрация</button>
            <%--Задний прозрачный фон--%>
            <div onclick="show('none')" id="gray"></div>
            <div id="window">
                <img class="close" onclick="show('none')" src="${pageContext.request.contextPath}/img/close.png" alt="">
                <div class="form">
                    <h2>Регистрация</h2>
                    <form method="post" action="${pageContext.request.contextPath}/registration" name="f1">
                        <div class="auth-form-label">Логин</div>
                        <input type="text" name="login" class="input" required autofocus>
                        <div class="auth-form-label">Имя</div>
                        <input type="text" name="first_name" class="input" autofocus>
                        <div class="auth-form-label">Фамилия</div>
                        <input type="text" name="last_name" class="input" autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            E-mail</div>
                        <input type="email" name="email" minlength="4" maxlength="45" class="input" required autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            Пароль</div>
                        <input type="password" name="password" minlength="6" maxlength="45" class="input" required autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            Подтверждение пароля</div>
                        <input type="password" name="password2" minlength="6" maxlength="45" class="input" required autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            Мобильный телефон</div>
                        <input type='tel' name="phone" class="input" required autofocus>

                        <input type="submit" value="Registration" class="input" autofocus >
                    </form>
                </div>
            </div>
            <script>
                function show(state) {
                    document.getElementById('window').style.display = state;
                    document.getElementById('gray').style.display = state;
                }
                function showlogin(state) {
                    document.getElementById('window-login').style.display = state;
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
