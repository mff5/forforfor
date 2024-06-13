let isIdAvailable = false;

function idCheck() {
    const userId = document.querySelector("#userId").value;
    if (userId === "") {
        alert("아이디를 입력해 주세요.");
        document.getElementById('userId').focus();
    } else {
        const popupWidth = 400;
        const popupHeight = 200;
        const left = (screen.width - popupWidth) / 2;
        const top = (screen.height - popupHeight) / 2;
        window.open(
            'idCheck.jsp?userId=' + encodeURIComponent(userId),
            'idCheckPopup',
            `width=${popupWidth},height=${popupHeight},left=${left},top=${top}`
        );
    }
}

function setIdAvailability(isAvailable) {
    isIdAvailable = isAvailable;
    const userIdInfo = document.getElementById('userIdInfo');
    if (isAvailable) {
        userIdInfo.innerText = "사용 가능한 아이디입니다.";
        userIdInfo.style.color = "green";
    } else {
        userIdInfo.innerText = "이미 존재하는 아이디입니다.";
        userIdInfo.style.color = "red";
    }
}



function userPwCheck() {
    const userPw = document.querySelector("#userPw");
    const userPwInfo = document.querySelector("#userPwInfo");
    let exp = /^[a-zA-Z0-9!@#$%^&*]{4,12}$/;
    if (userPw.value.match(exp)) {
        userPwInfo.innerHTML = "";
        return true;
    } else {
        userPwInfo.innerHTML = "4~12자리의 영문,숫자,특수문자(!, @, $, %, ^, &,*)로 입력해주세요";
        return false;
    }
}

function userPwOkCheck() {
    const userPw = document.querySelector("#userPw");
    const userPwOk = document.querySelector("#userPwOk");
    const userPwOkInfo = document.querySelector("#userPwOkInfo");

    if (userPw.value === userPwOk.value) {
        userPwOkInfo.innerHTML = "";
        return true;
    } else {
        userPwOkInfo.innerHTML = "비밀번호가 일치하지 않습니다.";
        return false;
    }
}

function userNameCheck() {
    const userName = document.querySelector("#userName");
    const userNameInfo = document.querySelector("#userNameInfo");

    if (userName.value.includes(" ")) {
        userNameInfo.innerHTML = "띄어쓰기는 허용되지 않습니다";
        return false;
    } else {
        userNameInfo.innerHTML = "";
        return true;
    }
}

function userEmailCheck() {
    const userEmail = document.querySelector("#userEmail");
    const userEmailInfo = document.querySelector("#userEmailInfo");
    let exp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;

    if (userEmail.value.match(exp)) {
        userEmailInfo.innerHTML = "";
        return true;
    } else {
        userEmailInfo.innerHTML = "올바른 이메일 주소를 입력해주세요.";
        return false;
    }
}

function allCheck(event) {
    if (!isIdAvailable) {
        alert("ID 중복확인을 해주세요.");
        event.preventDefault();
        return false;
    }
    if (userPwCheck() && userPwOkCheck() && userNameCheck() && userEmailCheck()) {
        return true;
    } else {
        alert("가입내용이 문제가 있습니다. 다시 입력해주세요.");
        event.preventDefault();
        return false;
    }
}

function fillAddress(postcode, address) {
    document.querySelector("#userPost").value = postcode;
    document.querySelector("#address1").value = address;
}

function searchPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            fillAddress(data.zonecode, data.address);
        }
    }).open();
}