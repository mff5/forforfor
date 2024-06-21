<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/views/header.jsp"/>

<style>
    body {
        background-color: #f0f0f0;
    }
</style>

<div class="container">
    <div class="header">
        <b>결제목록</b>
        <a href="#" class="write-btn" onclick="window.location.href='/homepage/admin?action=purchaseReset'">결제목록 초기화</a>
    </div>
    <table>
        <tr>
            <th>결제번호</th>
            <th>결제일</th>
            <th>결제수단</th>
            <th>사용자ID</th>
            <th>가격</th>
        </tr>
        <c:forEach var="p" items="${purchaseList}">
            <tr>
                <td>${p.purchaseNo}</td>
                <td>${p.purchaseDate}</td>
                <td>${p.purchaseMeth}</td>
                <td>${p.userId}</td>
                <td>${p.totalPrice}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<jsp:include page="/views/footer.jsp"/>