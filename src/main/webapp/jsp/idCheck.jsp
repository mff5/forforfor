<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userId = request.getParameter("userId");

    CustomerDAO dao = CustomerDAO.getInstance();
    boolean result = dao.idCheck(userId);

    request.setAttribute("result", result);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ID 중복 확인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/idCheck.css">
    <script>
        function returnResult() {
            const isAvailable = ${!result};
            window.opener.setIdAvailability(isAvailable);
        }
    </script>
</head>
<body onload="returnResult()">
<div class="container">
    <div class="message <c:if test="${result}">error</c:if><c:if test="${!result}">success</c:if>">
        <c:choose>
            <c:when test="${result}">
                <c:out value="이미 존재하는 아이디입니다."/>
            </c:when>
            <c:otherwise>
                <c:out value="사용 가능한 아이디입니다."/>
            </c:otherwise>
        </c:choose>
    </div>
    <a href="#" class="close-btn" onclick="self.close()">닫기</a>
</div>
</body>
</html>
