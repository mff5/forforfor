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
        <b>회원목록</b>
        <a href="#" class="write-btn" onclick="resetCustomer()">회원목록 초기화</a>
    </div>
    <table>
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>이메일</th>
            <th>우편번호</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>등록일</th>
            <th>삭제</th>
        </tr>
        <c:forEach var="c" items="${customerList}">
            <tr>
                <td>${c.customerNo}</td>
                <td>${c.userId}</td>
                <td>${c.userPw}</td>
                <td>${c.userName}</td>
                <td>${c.userEmail}</td>
                <td>${c.userPost}</td>
                <td>${c.address1}, ${c.address2}</td>
                <td>${c.phone1}-${c.phone2}-${c.phone3}</td>
                <td>${c.registerDate}</td>
                <td>
                    <button class="delete-button" type="button" onclick="goDelete('${c.userId}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="${pageContext.request.contextPath}/admin?action=customerList&pageNum=${startPage - 1}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i eq currentPage}">
                    <a style="font-size: 25px">[${i}]</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin?action=customerList&pageNum=${i}">[${i}]</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < pageCount}">
            <a href="${pageContext.request.contextPath}/admin?action=customerList&pageNum=${endPage + 1}">[다음]</a>
        </c:if>
    </div>
</div>
<jsp:include page="/views/footer.jsp"/>
