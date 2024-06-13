function customer() {
    window.location.href = '/homepage/jsp/customer.jsp';
}
function login() {
    window.location.href = '/homepage/jsp/login.jsp';
}
function logout()   {
    if (confirm("로그아웃하시겠습니까?"))    {
        window.location.href = '/homepage/jsp/logout.jsp';
    }
}
function modify() {
    window.location.href = '/homepage/jsp/customerModify.jsp';
}
function customerList() {
    window.location.href = '/homepage/jsp/customerList.jsp';
}
function del() {
    window.location.href = '/homepage/jsp/customerDelete.jsp';
}
function products() {
    window.location.href = '/homepage/jsp/productList.jsp';
}
function cart() {
    window.location.href = '/homepage/jsp/cartList.jsp';
}
function qna() {
    window.location.href = '/homepage/jsp/boardList.jsp';
}

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
    setInterval(nextSlide,5000);

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
