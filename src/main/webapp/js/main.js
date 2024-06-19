document.addEventListener("DOMContentLoaded", function() {     //함수 선언식
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