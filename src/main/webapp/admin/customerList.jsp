<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/views/header.jsp"/>
<style>
    body {
        background-color: #f0f0f0;
    }
</style>

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
                <td>
                    <button class="delete-button" type="button" onclick="goDelete('${c.userId}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="/views/footer.jsp"/>