<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page import="homepage.dao.CartDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerDAO dao = CustomerDAO.getInstance();

    String loginId = (String) session.getAttribute("loginId");
    String userPw = request.getParameter("userPw");
    boolean result = dao.deleteCustomer(loginId, userPw);

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert("회원탈퇴 성공");
        <%
        CartDAO dao2 = CartDAO.getInstance();
        dao2.resetCart();
        session.invalidate();
        %>
        window.location.href = '../jsp/main.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("회원탈퇴 실패");
        window.location.href = '../jsp/main.jsp';
    </script>
</c:if>
