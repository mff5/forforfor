<%@ page import="homepage.dao.ProductDAO" %>
<%@ page import="homepage.model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8" %>
<%
    String loginId = (String) session.getAttribute("loginId");
    ProductDAO dao = ProductDAO.getInstance();

    String sortBy = request.getParameter("sortBy");

    if (sortBy == null) {
        sortBy = "created_date";
    }

    ArrayList<Product> productList = dao.productList(sortBy);

    request.setAttribute("loginId", loginId);
    request.setAttribute("productList", productList);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" charset="utf-8"></script>
</head>
<body>
<header>
    <div class="header-container">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
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
<main>
    <section>
        <h2>전체</h2><br><br>
        <span>총<b style="color: #504EB3"><%=productList.size()%></b>건</span>
        <div style="text-align: right">
            <a href="${pageContext.request.contextPath}/views/all.jsp?sortBy=sales">판매량순</a> |
            <a href="${pageContext.request.contextPath}/views/all.jsp?sortBy=discount">할인율순</a> |
            <a href="${pageContext.request.contextPath}/views/all.jsp?sortBy=priceAsc">낮은가격순</a> |
            <a href="${pageContext.request.contextPath}/views/all.jsp?sortBy=price">높은가격순</a> |
            <a href="${pageContext.request.contextPath}/views/all.jsp?sortBy=created_date">신상품순</a>
        </div>
        <div>
            <c:choose>
                <c:when test="${not empty productList}">
                    <table align="center">
                        <c:forEach var="p" varStatus="status" items="${productList}">
                            <c:if test="${status.index % 4 ==0}">
                                <tr>
                            </c:if>
                            <td>
                                <img src="${p.imgURL}" alt="대체사진" class="tbImg"
                                <c:if test="${loginId != null && !loginId.equals('admin')}">
                                     onclick="cart(${p.productNo})"
                                </c:if>
                                >
                                <br>
                                <span class="bold">${p.productName}</span><br>
                                <span class="discount">${p.discount}%</span>
                                <span class="price">₩${p.price}</span>
                                <span class="original">₩${p.originalPrice}</span>
                            </td>
                            <c:if test="${status.index % 4 ==3 || status.last}">
                                </tr>
                            </c:if>
                        </c:forEach>

                    </table>
                </c:when>
                <c:otherwise>
                    <h1 align="center">등록된 상품이 없습니다.</h1>
                </c:otherwise>
            </c:choose>
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