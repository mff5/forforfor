function validateForm() {
    const userId = document.forms["contactForm"]["userId"].value;
    const email = document.forms["contactForm"]["email"].value;
    const phone2 = document.forms["contactForm"]["phone2"].value;
    const phone3 = document.forms["contactForm"]["phone3"].value;
    const title = document.forms["contactForm"]["title"].value;
    const postContent = document.forms["contactForm"]["postContent"].value;

    if (userId === "" || email === "" || phone2 === "" || phone3 === "" || title === "" || postContent === "") {
        alert("모든 필드를 채워주세요.");
        return false;
    }
    return true;
}

function goList() {
    window.location.href = '/homepage/common?action=boardList';
}

function passwordOkCheck() {
    const password = document.querySelector("#password");
    const password2 = document.querySelector("#password2");
    const passwordOkInfo = document.querySelector("#passwordOkInfo");

    if (password.value === password2.value) {
        passwordOkInfo.innerHTML = "";
        return true;
    } else {
        passwordOkInfo.innerHTML = "비밀번호가 일치하지 않습니다.";
        return false;
    }
}