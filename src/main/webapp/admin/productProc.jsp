<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.ProductDAO" %>
<jsp:useBean id="vo" class="homepage.vo.ProductVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ProductDAO dao = ProductDAO.getInstance();

    boolean result = dao.insertProduct(vo);

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert("상품등록 성공");
        window.location.href = '../jsp/productList.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("상품등록 실패");
        window.location.href = '../jsp/productList.jsp';
    </script>
</c:if>