<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${result}">
        <script>
            alert("${productName} 이/가 카트에 추가되었습니다.");
            window.location.href = '${pageContext.request.contextPath}/homepage/views/all.jsp';
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("카트 추가 실패");
            window.location.href = '${pageContext.request.contextPath}/homepage/views/all.jsp';
        </script>
    </c:otherwise>
</c:choose>