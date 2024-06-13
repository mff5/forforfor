<%@ page import="homepage.dao.BoardDAO" %>
<%@ page import="homepage.vo.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="euc-kr">
    <title>게시판 글수정</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/boardModify.css">
    <script language="JavaScript" src="${pageContext.request.contextPath}/js/board.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<%
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    String pageNum = request.getParameter("pageNum");
    BoardDAO dao = BoardDAO.getInstance();
    BoardVO vo = dao.getBoard(postNo);
%>
<body>
<div class="logo-container">
    <a href="main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="container">
    <h1>글수정</h1>
    <form method="post" name="writeform" action="../jspProc/boardModifyProc.jsp?pageNum=<%=pageNum%>">
        <div class="form-group">
            <label for="userId">사용자 ID</label>
            <input type="text" name="userId" id="userId" value="<%=vo.getUserId()%>" readonly>
            <input type="hidden" name="postNo" value="<%=vo.getPostNo()%>">
        </div>
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" name="title" id="title" value="<%=vo.getTitle()%>">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="<%=vo.getEmail()%>">
        </div>
        <div class="form-group">
            <label for="postContent">내용</label>
            <textarea name="postContent" id="postContent" rows="13"><%=vo.getPostContent()%></textarea>
        </div>
        <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" name="password" id="password">
        </div>
        <div class="form-actions">
            <input type="submit" value="수정하기">
            <input type="reset" value="초기화">
            <input type="button" value="목록보기" onclick="document.location.href='boardList.jsp?pageNum=<%=pageNum%>'">
        </div>
    </form>
</div>
</body>
</html>
