<%@ page contentType="text/html;charset=euc-kr" %>
<%
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
    <title>게시판</title>
    <link href="${pageContext.request.contextPath}/css/boardDelete.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/board.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/jsp/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="container">
    <h1>글삭제</h1>
    <form method="POST" name="delForm" action="../jspProc/boardDeleteProc.jsp?postNo=<%=postNo%>&pageNum=<%=pageNum%>" onsubmit="return deleteSave()">
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" name="password" id="password" maxlength="12">
            <input type="hidden" name="postNo" value="1">
        </div>
        <div class="form-actions">
            <input type="submit" value="글삭제">
            <input type="button" value="글목록" onclick="document.location.href='boardList.jsp'">
        </div>
    </form>
</div>
</body>
</html>
