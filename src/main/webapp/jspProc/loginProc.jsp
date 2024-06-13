<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerDAO dao = CustomerDAO.getInstance();
%>>
<%
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");
    int check = dao.loginCheck(userId, userPw);

    request.setAttribute("check", check);
%>

<c:choose>
    <c:when test="${check==1}">
        <%
            session.setAttribute("loginId", userId);
        %>
        <script>
            alert("로그인 성공");
            window.location.href = "../jsp/main.jsp";
        </script>
    </c:when>
    <c:when test="${check==0}">
        <script>
            alert("비밀번호가 틀렸습니다.");
            window.location.href = "../jsp/login.jsp"
        </script>
    </c:when>
    <c:otherwise>
        <script>
            alert("아이디가 존재하지 않습니다");
            window.location.href = "../jsp/login.jsp"
        </script>
    </c:otherwise>
</c:choose>