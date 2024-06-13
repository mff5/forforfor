<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CartDAO" %><%--
  Created by IntelliJ IDEA.
  User: road5
  Date: 24. 6. 10.
  Time: 오후 5:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CartDAO dao = CartDAO.getInstance();

    boolean result = dao.resetCart();

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert("카트 비우기 성공");
        window.location.href = 'cartList.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("카트 비우기 실패");
        window.location.href = 'cartList.jsp';
    </script>
</c:if>