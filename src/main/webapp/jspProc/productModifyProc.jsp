<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.ProductDAO" %><%--
  Created by IntelliJ IDEA.
  User: road5
  Date: 24. 6. 6.
  Time: 오전 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="vo" class="homepage.vo.ProductVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
    ProductDAO dao = ProductDAO.getInstance();

    boolean result = dao.updateProduct(vo);

    request.setAttribute("result", result);
%>

<c:if test="${result}">
    <script>
        alert("상품수정 완료");
        window.location.href = "../jsp/productList.jsp";
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("상품수정 실패");
        window.location.href = "../jsp/productList.jsp";
    </script>
</c:if>