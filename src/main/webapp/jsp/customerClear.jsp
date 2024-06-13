<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %><%--
  Created by IntelliJ IDEA.
  User: road5
  Date: 24. 6. 11.
  Time: 오후 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerDAO dao = CustomerDAO.getInstance();

    boolean result = dao.resetCustomer();

    request.setAttribute("result", result);
%>
<c:if test="${result}">
    <script>
        alert("회원목록 초기화 성공");
        window.location.href = 'customerList.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("회원목록 초기화 실패");
        window.location.href = 'customerList.jsp';
    </script>
</c:if>