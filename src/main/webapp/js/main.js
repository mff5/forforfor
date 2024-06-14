function customer() {
    window.location.href = '/homepage/customer/customer.jsp';
}
function login() {
    window.location.href = '/homepage/customer/login.jsp';
}
function modify() {
    window.location.href = '/homepage/customer/customerUpdate.jsp';
}
function del() {
    window.location.href = '/homepage/customer/customerDelete.jsp';
}
function customerList() {
    window.location.href = '/homepage/admin?action=customerList';
}
function resetCustomer() {
    if (confirm("정말 초기화하시곘습니까?"))  {
        window.location.href = '/homepage/admin?action=customerReset';
    }
}
function goDelete(userId) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        window.location.href = '/homepage/admin?action=deleteCustomer&userId=' + encodeURIComponent(userId);
    }
}
function logout()   {
    if (confirm("로그아웃하시겠습니까?"))    {
        window.location.href = '/homepage/views/logout.jsp';
    }
}
function products() {
    window.location.href = '/homepage/admin?action=customerList';
}
function cart(productNo) {
    window.location.href = '/homepage/costumer?action=insertCart&productNo=' + encodeURIComponent(productNo);
}
function deleteCart(cartNo) {
    if (confirm("삭제하시겠습니까?")){
        window.location.href = '/homepage/customer?action=deleteCart&cartNo='+encodeURIComponent(cartNo);
    }
}
function clearCart() {
    if (confirm("카트를 비우시겠습니까??"))    {
        window.location.href = '/homepage/customer?action=resetCart';
    }
}

function selectPaymentMethod(meth) {
    if (confirm(meth + "로 결제하시겠습니까?")) {
        window.location.href = '/homepage/customer?action=purchase&meth=' + encodeURIComponent(meth);
    }
}
function goCart() {
    window.location.href = '/homepage/customer?action=cartList';
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
