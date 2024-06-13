<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.BoardDAO" %>
<%@ page import="homepage.vo.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>문의글 보기</title>
    <link href="${pageContext.request.contextPath}/css/boardContent.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/boardContent.js"></script>
</head>
<body>
<%
    try {
        String loginId = (String) session.getAttribute("loginId");
        if (loginId == null) {
            loginId = "visitor";
        }
        int postNo = Integer.parseInt(request.getParameter("postNo"));
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        BoardDAO dao = BoardDAO.getInstance();
        BoardVO vo;
        if (loginId.equals("admin")) {
            vo = dao.getBoard(postNo);
        } else {
            vo = dao.updateViewsGetBoard(postNo);
        }

        if (vo != null) {
%>
<div class="container">
    <table>
        <tr>
            <th class="label">글번호</th>
            <td><%=vo.getPostNo()%>
            </td>
        </tr>
        <tr>
            <th class="label">ID</th>
            <td><%=vo.getUserId()%>
            </td>
        </tr>
        <tr>
            <th class="label">email</th>
            <td><%=vo.getEmail()%>
            </td>
        </tr>
        <tr>
            <th class="label">전화번호</th>
            <td><%=vo.getPhone1()%>-<%=vo.getPhone2()%>-<%=vo.getPhone3()%>
            </td>
        </tr>
        <tr>
            <th class="label">제목</th>
            <td><%=vo.getTitle()%>
            </td>
        </tr>
        <tr>
            <th class="label">내용</th>
            <td><%=vo.getPostContent()%>
            </td>
        </tr>
        <tr>
            <th class="label">조회수</th>
            <td><%=vo.getViews()%>
            </td>
        </tr>
        <tr>
            <th class="label">작성일</th>
            <td><%=vo.getCreatedDate()%>
            </td>
        </tr>
        <tr>
            <th class="label">수정일</th>
            <td><%=vo.getUpdatedDate()%>
            </td>
        </tr>
        <tr>
            <th class="label">IP</th>
            <td><%=vo.getIpAddress()%>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <button type="button" onclick="goList(<%=pageNum%>)">목록으로</button>
                <%
                    if (loginId.equals("admin")) {
                %>
                <button type="button"
                        onclick="goReply(<%=postNo%>,<%=vo.getRefNo()%>,<%=vo.getStepNo()%>,<%=vo.getDepthLevel()%>)">
                    답글쓰기
                </button>&nbsp;&nbsp;&nbsp;&nbsp;
                <%
                    }
                    if (loginId.equals(vo.getUserId())) {
                %>
                <button type="button" onclick="goModify(<%=vo.getPostNo()%>,<%=pageNum%>)">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" onclick="goDelete(<%=vo.getPostNo()%>,<%=pageNum%>)">삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <%
                    }
                %>
            </td>
        </tr>
    </table>
    <%
    } else {
    %>
    <c:out value="해당 글을 찾을 수 없습니다."/>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</div>
</body>
</html>
