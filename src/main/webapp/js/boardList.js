function customer() {
    window.location.href = '/homepage/customer?action=customerForm';
}
function login() {
    window.location.href = '/homepage/common?action=loginForm';
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
function goCart() {
    window.location.href = 'cartList.jsp';
}
function qna() {
    window.location.href = 'boardList.jsp';
}