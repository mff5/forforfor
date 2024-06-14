<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제창</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/purchase.css">
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="${pageContext.request.contextPath}/views/main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<div class="payment-container">
    <h1>결제 방법 선택</h1>
    <button onclick="selectPaymentMethod('카드 결제')">1. 카드 결제</button>
    <button onclick="selectPaymentMethod('현금 결제')">2. 현금 결제</button>
    <button onclick="selectPaymentMethod('모바일 결제')">3. 모바일 결제</button>
    <button onclick="selectPaymentMethod('기프트 카드 결제')">4. 기프트 카드 결제</button>
    <button onclick="selectPaymentMethod('QR 코드 결제')">5. QR 코드 결제</button>
    <button class="cart-button" onclick="goCart()">카트로 돌아가기</button>
</div>
</body>
</html>
