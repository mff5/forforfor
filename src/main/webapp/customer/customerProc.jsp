<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${result}">
    <script>
        alert("회원가입 성공");
        window.location.href = '${pageContext.request.contextPath}/views/main.jsp';
    </script>
</c:if>
<c:if test="${result}">
    <script>
        alert("회원가입 실패");
        window.location.href = '${pageContext.request.contextPath}/customer/customerForm.jsp';
    </script>
</c:if>