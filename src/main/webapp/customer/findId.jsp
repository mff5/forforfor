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
    <title>아이디 찾기</title>
    <link href="${pageContext.request.contextPath}/css/findId.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<h1>아이디 찾기</h1>
<div class="container">
    <form id="findIdForm" action="${pageContext.request.contextPath}/customer?action=findId" method="post">
        <table>
            <tr>
                <td class="td1"><label for="idQuestion">아이디 찾기 질문</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <div class="custom-select-wrapper">
                        <select name="idQuestion" id="idQuestion" class="custom-select" required>
                            <option value="">질문을 선택해주세요</option>
                            <option value="어린 시절 가장 친한 친구의 이름은 무엇입니까?">어린 시절 가장 친한 친구의 이름은 무엇입니까?</option>
                            <option value="초등학교 시절 처음 다녔던 학교의 이름은 무엇입니까?">초등학교 시절 처음 다녔던 학교의 이름은 무엇입니까?</option>
                            <option value="당신이 처음으로 가졌던 애완동물의 이름은 무엇입니까?">당신이 처음으로 가졌던 애완동물의 이름은 무엇입니까?</option>
                            <option value="첫 번째 직장의 이름은 무엇입니까?">첫 번째 직장의 이름은 무엇입니까?</option>
                            <option value="가장 좋아하는 영화의 제목은 무엇입니까?">가장 좋아하는 영화의 제목은 무엇입니까?</option>
                            <option value="가장 좋아하는 음식은 무엇입니까?">가장 좋아하는 음식은 무엇입니까?</option>
                            <option value="어머니의 성함은 무엇입니까?">어머니의 성함은 무엇입니까?</option>
                            <option value="아버지의 성함은 무엇입니까?">아버지의 성함은 무엇입니까?</option>
                            <option value="가장 기억에 남는 장소는 어디입니까?">가장 기억에 남는 장소는 어디입니까?</option>
                            <option value="첫 번째 휴가를 보낸 곳은 어디입니까?">첫 번째 휴가를 보낸 곳은 어디입니까?</option>
                        </select>
                    </div>
                    <input type="text" name="idAnswer" id="idAnswer" required placeholder="답변을 입력해주세요">
                </td>
            </tr>
            <tr>
                <td colspan="2" class="center-button">
                    <button type="submit">아이디 찾기</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
