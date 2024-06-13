<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String userId = request.getParameter("userId");

    CustomerDAO dao = CustomerDAO.getInstance();

    boolean result =dao.deleteCustomer(userId);

    request.setAttribute("userId", userId);
    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert(${userId}+" 삭제 완료");
        window.location.href = '../jsp/customerList.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("삭제 실패");
        window.location.href = '../jsp/customerList.jsp';
    </script>
</c:if>