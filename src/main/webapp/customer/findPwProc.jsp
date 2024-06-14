<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/findPwProc.css">
    <script src="${pageContext.request.contextPath}/js/findPwProc.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="container">
    <h2>비밀번호 찾기 결과</h2>
    <c:if test="${userPw == null}">
        <h2>검색된 비밀번호가 없습니다.</h2>
        <button class="back-button" onclick="goFindPw()">돌아가기</button>
    </c:if>
    <c:if test="${userPw != null}">
        <ul class="id-list">
            <li>${userPw}</li>
        </ul>
        <button class="back-button" onclick="goLogin()">로그인 화면으로</button>
    </c:if>
</div>
</body>
</html>
