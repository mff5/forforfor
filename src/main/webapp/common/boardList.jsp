<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.vo.BoardVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 24. 6. 3.
  Time: 오전 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loginId = (String) session.getAttribute("loginId");
    int pageSize = 10;

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int start = (currentPage - 1) * pageSize + 1;
    int end = currentPage * pageSize;

    int count;
    int number;
    ArrayList<BoardVO> boardList = new ArrayList<>();
    BoardDAO dao = BoardDAO.getInstance();
    count = dao.getBoardCount();
    if (count > 0) {
        boardList = dao.getBoardList(start,end);
    }
    number=count-(currentPage-1)*pageSize;

    request.setAttribute("loginId",loginId);
%>
<html>
<head>
    <title>게시판</title>
    <link href="${pageContext.request.contextPath}/css/boardList.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/boardList.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/jsp/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
        </div>
        <c:choose>
            <c:when test="${loginId == null}">
                <ul class="auth-menu">
                    <li><a href="#" onclick="login()">Login</a></li>
                    <li><a href="#" onclick="customer()">Signup</a></li>
                </ul>
            </c:when>
            <c:when test="${loginId.equals('admin')}">
                <ul class="auth-menu">
                    <li><a href="#" onclick="qna()">고객센터</a></li>
                    <li><a href="#" onclick="products()">상품관리</a></li>
                    <li><a href="#" onclick="customerList()">회원정보관리</a></li>
                    <li><a href="#" onclick="modify()">관리자정보변경</a></li>
                    <li><a href="#" onclick="logout()">로그아웃</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="auth-menu">
                    <li><a href="#" onclick="qna()">고객센터</a></li>
                    <li><a href="#" onclick="goCart()">Cart</a></li>
                    <li><a href="#" onclick="modify()">회원정보변경</a></li>
                    <li><a href="#" onclick="logout()">로그아웃</a></li>
                    <li><a href="#" onclick="del()">회원탈퇴</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
    <nav>
        <ul class="main-menu">
            <li><a href="${pageContext.request.contextPath}/jsp/main.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/all.jsp">전체</a></li>
            <li>
                <a href="#">Eyelash</a>
                <div class="dropdown-content">
                    <a href="#">No Glue</a>
                    <a href="#">Tidy</a>
                    <a href="#">B Line</a>
                    <a href="#">A Line</a>
                    <a href="#">X Line</a>
                </div>
            </li>
            <li>
                <a href="#">Brush</a>
                <div class="dropdown-content">
                    <a href="#">Rich Gold</a>
                    <a href="#">Pearl Vanilla</a>
                    <a href="#">Black Label</a>
                </div>
            </li>
            <li>
                <a href="#">Etc</a>
                <div class="dropdown-content">
                    <a href="#">Pencil</a>
                    <a href="#">Spatula</a>
                    <a href="#">Tweezer</a>
                    <a href="#">Case</a>
                </div>
            </li>
            <li><a href="#">Search</a></li>
        </ul>
    </nav>
</header>
<div class="container">
    <div class="header">
        <b>글목록(전체 글:<%=count%>)</b>
        <a href="board.jsp" class="write-btn">글쓰기</a>
    </div>
    <table>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자ID</th>
            <th>작성일</th>
            <th>수정일</th>
            <th>조회수</th>
        </tr>
        <%
            if (count == 0) {
        %>
        <table>
            <tr>
                <td align="center">
                    게시판에 저장된 글이 없습니다.
                </td>
        </table>
        <% } else { %>
        <%
            for (BoardVO b : boardList) {
        %>
        <tr>
            <td> <%=number--%></td>

            <td>
                <%
                    int wid=0;
                    if(b.getDepthLevel()>0){
                        wid=5*(b.getDepthLevel());
                %>
                <img src="../images/level.gif" width="<%=wid%>" height="16">
                <img src="../images/re.gif">
                <%}else{%>
                <img src="../images/level.gif" width="<%=wid%>" height="16">
                <%}%>
                <a href="boardContent.jsp?postNo=<%=b.getPostNo()%>&pageNum=<%=currentPage%>">
                    <%=b.getTitle()%></a>
                <% if(b.getViews()>=20){%>
                <img src="../images/hot.gif" border="0" height="16"><%}%>
            </td>
            <td>
                <%=b.getUserId()%>
            </td>
            <td>
                <%=b.getCreatedDate()%>
            </td>
            <td>
                <%=b.getUpdatedDate()%>
            </td>
            <td align="center" width="50"><%=b.getViews()%>
            </td>
        </tr>
        <%}%>
    </table>
    <%}%>
<%
        if (count > 0) {
            //[1][2][3][4][5]
            int pageBlock = 5;
            //전체페이지수 구하기 75개면 7+1페이지 = 8페이지
            int temp = count % pageSize == 0 ? 0 : 1;
            int pageCount = count / pageSize + temp;

            int startPage = ((currentPage-1)/pageBlock)*pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            //10(endPage) > 8(pageCount)
            if (endPage > pageCount) endPage = pageCount;
            // [이전] [1][2][3][4][5] [다음]
            if (startPage > pageBlock) { %>
    <a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
    <%
        }
        for (int i = startPage ; i <= endPage ; i++) { %>
    <a href="boardList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
    <%
        }
        if (endPage < pageCount) { %>
    <a href="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
    <%
            }
        }
    %>
</div>
<footer>
    <div class="footer-main">
        <div class="footer-links">
            <a href="#">회사소개</a>
            <a href="#">이용약관</a>
            <a href="#">개인정보처리방침</a>
            <a href="#">고객센터</a>
        </div>
        <div class="footer-info">
            <p>주소: </p>
            <p>대표전화번호: </p>
            <p>사업자등록번호: </p>
            <p>&copy; 2024 SPIEL. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>
