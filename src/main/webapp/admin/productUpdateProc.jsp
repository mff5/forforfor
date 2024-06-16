<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result}">
    <script>
        alert("상품수정 완료");
        window.location.href = "/homepage/admin?action=productList";
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("상품수정 실패");
        history.go(-1);
    </script>
</c:if>