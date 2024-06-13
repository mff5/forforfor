let isIdAvailable = false;

function idCheck2() {
    const userId = document.querySelector("#userId").value;
    if (userId === "") {
        alert("아이디를 입력해주세요.");
        document.getElementById('userId').focus();
    } else {
        const popupWidth = 400;
        const popupHeight = 200;
        const left = (screen.width - popupWidth) / 2;
        const top = (screen.height - popupHeight) / 2;
        window.open(
            'idCheck2.jsp?userId=' + encodeURIComponent(userId),
            'idCheckPopup',
            `width=${popupWidth},height=${popupHeight},left=${left},top=${top}`
        );
    }
}

function setIdAvailability(isAvailable) {
    isIdAvailable = isAvailable;
    const userIdInfo = document.getElementById('userIdInfo');
    if (isAvailable) {
        userIdInfo.innerText = "아이디 확인완료";
        userIdInfo.style.color = "green";
    } else {
        userIdInfo.innerText = "존재하지 않는 아이디입니다.";
        userIdInfo.style.color = "red";
    }
}

function allCheck(event) {
    if (!isIdAvailable){
        alert("존재하지 않는 아이디입니다.");
        event.preventDefault();
        return false;
    }
    return true;
}