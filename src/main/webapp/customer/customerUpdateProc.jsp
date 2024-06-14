<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:if test="${result}">
    <script>
        alert("회원정보 변경 완료");
        window.location.href = '${pageContext.request.contextPath}/views/main.jsp';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("회원정보 변경 실패");
        window.location.href = '${pageContext.request.contextPath}/views/main.jsp';
    </script>
</c:if>