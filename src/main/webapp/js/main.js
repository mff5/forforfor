function customer() {
    window.location.href = '/homepage/customer?action=customerForm';
}
function login() {
    window.location.href = '/homepage/common?action=login';
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
        window.location.href = '/homepage/common?action=logout';
    }
}
function cartList() {
    window.location.href = '/homepage/customer?action=cartList';
}
function products() {
    window.location.href = '/homepage/admin?action=productList';
}
function cart(productNo) {
    window.location.href = '/homepage/customer?action=insertCart&productNo=' + encodeURIComponent(productNo);
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
        window.location.href = '/homepage/customer?action=insertPurchase&meth=' + encodeURIComponent(meth);
    }
}

function qna() {
    window.location.href = '/homepage/common?action=boardList';
}

function purchase() {
    if(confirm("결제하시겠습니까?"))    {
        window.location.href = '/homepage/customer?action=purchase';
    }
}



