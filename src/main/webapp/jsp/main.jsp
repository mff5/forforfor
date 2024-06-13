<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.vo.ProductVO" %>
<%@ page import="homepage.dao.ProductDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String loginId = (String) session.getAttribute("loginId");
    request.setAttribute("loginId", loginId);

    ProductDAO dao = ProductDAO.getInstance();
    ArrayList<ProductVO> productList3 = dao.getProductList3();

    request.setAttribute("productList3", productList3 );
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" charset="utf-8"></script>
</head>
<body onload="initializeSlideshow()">
<header>
    <div class="header-container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/jsp/main.jsp"><i class="fa-brands fa-html5"></i></a>
        </div>
        <c:choose>
            <c:when test="${loginId == null}">
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
            <li><a href="${pageContext.request.contextPath}/jsp/main.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/jsp/all.jsp">전체</a></li>
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
<main>
    <section class="slideshow-container">
        <div class="slideshow">
            <div class="slideshow-slides">
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush1.jpg" alt="Brush 1"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush2.jpg" alt="Brush 2"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush3.jpg" alt="Brush 3"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush4.jpg" alt="Brush 4"></a>
            </div>
            <div class="slideshow-nav">
                <a href="#" id="slide-left"><i class="fa-solid fa-angles-left"></i></a>
                <a href="#" id="slide-right"><i class="fa-solid fa-angles-right"></i></a>
            </div>
            <div class="indicator">
                <a href="#" class="active"><i class="fa-solid fa-circle-dot"></i></a>
                <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
                <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
                <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
            </div>
        </div>
    </section>
    <section class="new-items">
        <h2>New</h2>
        <c:if test="${not empty productList3}">
            <table>
                <tr>
                    <c:forEach var="p" items="${productList3}">
                        <td>
                            <a href="#"><img src="${p.imgURL}" alt="New Item 1" class="tbImg"></a>
                            <br>
                            <span class="bold">${p.productName}</span><br>
                            <span class="discount">${p.discount}%</span>
                            <span class="price">₩${p.price}</span>
                            <span class="original">₩${p.originalPrice}</span>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
        <div class="new-items-container">

        </div>
    </section>
</main>
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
