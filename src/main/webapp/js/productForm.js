function calculatePrice() {
    const originalPrice = parseFloat(document.querySelector("#originalPrice").value);
    const discountRate = parseFloat(document.querySelector("#discount").value);
    const price = originalPrice - (originalPrice * (discountRate / 100));
    document.querySelector("#price").value = Math.round(price);
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

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/homepage/upload', true);

        xhr.onload = function () {
            if (xhr.status === 200) {
                document.getElementById('imgURL').value = xhr.responseText;
            } else {
                console.error('File upload failed.');
            }
        };

        xhr.send(formData);
    }
}