<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result}">
    <script>
        alert("상품등록 성공");
        window.location.href = '/homepage/admin?action=productList';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("상품등록 실패");
        history.go(-1);
    </script>
</c:if>