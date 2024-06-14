<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    CartDAO dao = CartDAO.getInstance();
    boolean result = dao.resetCart();
    request.setAttribute("result", result);
%>

<c:choose>
    <c:when test="${result}">
        <script>
            alert("로그아웃 성공");
            <%
            session.invalidate();
            %>
            window.location.href='main.jsp';
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("로그아웃 실패");
            window.location.href='main.jsp';
        </script>
    </c:otherwise>
</c:choose>