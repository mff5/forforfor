<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문의글 보기</title>
    <link href="${pageContext.request.contextPath}/css/boardContent.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/boardContent.js"></script>
</head>
<body>
<div class="container">
    <table>
        <tr>
            <th class="label">글번호</th>
            <td>${board.postNo}
            </td>
        </tr>
        <tr>
            <th class="label">ID</th>
            <td>${board.userId}
            </td>
        </tr>
        <tr>
            <th class="label">email</th>
            <td>${board.email}
            </td>
        </tr>
        <tr>
            <th class="label">전화번호</th>
            <td>${board.phone1}-${board.phone2}-${board.phone3}
            </td>
        </tr>
        <tr>
            <th class="label">제목</th>
            <td>${board.title}>
            </td>
        </tr>
        <tr>
            <th class="label">내용</th>
            <td>${board.postContent}
            </td>
        </tr>
        <tr>
            <th class="label">조회수</th>
            <td>${board.views}
            </td>
        </tr>
        <tr>
            <th class="label">작성일</th>
            <td>${board.createdDate}
            </td>
        </tr>
        <tr>
            <th class="label">수정일</th>
            <td>${board.updatedDate}
            </td>
        </tr>
        <tr>
            <th class="label">IP</th>
            <td>${board.ipAddress}
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <button type="button" onclick="goList(${pageNum})">목록으로</button>

                <c:if test="${loginId eq 'admin'}">
                    <button type="button"
                            onclick="goReply(<${board.postNo},${board.refNo},${board.stepNo},${board.depthLevel})">
                        답글쓰기
                    </button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>

                <c:if test="${loginId eq board.userId}">
                    <button type="button" onclick="goModify(${postNo},${pageNum})">수정하기</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" onclick="goDelete(${postNo},${pageNum})">삭제하기</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </c:if>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
