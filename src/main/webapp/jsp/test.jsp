<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<br>
<head>
    <title>Title</title>
</head>
Test jsp</br>
From login form page
<p>${userRequest.login}</p> user.login
<p><c:out value="${userRequest.login}"/></p>user.login by c:out
<p>${userSession.login}</p> user2.login
<p><c:out value="${userSession.login}"/></p>user2.login by c:out
<p>${userContext.login}</p> user3.login
<p><c:out value="${userContext.login}"/></p>user3.login by c:out
<p>${user.login}</p>
<c:out value="${pageScope.p}"/> pageScope.p</br>
<c:out value="${requestScope.r}"/> requestScope.r</br>
<c:out value="${sessionScope.s}"/> sessionScope.s</br>
<c:out value="${applicationScope.a}"/> applicationScope.a</br>
<c:out value="${pageContext.request.contextPath}"/></br>
<c:out value="${user1.login}"/> user1 session </br>
${param.user} tut user</br>
<c:out value="${param.login}" /></br>
<c:out value="${param.password}" /></br>

</body>
</html>
