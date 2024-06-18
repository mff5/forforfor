<%@ page contentType="text/html;charset=euc-kr" %>
<html>
<head>
    <title>�Խ���</title>
    <link href="${pageContext.request.contextPath}/css/boardDeleteForm.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/board.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="container">
    <h1>�ۻ���</h1>
    <form method="POST" name="delForm" action="${pageContext.request.contextPath}/common?action=deleteBoard">
        <div class="form-group">
            <label for="password">��й�ȣ</label>
            <input type="password" name="password" id="password" maxlength="12" required>
            <input type="hidden" name="postNo" value="${postNo}">
        </div>
        <div class="form-actions">
            <input type="submit" value="�ۻ���">
            <input type="button" value="�۸��" onclick="document.location.href='/homepage/common?action=boardList&pageNum=${pageNum}'">
        </div>
    </form>
</div>
</body>
</html>
