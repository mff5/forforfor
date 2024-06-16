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
        <c:set var="number" value="${number}" scope="page" />
        <c:forEach var="board" items="${boardList}">
            <tr>
                <td>${number}</td>
                <td>
                    <c:if test="${board.depthLevel > 0}">
                        <img src="<c:url value="/images/re.gif"/>" width="${5 * board.depthLevel}" height="16">
                        <img src="<c:url value="/images/re.gif"/>">
                    </c:if>
                    <c:if test="${board.depthLevel == 0}">
                        <img src="../images/level.gif" width="0" height="16">
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
            <c:set var="number" value="${number - 1}" scope="page" />
        </c:forEach>
    </table>
    <c:if test="${count > 0}">
        <c:if test="${startPage > pageBlock}">
            <a href="${pageContext.request.contextPath}/common?action=boardList&pageNum=${startPage - pageBlock}">[이전]</a>
        </c:if>
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="${pageContext.request.contextPath}/common?action=boardList&pageNum=${i}">[${i}]</a>
        </c:forEach>
        <c:if test="${endPage < pageCount}">
            <a href="${pageContext.request.contextPath}/common?action=boardList&pageNum=${startPage + pageBlock}">[다음]</a>
        </c:if>
    </c:if>
</div>
<jsp:include page="/views/footer.jsp"/>