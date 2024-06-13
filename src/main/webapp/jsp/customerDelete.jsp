<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원탈퇴</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerDelete.css">
    <script src="${pageContext.request.contextPath}/js/delete.js"></script>
</head>
<body onload="begin()">
<div class="delete-container">
    <form name="delete" method="post" action="../jspProc/customerDeleteProc.jsp" class="delete-form" onsubmit="return checkIt()">
        <h2>회원 탈퇴</h2>
        <div>
            <label for="userPw"><b>비밀번호 입력</b></label>
            <input type="password" name="userPw" id="userPw" size="15">
        </div>
        <div>
            <button type="submit">회원탈퇴</button>
            <button type="button" onclick="window.location='main.jsp'">취소</button>
        </div>
    </form>
</div>
</body>
</html>
