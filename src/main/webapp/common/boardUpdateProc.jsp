<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result}">
    <script>
    alert("수정완료");
    window.location.href='/homepage/common?action=boardList';
    </script>
</c:if>
<c:if test="${!result}">
    <script>
        alert("비밀번호가 맞지 않습니다.");
        history.go(-1);
    </script>
</c:if>