function goDelete(userId) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        window.location.href = '../jspProc/customerListProc.jsp?userId=' + encodeURIComponent(userId);
    }
}
function login() {
    window.location.href = 'login.jsp';
}

function customer() {
    window.location.href = 'customer.jsp';
}

function logout()   {
    if (confirm("로그아웃하시겠습니까?")) {
        window.location.href = 'logout.jsp';
    }
}
function modify() {
    window.location.href = 'customerModify.jsp';
}
function customerList() {
    window.location.href = 'customerList.jsp';
}
function del() {
    window.location.href = 'customerDelete.jsp';
}
function products() {
    window.location.href = 'productList.jsp';
}
function qna() {
    window.location.href = 'boardList.jsp';
}
function resetCustomer() {
    if (confirm("초기화하시곘습니까?"))  {
        window.location.href = 'customerClear.jsp';
    }
}