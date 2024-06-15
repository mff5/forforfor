<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
    CustomerDAO dao = CustomerDAO.getInstance();
%>
<jsp:useBean id="vo" class="homepage.vo.CustomerVO">
    <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
    boolean result = dao.insertCustomer(vo);

    request.setAttribute("result", result);
%>

<c:if test="${result}">
    <script>
        alert("회원가입 성공");
        window.location.href = '../customer/loginForm.jsp';
    </script>
</c:if>
<c:if test="${result}">
    <script>
        alert("회원가입 실패");
        window.location.href = '../jsp/customer.jsp';
    </script>
</c:if>