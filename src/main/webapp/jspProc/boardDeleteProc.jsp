<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 24. 6. 3.
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");

    int postNo = Integer.parseInt(request.getParameter("postNo"));
    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    String password = request.getParameter("password");

    BoardDAO dao = BoardDAO.getInstance();

    boolean result = dao.deleteBoard(postNo, password);

    request.setAttribute("result", result);
    request.setAttribute("pageNum", pageNum);
%>
<c:choose>
    <c:when test="${result}">
        <script>
            alert("게시글 삭제 성공");
            window.location.href = '../jsp/boardList.jsp?pageNum='+encodeURIComponent(${pageNum});
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("게시글 삭제 실패");
            window.location.href = '../jsp/boardList.jsp?pageNum='+encodeURIComponent(${pageNum});
        </script>
    </c:otherwise>
</c:choose>