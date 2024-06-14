<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/findIdProc.css">
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="container">
    <c:if test="${not empty ids}">
        <h2>검색된 아이디 목록</h2>
        <ul class="id-list">
        <c:forEach var="id" items="${ids}">
            <li>${id}</li>
        </c:forEach>
        </ul>
        <button class="back-button" onclick="window.location.href='${pageContext.request.contextPath}/customer/findPw.jsp'">비밀번호 찾기</button>
    </c:if>


    <c:if test="${empty ids}">
        <h2>검색된 아이디가 없습니다.</h2>
    </c:if>
    <button class="back-button" onclick="window.location.href='${pageContext.request.contextPath}/customer/findId.jsp'">돌아가기</button>
</div>
</body>
</html>