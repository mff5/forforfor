<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CartDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="homepage.vo.CartVO" %><%--
  Created by IntelliJ IDEA.
  User: road5
  Date: 24. 6. 8.
  Time: 오후 6:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String meth = request.getParameter("meth");
    String loginId = (String) session.getAttribute("loginId");

    if (loginId==null)  {
        loginId = "test";
    }

    ArrayList<CartVO> cartList = new ArrayList<>();

    int totalPrice = 0;

    CartDAO dao = CartDAO.getInstance();
    cartList = dao.cartList();

    for (CartVO c :cartList)    {
        totalPrice += c.getPrice();
    }

    boolean result = dao.purchase(loginId, meth, totalPrice);

    request.setAttribute("result", result);
%>
<c:choose>
    <c:when test="${result}">
        <script>
            alert("결제 성공");
            window.location.href = '../jsp/main.jsp';
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("결제 실패");
            window.location.href = '../jsp/main.jsp';
        </script>
    </c:otherwise>
</c:choose>