<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 24. 6. 5.
  Time: 오후 12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int productNo = Integer.parseInt(request.getParameter("productNo"));
    ProductDAO dao = ProductDAO.getInstance();

    boolean result = dao.deleteProduct(productNo);

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert("삭제성공");
        window.location.href = "productList.jsp";
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("삭제실패");
        window.location.href = "productList.jsp";
    </script>
</c:if>