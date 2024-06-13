<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CartDAO" %>
<%@ page import="homepage.dao.ProductDAO" %>
<%@ page import="homepage.vo.ProductVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int productNo = Integer.parseInt(request.getParameter("productNo"));

    CartDAO dao = CartDAO.getInstance();
    ProductDAO dao2 = ProductDAO.getInstance();

    ProductVO product = dao2.getProduct(productNo);

    String productName = product.getProductName();

    boolean result  = dao.insertCart(product);

    request.setAttribute("result", result);
%>
<c:choose>
    <c:when test="${result}">
        <script>
            alert("<%=productName%>이 카트에 추가되었습니다.");
            window.location.href = 'all.jsp'
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("카트 추가 실패");
            window.location.href = 'all.jsp'
        </script>
    </c:otherwise>
</c:choose>