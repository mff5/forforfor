<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="header.jsp"/>

<link rel="stylesheet" href="<c:url value='/css/main.css'/>">
<script>
    document.addEventListener("DOMContentLoaded", function() {
        function initializeSlideshow() {
            let slideIndex = 0;
            const slides = document.querySelectorAll(".slideshow-slides a");
            const indicators = document.querySelectorAll(".indicator a");

            function showSlides() {
                slides.forEach((slide, index) => {
                    slide.style.display = index === slideIndex ? "block" : "none";
                });
                indicators.forEach((indicator, index) => {
                    indicator.classList.toggle('active', index === slideIndex);
                });
            }

            function nextSlide() {
                slideIndex = (slideIndex + 1) % slides.length;
                showSlides();
            }

            function prevSlide() {
                slideIndex = (slideIndex - 1 + slides.length) % slides.length;
                showSlides();
            }

            showSlides();
            setInterval(nextSlide, 5000);

            document.getElementById("slide-left").addEventListener("click", function(e) {
                e.preventDefault();
                prevSlide();
            });

            document.getElementById("slide-right").addEventListener("click", function(e) {
                e.preventDefault();
                nextSlide();
            });

            indicators.forEach((indicator, index) => {
                indicator.addEventListener("click", function(e) {
                    e.preventDefault();
                    slideIndex = index;
                    showSlides();
                });
            });
        }

        initializeSlideshow();
    });
</script>

    <section class="slideshow-container">
        <div class="slideshow">
            <div class="slideshow-slides">
                <a href="#"><img src="<c:url value="/images/brush1.jpg"/>" alt="Brush 1"></a>
                <a href="#"><img src="<c:url value="/images/brush2.jpg"/>"></a>
                <a href="#"><img src="<c:url value="/images/brush3.jpg"/>"></a>
                <a href="#"><img src="<c:url value="/images/brush4.jpg"/>"></a>
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
<jsp:include page="footer.jsp"/>