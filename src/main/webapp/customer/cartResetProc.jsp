<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${result}">
    <script>
        alert("카트 비우기 성공");
        window.location.href = '${pageContext.request.contextPath}/customer?action=cartList';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("카트 비우기 실패");
        window.location.href = '${pageContext.request.contextPath}/customer?action=cartList';
    </script>
</c:if>