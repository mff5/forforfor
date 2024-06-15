<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 24. 6. 3.
  Time: 오후 3:07
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="vo" class="homepage.vo.BoardVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pageNum = request.getParameter("pageNum");
    BoardDAO dao = BoardDAO.getInstance();
    boolean result = dao.updateBoard(vo);

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
    alert("비밀번호가 맞지 않습니다");
    history.go(-1);
    </script>
</c:if>