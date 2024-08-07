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
        <a href="${pageContext.request.contextPath}/admin?action=purchaseReset" class="write-btn">결제목록 초기화</a>
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
    <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="${pageContext.request.contextPath}/admin?action=purchaseList&pageNum=${startPage - 1}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i eq currentPage}">
                    <a style="font-size: 25px">[${i}]</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin?action=purchaseList&pageNum=${i}">[${i}]</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < pageCount}">
            <a href="${pageContext.request.contextPath}/admin?action=purchaseList&pageNum=${endPage + 1}">[다음]</a>
        </c:if>
    </div>
</div>

<jsp:include page="/views/footer.jsp"/>