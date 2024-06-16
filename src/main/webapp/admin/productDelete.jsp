<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${result}">
    <script>
        alert("삭제성공");
        window.location.href = "/homepage/admin?action=productList";
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("삭제실패");
        window.location.href = "/homepage/admin?action=productList";
    </script>
</c:if>