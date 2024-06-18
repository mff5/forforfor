function checkIdPw(event) {
    const userIdEmail = document.querySelector("#userId");
    const userPassword = document.querySelector("#userPw");

    if ((userIdEmail.value === "") || (userPassword.value === "")) {
        alert("아이디/비밀번호를 입력해주세요.");
        event.preventDefault();
        return false;
    }
    return true;
}
function findId() {
    window.location.href='/homepage/customer/findIdForm.jsp';
}
function findPw() {
    window.location.href='/homepage/customer/findPwForm.jsp';
}
function customer() {
    window.location.href='/homepage/customer?action=customerForm';
}