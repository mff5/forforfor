<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의하기</title>
    <link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/js/board.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<%
    String loginId = (String) session.getAttribute("loginId");
    int postNo=0, refNo=1, stepNo=0, depthLevel=0;
    if (request.getParameter("postNo") != null) {
        postNo = Integer.parseInt(request.getParameter("postNo"));
        refNo = Integer.parseInt(request.getParameter("refNo"));
        stepNo = Integer.parseInt(request.getParameter("stepNo"));
        depthLevel = Integer.parseInt(request.getParameter("depthLevel"));
    }
    request.setAttribute("loginId", loginId);
    request.setAttribute("postNo", postNo);
    request.setAttribute("refNo", refNo);
    request.setAttribute("stepNo", stepNo);
    request.setAttribute("depthLevel", depthLevel);
%>
<div class="container">
    <h2 class="title">문의하기</h2>
    <form method="post" name="boardForm" action="${pageContext.request.contextPath}/common?action=insertBoard" onsubmit="return validateForm()">
        <input type="hidden" name="postNo" value="${postNo}">
        <input type="hidden" name="refNo" value="${refNo}">
        <input type="hidden" name="stepNo" value="${stepNo}">
        <input type="hidden" name="depthLevel" value="${depthLevel}">
        <table>
            <tr>
                <td class="td1"><label for="userId">사용자ID</label></td>
                <td class="td2">
                    <input type="text" name="userId" id="userId" required value="${loginId}" readonly>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="email">이메일</label></td>
                <td class="td2"><input type="email" name="email" id="email" required></td>
            </tr>
            <tr>
                <td class="td1"><label for="phone1">전화번호</label></td>
                <td class="td2">
                    <div class="phone-input">
                        <select name="phone1" id="phone1" required>
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        <input type="tel" name="phone2" id="phone2" maxlength="4" required pattern="\d{4}">
                        <input type="tel" name="phone3" id="phone3" maxlength="4" required pattern="\d{4}">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="title">제목</label></td>
                <td class="td2"><input type="text" name="title" id="title" required value="<%=request.getParameter("postNo") == null ? "" : "답변"%>"></td>
            </tr>
            <tr>
                <td class="td1"><label for="postContent">내용</label></td>
                <td class="td2"><textarea name="postContent" id="postContent" rows="8" required></textarea></td>
            </tr>
            <tr>
                <td class="td1"><label for="password">비밀번호</label></td>
                <td class="td2"><input type="password" name="password" id="password" required></td>
            </tr>
            <tr>
                <td class="td1"><label for="password2">비밀번호 확인</label></td>
                <td class="td2"><input type="password" name="password2" id="password2" required onkeyup="passwordOkCheck()">
                    <span id="passwordOkInfo" style="color: red;"></span>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <button type="submit">문의하기</button>
                    <button type="reset">다시작성</button>
                    <button type="button" onclick="goList()">목록</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
