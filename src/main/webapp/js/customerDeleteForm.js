function begin() {
    document.delete.userPw.focus();
}
function checkIt() {
    if (document.delete.userPw.value === "") {
        alert("비밀번호를 입력하지 않았습니다");
        document.delete.userPw.focus();
        return false;
    }
}