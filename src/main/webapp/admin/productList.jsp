<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/header.jsp"/>
<link rel="stylesheet" href="<c:url value='/css/productList.css'/>">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/productList.js"></script>

<div class="container">
    <div class="header">
        <b>상품목록(전체 상품: ${count})</b>
        <div class="button-container">
            <a href="#" class="write-btn" onclick="goProductReset()">상품목록 초기화</a>
            <a href="${pageContext.request.contextPath}/admin?action=productForm" class="write-btn">상품등록</a>
        </div>
    </div>
    <table>
        <tr>
            <th>상품번호</th>
            <th>이미지</th>
            <th>카테고리</th>
            <th>상품명</th>
            <th>원가</th>
            <th>할인율</th>
            <th>가격</th>
            <th>등록일</th>
            <th>수정일</th>
            <th>판매량</th>
            <th>재고</th>
            <th>수정</th>
            <th>삭제</th>
        </tr>
        <c:if test="${count == 0}">
            <tr>
                <td colspan="12" align="center">
                    저장된 상품이 없습니다.
                </td>
            </tr>
        </c:if>
        <c:if test="${count > 0}">
            <c:forEach var="p" items="${productList}">
                <tr>
                    <td>${p.productNo}</td>
                    <td><img src="${p.imgURL}" alt="대체문자" class="pImg"></td>
                    <td>${p.category}</td>
                    <td>${p.productName}</td>
                    <td>${p.originalPrice}</td>
                    <td>${p.discount}</td>
                    <td>${p.price}</td>
                    <td>${p.createdDate}</td>
                    <td>${p.updatedDate}</td>
                    <td>${p.sales}</td>
                    <td>${p.stock}</td>
                    <td><input type="button" value="수정" onclick="goProductUpdate(${p.productNo})"></td>
                    <td><input type="button" value="삭제" onclick="goProductDelete(${p.productNo})"></td>
                </tr>
            </c:forEach>
        </c:if>
    </table>
    <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="${pageContext.request.contextPath}/admin?action=productList&pageNum=${startPage - 1}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i eq currentPage}">
                    <a style="font-size: 25px">[${i}]</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/admin?action=productList&pageNum=${i}">[${i}]</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < pageCount}">
            <a href="${pageContext.request.contextPath}/admin?action=productList&pageNum=${endPage + 1}">[다음]</a>
        </c:if>
    </div>
</div>
<jsp:include page="/views/footer.jsp"/>
