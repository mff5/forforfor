<%--
  Created by IntelliJ IDEA.
  User: road5
  Date: 24. 6. 5.
  Time: 오후 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link href="${pageContext.request.contextPath}/css/findPw.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/findPw.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<h1>비밀번호 찾기</h1>
<div class="container">
    <form id="findPasswordForm" action="../jspProc/findPwProc.jsp" method="post" onsubmit="return allCheck(event)">
        <table>
            <tr>
                <td class="td1"><label for="userId">아이디</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="text" name="userId" id="userId" required style="width: calc(50% - 16px); display: inline-block;">
                    <button type="button" class="button-small" style="display: inline-block;" onclick="idCheck2()">아이디 확인</button>
                    <div id="userIdInfo" class="error-info"></div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="pwQuestion">비밀번호 찾기 질문</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <div class="custom-select-wrapper">
                        <select name="pwQuestion" id="pwQuestion" class="custom-select" required>
                            <option value="">질문을 선택해주세요</option>
                            <option value="가장 좋아하는 책의 제목은 무엇입니까?">가장 좋아하는 책의 제목은 무엇입니까?</option>
                            <option value="어린 시절의 별명은 무엇입니까?">어린 시절의 별명은 무엇입니까?</option>
                            <option value="가장 기억에 남는 선생님의 이름은 무엇입니까?">가장 기억에 남는 선생님의 이름은 무엇입니까?</option>
                            <option value="당신이 태어난 도시는 어디입니까?">당신이 태어난 도시는 어디입니까?</option>
                            <option value="첫 번째 차량의 모델명은 무엇입니까?">첫 번째 차량의 모델명은 무엇입니까?</option>
                            <option value="어머니의 출생 도시는 어디입니까?">어머니의 출생 도시는 어디입니까?</option>
                            <option value="가장 좋아하는 스포츠 팀은 무엇입니까?">가장 좋아하는 스포츠 팀은 무엇입니까?</option>
                            <option value="당신의 첫 번째 애완동물의 이름은 무엇입니까?">당신의 첫 번째 애완동물의 이름은 무엇입니까?</option>
                            <option value="가장 좋아하는 음식은 무엇입니까?">가장 좋아하는 음식은 무엇입니까?</option>
                            <option value="결혼기념일 또는 생일은 언제입니까?">결혼기념일 또는 생일은 언제입니까?</option>
                        </select>
                    </div>
                    <input type="text" name="pwAnswer" id="pwAnswer" required placeholder="답변을 입력해주세요">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="center-button">
                    <button type="submit">비밀번호 찾기</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
