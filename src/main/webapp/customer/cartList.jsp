<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/views/header.jsp"/>

<link rel="stylesheet" href="<c:url value='/css/cartList.css'/>">

<div class="container">
    <div class="header">
        <b>카트 목록(카트 상품:${count})</b>
        <a href="#" class="write-btn" onclick="clearCart()">카트 비우기</a>
    </div>
    <table>
        <tr>
            <th>카트번호</th>
            <th>이미지</th>
            <th>카테고리</th>
            <th>상품명</th>
            <th>가격</th>
            <th>삭제</th>
        </tr>
        <c:if test="${count==0}">
            <tr>
                <td align="center" colspan="6">
                    저장된 상품이 없습니다.
                </td>
            </tr>
        </c:if>

        <c:if test="${count>0}">
            <c:set var="totalAmount" value="0"/>
            <c:set var="number" value="1"/>
            <c:forEach var="c" items="${cartList}">
                <c:set var="totalAmount" value="${totalAmount + c.price}"/>
                <tr>
                    <td>
                            ${number}
                    </td>
                    <td>
                        <img src="${c.imgURL}" alt="대체문자" class="pImg">
                    </td>
                    <td>
                            ${c.category}
                    </td>
                    <td>
                            ${c.productName}
                    </td>
                    <td>
                            ${c.price}
                    </td>
                    <td>
                        <input type="button" value="삭제" onclick="deleteCart(${c.cartNo})">
                    </td>
                </tr>
                <c:set var="number" value="${number+1}"/>
            </c:forEach>
        </c:if>
    </table>
</div>
<div class="pagination">
    <c:if test="${startPage > 1}">
        <a href="${pageContext.request.contextPath}/customer?action=cartList&pageNum=${startPage - 1}">[이전]</a>
    </c:if>
    <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <c:choose>
            <c:when test="${i eq currentPage}">
                <a style="font-size: 25px">[${i}]</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/customer?action=cartList&pageNum=${i}">[${i}]</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${endPage < pageCount}">
        <a href="${pageContext.request.contextPath}/customer?action=cartList&pageNum=${endPage + 1}">[다음]</a>
    </c:if>
</div>
<c:if test="${count>0}">
    <div class="purchase-buttons">
        <div id="totalAmount" class="total-amount">총 금액: ${totalAmount}원</div>
        <button type="button" onclick="purchase()" class="purchase-btn">결제하기</button>
    </div>
</c:if>

<jsp:include page="/views/footer.jsp"/>