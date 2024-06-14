<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>
<main>
    <section class="slideshow-container">
        <div class="slideshow">
            <div class="slideshow-slides">
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush1.jpg" alt="Brush 1"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush2.jpg" alt="Brush 2"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush3.jpg" alt="Brush 3"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/img/brush4.jpg" alt="Brush 4"></a>
            </div>
            <div class="slideshow-nav">
                <a href="#" id="slide-left"><i class="fa-solid fa-angles-left"></i></a>
                <a href="#" id="slide-right"><i class="fa-solid fa-angles-right"></i></a>
            </div>
            <div class="indicator">
                <a href="#" class="active"><i class="fa-solid fa-circle-dot"></i></a>
                <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
                <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
                <a href="#"><i class="fa-solid fa-circle-dot"></i></a>
            </div>
        </div>
    </section>
    <section class="new-items">
        <h2>New</h2>
        <c:if test="${not empty productList3}">
            <table>
                <tr>
                    <c:forEach var="p" items="${productList3}">
                        <td>
                            <a href="#"><img src="${p.imgURL}" alt="New Item 1" class="tbImg"></a>
                            <br>
                            <span class="bold">${p.productName}</span><br>
                            <span class="discount">${p.discount}%</span>
                            <span class="price">₩${p.price}</span>
                            <span class="original">₩${p.originalPrice}</span>
                        </td>
                    </c:forEach>
                </tr>
            </table>
        </c:if>
        <div class="new-items-container">

        </div>
    </section>
</main>
<jsp:include page="footer.jsp"/>