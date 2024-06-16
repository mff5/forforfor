<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="login-container">
    <form class="login-form" action="${pageContext.request.contextPath}/common?action=loginCheck" method="post" onsubmit="return checkIdPw(event)">
        <h2>로그인</h2>
        <input type="text" id="userId" name="userId" placeholder="아이디" required>
        <input type="password" id="userPw" name="userPw" placeholder="비밀번호" required>
        <button type="submit"><b>로그인</b></button>
    </form>
    <div class="extra-links">
        <button onclick="findId()">아이디 찾기</button>
        <button onclick="findPw()">비밀번호 찾기</button>
        <button onclick="customer()">회원가입</button>
    </div>
</div>
</body>
</html>