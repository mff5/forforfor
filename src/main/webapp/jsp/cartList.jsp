<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.vo.CartVO" %>
<%@ page import="homepage.dao.CartDAO" %>
<%
    response.setContentType("text/html; charset=UTF-8");
    request.setCharacterEncoding("UTF-8");

    String loginId = (String) session.getAttribute("loginId");
    int pageSize = 10;

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    int currentPage = Integer.parseInt(pageNum);
    int start = (currentPage - 1) * pageSize + 1;
    int end = currentPage * pageSize;

    int count;
    int number;
    ArrayList<CartVO> cartList = new ArrayList<>();
    CartDAO dao = CartDAO.getInstance();
    count = dao.getCartCount();
    if (count > 0) {
        cartList = dao.cartList2(start, end);
    }
    number = start;

    request.setAttribute("loginId", loginId);
    request.setAttribute("cartList", cartList);
    request.setAttribute("count", count);
    request.setAttribute("number", number);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <link href="${pageContext.request.contextPath}/css/cartList.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/js/cartList.js"></script>
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
        <b>카트 목록(카트 상품:<%=count%>)</b>
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
            <c:forEach var="c" items="${cartList}">
                <c:set var="totalAmount" value="${totalAmount + c.price}"/>
                <tr>
                    <td>
                            <%=number++%>
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
            </c:forEach>
        </c:if>
    </table>
</div>

<div>
    <%
        if (count > 0) {
            int pageBlock = 5;
            int temp = count % pageSize == 0 ? 0 : 1;
            int pageCount = count / pageSize + temp;

            int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
            int endPage = startPage + pageBlock - 1;
            if (endPage > pageCount) endPage = pageCount;

            request.setAttribute("startPage", startPage);
            request.setAttribute("endPage", endPage);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("pageBlock", pageBlock);
        }
    %>
    <c:if test="${count > 0}">
        <c:if test="${startPage > pageBlock}">
            <a href="cartList.jsp?pageNum=${startPage - pageBlock}">[이전]</a>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <a href="cartList.jsp?pageNum=${i}">[${i}]</a>
        </c:forEach>

        <c:if test="${endPage < pageCount}">
            <a href="cartList.jsp?pageNum=${startPage + pageBlock}">[다음]</a>
        </c:if>
    </c:if>
</div>
<c:if test="${count>0}">
    <div class="purchase-buttons">
        <div id="totalAmount" class="total-amount">총 금액: ${totalAmount}원</div>
        <button type="button" onclick="purchase()" class="purchase-btn">결제하기</button>
    </div>
</c:if>

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
