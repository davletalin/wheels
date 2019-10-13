<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty sessionLocale ? sessionLocale: initParam['sessionLocale']}" scope="session"/>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="locale" var="lang"/>
<html>
<head>
    <style>
        .koleso{
            height: 100px;
            width: 100px;
            text-align: left;
           opacity: 50%;
        }
        .ad-post-button{

        }
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css"/>
</head>
<body>
<div class="header">

    <div class="user-menu">
<%--        <img class="koleso" src="${pageContext.request.contextPath}/img/wheel.png" >--%>
    <a href="${pageContext.request.contextPath}/switch?language=ru" class="language-cont">ru</a>
    <a href="${pageContext.request.contextPath}/switch?language=en" class="language-cont">en</a>
        <c:if test="${user==null}">
            <%--            <p><a href="${pageContext.request.contextPath}/login">Войти</a></p>--%>
            <%--            <p><a href="${pageContext.request.contextPath}/registration">Регистрация</a></p>--%>

            <button onclick="showlogin('block')" class="logbutton"><fmt:message bundle="${lang}"
                                                                                key="locale.signin"/></button>
            <div onclick="showlogin('none')" id="gray1"></div>
            <div id="window-login">
                <img class="close" onclick="showlogin('none')" src="${pageContext.request.contextPath}/img/close.png"
                     alt="">
                <div class="form">
                    <h2><fmt:message bundle="${lang}" key="locale.authorization"/></h2>
                    <form method="post" action="${pageContext.request.contextPath}/login" name="f1">
                        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.login"/></div>
                        <input type="text" name="login" class="input" required autofocus>
                        <div class="auth-form-label">
                            <fmt:message bundle="${lang}" key="locale.password"/>
                        </div>
                        <input type="password" name="password" minlength="5" maxlength="45" class="input" required
                               autofocus>
                        <input type="submit" value="<fmt:message bundle="${lang}" key="locale.signin"/>"
                               class="input-login" autofocus>
                        <input type="submit"
                               onclick="showlogin('none')" value="<fmt:message bundle="${lang}" key="locale.cancel"/>"
                               class="input-login" autofocus>
                    </form>
                </div>
            </div>
            <button onclick="show('block')" class="regbutton"><fmt:message bundle="${lang}"
                                                                           key="locale.registration"/></button>
            <div onclick="show('none')" id="gray"></div>
            <div id="window">
                <img class="close" onclick="show('none')" src="${pageContext.request.contextPath}/img/close.png" alt="">
                <div class="form">
                    <h2><fmt:message bundle="${lang}" key="locale.registration"/></h2>
                    <form method="post" action="${pageContext.request.contextPath}/registration" name="f1">
                        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.login"/></div>
                        <input type="text" name="login" class="input" required autofocus>
                        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.name"/></div>
                        <input type="text" name="first_name" class="input" autofocus>
                        <div class="auth-form-label"><fmt:message bundle="${lang}" key="locale.surname"/></div>
                        <input type="text" name="last_name" class="input" autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            E-mail
                        </div>
                        <input type="email" name="email" minlength="4" maxlength="45" class="input" required autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            <fmt:message bundle="${lang}" key="locale.password"/>
                        </div>
                        <input type="password" name="password" minlength="6" maxlength="45" class="input"
                               required
                               autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            <fmt:message bundle="${lang}" key="locale.passwordrepeat"/></div>
                        <input type="password" name="password2" minlength="6" maxlength="45" class="input"
                               required
                               autofocus>
                        <div class="auth-form-label">
                            <span class="asterisk">*</span>
                            <fmt:message bundle="${lang}" key="locale.phone"/>
                        </div>
                        <input type='tel' name="phone" class="input" required autofocus>

                        <input type="submit" value="<fmt:message bundle="${lang}" key="locale.registration"/>"
                               class="input" autofocus>
                    </form>
                </div>
            </div>
            <br>

            <script>
                function show(state) {
                    document.getElementById('window').style.display = state;
                    document.getElementById('gray').style.display = state;
                }

                function showlogin(state) {
                    document.getElementById('window-login').style.display = state;
                    document.getElementById('gray1').style.display = state;
                }
            </script>

        </c:if>
        <c:if test="${user!=null}">
            <a href="${pageContext.request.contextPath}/profile">${user.login}</a>
            <a href="${pageContext.request.contextPath}/logout"><fmt:message bundle="${lang}" key="locale.logout"/></a><br>
            <a class="ad-post-button" href="${pageContext.request.contextPath}/post" class="regbutton"><fmt:message bundle="${lang}"
                                                                                             key="locale.adpost"/></a>
        </c:if>
    </div>
</div>
</body>
</html>