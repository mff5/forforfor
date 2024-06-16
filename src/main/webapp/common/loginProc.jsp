<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = (String)request.getAttribute("userId");
%>

<c:choose>
    <c:when test="${result==1}">
        <%
            session.setAttribute("loginId", userId);
        %>
        <script>
            alert("로그인 성공");
            window.location.href = "${pageContext.request.contextPath}/views/main.jsp";
        </script>
    </c:when>
    <c:when test="${result==0}">
        <script>
            alert("비밀번호가 틀렸습니다.");
            window.location.href = "${pageContext.request.contextPath}/common/loginForm.jsp";
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("아이디가 존재하지 않습니다");
            window.location.href = "${pageContext.request.contextPath}/common/loginForm.jsp";
        </script>
    </c:otherwise>
</c:choose>