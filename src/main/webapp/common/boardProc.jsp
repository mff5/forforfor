<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 24. 6. 3.
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="vo" class="homepage.vo.BoardVO" scope="page">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
    vo.setIpAddress(request.getRemoteAddr());
    BoardDAO dao = BoardDAO.getInstance();

    boolean result = dao.insertBoard(vo);

    request.setAttribute("result", result);
%>

<c:choose>
    <c:when test="${result}">
        <script>
            alert("문의글 등록 성공");
            window.location.href = '../jsp/boardList.jsp';
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("문의글 등록 실패");
            window.location.href = '../jsp/boardList.jsp';
        </script>
    </c:otherwise>
</c:choose>