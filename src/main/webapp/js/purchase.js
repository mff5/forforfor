function selectPaymentMethod(meth) {
    if (confirm(meth + "로 결제하시겠습니까?")) {
        window.location.href = '../jspProc/purchaseProc.jsp?meth=' + encodeURIComponent(meth);
    }
}

function goCart() {
    window.location.href = 'cartList.jsp';
}