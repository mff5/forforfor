<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerDeleteForm.css">
    <script src="${pageContext.request.contextPath}/js/customerDeleteForm.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body onload="begin()">
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="delete-container">
    <form name="delete" method="post" action="${pageContext.request.contextPath}/customer?action=deleteCustomer" class="delete-form" onsubmit="return checkIt()">
        <h2>회원 탈퇴</h2>
        <div>
            <label for="userPw"><b>비밀번호 입력</b></label>
            <input type="password" name="userPw" id="userPw" size="15">
        </div>
        <div>
            <button type="submit">회원탈퇴</button>
            <button type="button" onclick="window.location='/homepage/views/main.jsp'">취소</button>
        </div>
    </form>
</div>
</body>
</html>