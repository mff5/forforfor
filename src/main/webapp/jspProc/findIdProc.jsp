<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String idQuestion = request.getParameter("idQuestion");
    String idAnswer = request.getParameter("idAnswer");
    CustomerDAO dao = CustomerDAO.getInstance();
    ArrayList<String> idList = dao.findId(idQuestion, idAnswer);

    request.setAttribute("idList", idList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" href="../css/findIdProc.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<div class="logo-container">
    <a href="../jsp/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="container">
    <c:if test="${not empty idList}">
        <h2>검색된 아이디 목록</h2>
        <ul class="id-list">
        <c:forEach var="id" items="${idList}">
            <li>${id}</li>
        </c:forEach>
        </ul>
        <button class="back-button" onclick="window.location.href='../jsp/findPw.jsp'">비밀번호 찾기</button>
    </c:if>


    <c:if test="${empty idList}">
        <h2>검색된 아이디가 없습니다.</h2>
    </c:if>
    <button class="back-button" onclick="window.location.href='../jsp/findId.jsp'">돌아가기</button>
</div>
</body>
</html>