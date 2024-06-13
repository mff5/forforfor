<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:choose>
    <c:when test="${type==0}">
        <jsp:include page="admin/logon/adminLoginForm.jsp"/>
    </c:when>
    <c:when test="${type==1}">
        <jsp:include page="member/LoginForm.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="jsp/main.jsp"/>
    </c:otherwise>
</c:choose>