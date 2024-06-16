<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <c:if test="${result}">
        <script>
            alert("게시글 삭제 성공");
            window.location.href = '/homepage/common?action=boardList';
        </script>
    </c:if>
<c:if test="${!result}">
    <script>
        alert("게시글 삭제 실패");
        history.go(-1);
    </script>
</c:if>