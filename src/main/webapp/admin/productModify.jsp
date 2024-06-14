<%@ page import="homepage.vo.ProductVO" %>
<%@ page import="homepage.dao.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int productNo = Integer.parseInt(request.getParameter("productNo"));
    ProductDAO dao = ProductDAO.getInstance();
    ProductVO product = dao.getProduct(productNo);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 수정</title>
    <script language="javascript" src="${pageContext.request.contextPath}/js/productModify.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productModify.css">
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<h1>상품 수정</h1>
<div class="container">
    <form id="oneone" action="../jspProc/productModifyProc.jsp" method="post" name="productform">
        <table>
            <tr>
                <td class="td1"><label for="productNo">상품 번호</label><span style="color: red; font-size: 20px">*</span></td>
                <td class="td2">
                    <input type="text" name="productNo" id="productNo" value="<%=productNo%>" readonly>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="imgURL">사진 주소</label><span style="color: red; font-size: 20px">*</span></td>
                <td class="td2">
                    <input type="text" name="imgURL" id="imgURL" value="<%= product.getImgURL() %>" required>
                    <button type="button" class="button-small" onclick="triggerFileInput()">파일 선택</button>
                    <input type="file" id="fileInput" style="display: none;" onchange="handleFileSelect(event)">
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="category">상품 분류</label><span style="color: red; font-size: 20px">*</span></td>
                <td class="td2">
                    <select name="category" id="category" required>
                        <option value="">-- 선택 --</option>
                        <option value="No Glue" <%= product.getCategory().equals("No Glue") ? "selected" : "" %>>No Glue</option>
                        <option value="Tidy" <%= product.getCategory().equals("Tidy") ? "selected" : "" %>>Tidy</option>
                        <option value="B Line" <%= product.getCategory().equals("B Line") ? "selected" : "" %>>B Line</option>
                        <option value="A Line" <%= product.getCategory().equals("A Line") ? "selected" : "" %>>A Line</option>
                        <option value="X Line" <%= product.getCategory().equals("X Line") ? "selected" : "" %>>X Line</option>
                        <option value="Rich Gold" <%= product.getCategory().equals("Rich Gold") ? "selected" : "" %>>Rich Gold</option>
                        <option value="Pearl Vanilla" <%= product.getCategory().equals("Pearl Vanilla") ? "selected" : "" %>>Pearl Vanilla</option>
                        <option value="Black Label" <%= product.getCategory().equals("Black Label") ? "selected" : "" %>>Black Label</option>
                        <option value="Pencil" <%= product.getCategory().equals("Pencil") ? "selected" : "" %>>Pencil</option>
                        <option value="Spatula" <%= product.getCategory().equals("Spatula") ? "selected" : "" %>>Spatula</option>
                        <option value="Tweezer" <%= product.getCategory().equals("Tweezer") ? "selected" : "" %>>Tweezer</option>
                        <option value="Case" <%= product.getCategory().equals("Case") ? "selected" : "" %>>Case</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="productName">상품명</label><span style="color: red; font-size: 20px">*</span></td>
                <td class="td2"><input type="text" name="productName" id="productName" value="<%= product.getProductName() %>" required></td>
            </tr>








            <tr>
                <td class="td1"><label for="originalPrice">정가</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2">
                    <div class="input-group">
                        <input type="text" name="originalPrice" id="originalPrice" required oninput="calculatePrice();">
                        <span class="unit">원</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="discount">할인율</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2">
                    <div class="input-group">
                        <input type="text" name="discount" id="discount" required oninput="calculatePrice();">
                        <span class="unit">%</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="price">가격</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2">
                    <div class="input-group">
                        <input type="text" name="price" id="price" readonly>
                        <span class="unit">원</span>
                    </div>
                </td>
            </tr>







            <tr>
                <td class="td1"><label for="stock">재고</label><span style="color: red; font-size: 20px">*</span></td>
                <td class="td2"><input type="text" name="stock" id="stock" value="<%= product.getStock() %>" required></td>
            </tr>
            <tr>
                <td colspan="2" class="center-button">
                    <button type="submit" onclick="allCheck(event)">상품 수정</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>