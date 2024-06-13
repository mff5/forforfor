function calculatePrice() {
    const originalPrice = document.querySelector("#originalPrice").value;
    const discountRate = document.querySelector("#discount").value;
    const price = originalPrice - (originalPrice * (discountRate / 100));
    document.querySelector("#price").value = price;
}

function triggerFileInput() {
    document.getElementById('fileInput').click();
}

function handleFileSelect(event) {
    var fileInput = event.target;
    if (fileInput.files.length > 0) {
        var file = fileInput.files[0];
        var formData = new FormData();
        formData.append('file', file);

        // 파일 업로드를 위한 XMLHttpRequest 생성
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/homepage/upload', true);  // URL 경로 수정

        xhr.onload = function () {
            if (xhr.status === 200) {
                // 서버에서 파일의 절대 경로를 반환받아 imgURL 필드에 설정
                document.getElementById('imgURL').value = xhr.responseText;
            } else {
                console.error('File upload failed.');
            }
        };

        xhr.send(formData);
    }
}