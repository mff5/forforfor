<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>상품 등록</title>
    <script language="javascript" src="${pageContext.request.contextPath}/js/product.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product.css">
    <script src="../js/product.js"></script>
    <script src="https://kit.fontawesome.com/b345dcbb9c.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="logo-container">
    <a href="main.jsp"><i class="fa-brands fa-html5 logo"></i></a>
</div>
<h1>상품 등록</h1>
<div class="container">
    <form id="oneone" action="../jspProc/productProc.jsp" method="post" name="productform">
        <table>
            <tr>
                <td class="td1"><label for="imgURL">사진 주소</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2">
                    <input type="text" name="imgURL" id="imgURL" required>
                    <button type="button" class="button-small" onclick="triggerFileInput()">파일 선택</button>
                    <input type="file" id="fileInput" style="display: none;" onchange="handleFileSelect(event)">
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="category">상품 분류</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2">
                    <select name="category" id="category" required>
                        <optgroup label="Eyelash">
                            <option value="No Glue">No Glue</option>
                            <option value="Tidy">Tidy</option>
                            <option value="B Line">B Line</option>
                            <option value="A Line">A line</option>
                            <option value="X Line">X Line</option>
                        </optgroup>
                        <optgroup label="Brush">
                            <option value="Rich Gold">Rich Gold</option>
                            <option value="Pearl Vanilla">Pearl Vanilla</option>
                            <option value="Black Label">Black Label</option>
                        </optgroup>
                        <optgroup label="Etc">
                            <option value="Pencil">Pencil</option>
                            <option value="Spatula">Spatula</option>
                            <option value="Tweezer">Tweezer</option>
                            <option value="Case">Case</option>
                        </optgroup>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="td1"><label for="productName">상품명</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2"><input type="text" name="productName" id="productName" required></td>
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
                <td class="td1"><label for="stock">재고</label><span style="color: red ;font-size: 20px">*</span></td>
                <td class="td2"><input type="text" name="stock" id="stock"></td>
            </tr>
            <tr>
                <td colspan="2" class="center-button">
                    <button type="submit" onclick="allCheck(event)">상품 등록</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>