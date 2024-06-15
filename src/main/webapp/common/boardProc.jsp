<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:choose>
    <c:when test="${result}">
        <script>
            alert("문의글 등록 성공");
            window.location.href = '/homepage/common?action=boardList';
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("문의글 등록 실패");
            window.location.href = '/homepage/common?action=boardList';
        </script>
    </c:otherwise>
</c:choose>