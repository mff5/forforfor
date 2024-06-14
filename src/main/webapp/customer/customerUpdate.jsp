<%@ page import="homepage.model.Customer" %>
<%@ page import="homepage.dao.CustomerDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CustomerDAO customerDAO = CustomerDAO.getInstance();

    String loginId = (String) session.getAttribute("loginId");

    Customer customer = customerDAO.getCustomer(loginId);
%>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <title>회원정보 변경</title>
    <script language="javascript" src="${pageContext.request.contextPath}/js/customer.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/customer.css">
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
</head>
<div class="logo-container">
    <a href="main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<h1>회원정보 변경</h1>
<div class="container">
    <form id="oneone" action="${pageContext.request.contextPath}/customer?action=updateCustomer" method="post">
        <table>
            <tr>
                <td class="td1"><label for="userId">사용자ID</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="text" name="userId" id="userId" value="<%=customer.getUserId()%>" readonly required style="width: calc(50% - 16px); display: inline-block;">
                    <div id="userIdInfo" class="error-info"></div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="userPw">비밀번호</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="password" name="userPw" id="userPw" maxlength="12" required onkeyup="userPwCheck()">
                    <span class="asdf">· 4~12자리의 영문,숫자,특수문자(!, @, $, %, ^, &,*)만 가능</span>
                    <div id="userPwInfo" class="error-info"></div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="userPwOk">비밀번호 확인</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="password" name="userPwOk" id="userPwOk" maxlength="12" required onkeyup="userPwOkCheck()">
                    <div id="userPwOkInfo" class="error-info"></div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="userName">이름</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="text" name="userName" id="userName" required onkeyup="userNameCheck()">
                    <span class="asdf">· 띄어쓰기 없이 입력, 반드시 실명이어야 합니다!</span>
                    <div id="userNameInfo" class="error-info"></div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="userEmail">E-mail</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <div class="email-group">
                        <input type="email" name="userEmail" id="userEmail" required onkeyup="userEmailCheck()">
                        <label for="emailSubscription" class="checkbox-label">메일 수신여부</label>
                        <input type="checkbox" name="emailSubscription" id="emailSubscription">
                    </div>
                    <div id="userEmailInfo" class="error-info"></div>
                    <span class="asdf">· <b>할인 이벤트정보</b> 및 할인쿠폰, 관심분야 등 꼭 필요한 정보를 빠르게 받아보실 수 있습니다.</span>
                    <span class="asdf">· 비밀번호 분실시 E-mail로 확인해 드리니, <span style="color: #ff1493;"><b>정확한 E-mail주소를 기입</b></span>해주세요;</span>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="userPost">우편번호</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="text" name="userPost" id="userPost" size="5" required style="width: calc(50% - 16px); display: inline-block;">
                    <button type="button" class="button-small" style="display: inline-block" onclick="searchPostcode()">우편번호 검색</button>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="address1">주소</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <input type="text" name="address1" id="address1" size="50" required><br>
                    <input type="text" name="address2" id="address2" size="50" required><br>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="phone1">휴대폰번호</label><span style="color: red;"> *</span></td>
                <td class="td2">
                    <div class="phone-input">
                        <select name="phone1" id="phone1" required style="width: calc(25% - 16px); display: inline-block;">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                        </select>
                        <input type="tel" name="phone2" id="phone2" maxlength="4" required pattern="\d{4}" style="width: calc(25% - 16px); display: inline-block;">
                        <input type="tel" name="phone3" id="phone3" maxlength="4" required pattern="\d{4}" style="width: calc(25% - 16px); display: inline-block;">
                    </div>
                </td>
            </tr>
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
                    <button type="submit">회원정보 변경</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
