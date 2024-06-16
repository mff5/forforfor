<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.dao.ProductDAO" %>
<%@ page import="homepage.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String loginId = (String) session.getAttribute("loginId");
    request.setAttribute("loginId", loginId);

    ProductDAO dao = ProductDAO.getInstance();
    ArrayList<Product> productList3 = dao.getProductList3();

    request.setAttribute("productList3", productList3 );
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" charset="utf-8"></script>
</head>
<body onload="">
<header>
    <div class="header-container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5"></i></a>
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
                    <li><a href="#" onclick="cartList()">Cart</a></li>
                    <li><a href="#" onclick="modify()">회원정보변경</a></li>
                    <li><a href="#" onclick="logout()">로그아웃</a></li>
                    <li><a href="#" onclick="del()">회원탈퇴</a></li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
    <nav>
        <ul class="main-menu">
            <li><a href="${pageContext.request.contextPath}/views/main.jsp">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/views/all.jsp">전체</a></li>
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