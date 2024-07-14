<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/views/header.jsp"/>
<link rel="stylesheet" href="<c:url value="/css/list.css"/>">

<div class="container">
    <div class="header">
        <b>글목록(전체 글: ${count})</b>
        <a href="${pageContext.request.contextPath}/common?action=boardForm" class="write-btn">글쓰기</a>
    </div>
    <table>
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자ID</th>
            <th>작성일</th>
            <th>수정일</th>
            <th>조회수</th>
        </tr>
        <c:if test="${count == 0}">
            <tr>
                <td align="center" colspan="6">게시판에 저장된 글이 없습니다.</td>
            </tr>
        </c:if>
        <c:set var="number" value="${count}"/>
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${number}</td>
                <td>
                    <c:if test="${board.depthLevel > 0}">
                        <img src="<c:url value="/images/level.gif"/>" width="${20 * board.depthLevel}" height="16">
                        <img src="<c:url value="/images/re.gif"/>">
                    </c:if>
                    <a href="${pageContext.request.contextPath}/common?action=boardContent&postNo=${board.postNo}&pageNum=${currentPage}">${board.title}</a>
                    <c:if test="${board.views >= 20}">
                        <img src="../images/hot.gif" border="0" height="16">
                    </c:if>
                </td>
                <td>${board.userId}</td>
                <td>${board.createdDate}</td>
                <td>${board.updatedDate}</td>
                <td align="center" width="50">${board.views}</td>
            </tr>
            <c:set var="number" value="${number - 1}"/>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:if test="${startPage > 1}">
            <a href="${pageContext.request.contextPath}/common?action=boardList&pageNum=${startPage - 1}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i eq currentPage}">
                    <a style="font-size: 25px">[${i}]</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/common?action=boardList&pageNum=${i}">[${i}]</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < pageCount}">
            <a href="${pageContext.request.contextPath}/common?action=boardList&pageNum=${endPage + 1}">[다음]</a>
        </c:if>
    </div>
</div>
<jsp:include page="/views/footer.jsp"/>