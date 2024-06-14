<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${result}">
        <script>
            alert("결제 성공");
            window.location.href = '${pageContext.request.contextPath}/views/main.jsp';
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("결제 실패");
            window.location.href = '${pageContext.request.contextPath}/views/main.jsp';
        </script>
    </c:otherwise>
</c:choose>