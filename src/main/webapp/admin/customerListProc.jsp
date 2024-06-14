<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${result}">
    <script>
        alert(${userId}+" 삭제 완료");
        window.location.href = '/homepage/admin?action=customerList';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("삭제 실패");
        window.location.href = '/homepage/admin?action=customerList';
    </script>
</c:if>