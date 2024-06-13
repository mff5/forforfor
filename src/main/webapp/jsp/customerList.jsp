<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page import="homepage.vo.CustomerVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String loginId = (String) session.getAttribute("loginId");
    CustomerDAO dao = CustomerDAO.getInstance();
    ArrayList<CustomerVO> customerList = dao.customerList();

    request.setAttribute("customerList", customerList);
    request.setAttribute("loginId", loginId);
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원리스트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerList.css">
    <script src="${pageContext.request.contextPath}/js/customerList.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">
            <a href="main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
        </div>

        <c:choose>

            <c:when test="${loginId==null}">

                <ul class="auth-menu">
                    <li><a href="#" onclick="login()">Login</a></li>
                    <li><a href="#" onclick="customer()">Signup</a></li>
                </ul>
            </c:when>
            <c:when test="${loginId.equals('admin')}">

                <ul class="auth-menu">
                    <li><a href="#" onclick="qna()">고객센터</a></li>
                    <li><a href="#" onclick="products()">상품관리</a></li>
                    <li><a href="#" onclick="customerList()">회원정보관리</a></li>
                    <li><a href="#" onclick="modify()">관리자정보변경</a></li>
                    <li><a href="#" onclick="logout()">로그아웃</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="auth-menu">
                    <li><a href="#" onclick="qna()">고객센터</a></li>
                    <li><a href="#" onclick="cart()">Cart</a></li>
                    <li><a href="#" onclick="modify()">회원정보변경</a></li>
                    <li><a href="#" onclick="logout()">로그아웃</a></li>
                    <li><a href="#" onclick="del()">회원탈퇴</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
    <nav>
        <ul class="main-menu">
            <li><a href="main.jsp">Home</a></li>
            <li><a href="all.jsp">전체</a></li>
            <li>
                <a href="#">Eyelash</a>
                <div class="dropdown-content">
                    <a href="#">No Glue</a>
                    <a href="#">Tidy</a>
                    <a href="#">B Line</a>
                    <a href="#">A Line</a>
                    <a href="#">X Line</a>
                </div>
            </li>
            <li>
                <a href="#">Brush</a>
                <div class="dropdown-content">
                    <a href="#">Rich Gold</a>
                    <a href="#">Pearl Vanilla</a>
                    <a href="#">Black Label</a>
                </div>
            </li>
            <li>
                <a href="#">Etc</a>
                <div class="dropdown-content">
                    <a href="#">Pencil</a>
                    <a href="#">Spatula</a>
                    <a href="#">Tweezer</a>
                    <a href="#">Case</a>
                </div>
            </li>
            <li><a href="#">Search</a></li>
        </ul>
    </nav>
</header>
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
                    <td><button class="delete-button" type="button" onclick="goDelete('${c.userId}')">삭제</button></td>
                </tr>
            </c:forEach>
        </table>
</div>
<footer>
    <div class="footer-main">
        <div class="footer-links">
            <a href="#">회사소개</a>
            <a href="#">이용약관</a>
            <a href="#">개인정보처리방침</a>
            <a href="#">고객센터</a>
        </div>
        <div class="footer-info">
            <p>주소: </p>
            <p>대표전화번호: </p>
            <p>사업자등록번호: </p>
            <p>&copy; 2024 SPIEL. All rights reserved.</p>
        </div>
    </div>
</footer>
</body>
</html>
