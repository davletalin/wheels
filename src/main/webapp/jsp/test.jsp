<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<br>
<head>
    <title>Test</title>
    <style>
        .regbutton {
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 3px;
            padding: 6px 24px;
            cursor: pointer;

        }

        .regbutton:hover {
            background: #ccc;
        }

        #window {
            width: 350px;
            height: 530px;
            margin: 40px auto;
            background: #fff;
            border: 1px solid #fff;
            border-radius: 15px;
            z-index: 150;
            display: none;
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }

        .form {
            width: 275px;
            margin: -15px auto 20px auto;
            text-align: center;
        }

        .input {
            width: 260px;
            padding: 5px;
            margin-bottom: 10px;
        }

        .radio {
            margin-bottom: 10px;
        }

        .close {
            margin: 10px 0 0 320px;
            cursor: pointer;
            border: 1px solid #ccc;
            padding: 2px;
            background: #fff;
        }

        .close:hover {
            background: #ccc;
        }

        #gray {
            background-color: #d3d3d3;
            opacity: 0.8;
            position: fixed;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            display: none;
            z-index: 100;
            overflow: auto;
            padding: 15px;
        }

    </style>
</head>
<body>
<center>
    <button onclick="show('block')" class="regbutton">Регистрация</button>
<%--    <img src="${pageContext.request.contextPath}/img/jaguar.jpg">--%>
</center>
<%--Задний прозрачный фон--%>
<div onclick="show('none')" id="gray"></div>
<div id="window">
    <img class="close" onclick="show('none')" src="${pageContext.request.contextPath}/img/close.png" alt="">
    <div class="form">
        <h2>Регистрация</h2>
        <form action="index.html" name="f1">
            <input type="text" placeholder="Имя" name="name1" class="input">
            <input type="text" placeholder="Фамилия" name="name2" class="input">
            <input type="email" placeholder="Емеил" name="email1" class="input">
            <input type="email" placeholder="Подтвердите адрес Электронной Почты" name="email2" class="input">
            <input type="password" placeholder="Пароль" name="pass1" class="input">
            <input type="password" placeholder="Подтвердите пароль" name="pass2" class="input">
            <input type='tel' placeholder="Мобильный телефон" name="tel" class="input">
            <input type="radio" name="radio1"> Мужчина <input type="radio" name="radio1" class="radio"> Женщина
            <input type="submit" value="Регистрация" name="sab" class="input"> 
        </form>
    </div>
</div>
<script>
    //Функция показа
    function show(state)
    {
        document.getElementById('window').style.display = state;
        document.getElementById('gray').style.display = state;
    }
</script>
</body>
</html>
