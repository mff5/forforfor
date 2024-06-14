<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${result}">
    <script>
        alert("회원탈퇴 성공");
        <%
        CartDAO dao = CartDAO.getInstance();
        dao.resetCart();
        session.invalidate();
        %>
        window.location.href = '${pageContext.request.contextPath}/views/main.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("회원탈퇴 실패");
        window.location.href = '${pageContext.request.contextPath}/customer/customerDelete.jsp';
    </script>
</c:if>
