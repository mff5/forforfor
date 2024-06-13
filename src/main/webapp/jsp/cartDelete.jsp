<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CartDAO" %><%--
  Created by IntelliJ IDEA.
  User: road5
  Date: 24. 6. 7.
  Time: 오후 3:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int cartNo = Integer.parseInt(request.getParameter("cartNo"));
    CartDAO dao = CartDAO.getInstance();
    boolean result = dao.deleteCart(cartNo);

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert("삭제완료");
        window.location.href="cartList.jsp";
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("삭제실패");
        window.location.href="cartList.jsp";
    </script>
</c:if>