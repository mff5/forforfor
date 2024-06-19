function calculatePrice() {
    const originalPrice = parseFloat(document.querySelector("#originalPrice").value);
    const discountRate = parseFloat(document.querySelector("#discount").value);
    const price = originalPrice - (originalPrice * (discountRate / 100));
    document.querySelector("#price").value = Math.round(price);
}
/*
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

 */
function triggerFileInput() {
    document.getElementById('fileInput').click();
}

async function handleFileSelect(event) {
    const fileInput = event.target;
    if (fileInput.files.length > 0) {
        const file = fileInput.files[0];
        const formData = new FormData();
        formData.append('file', file);

        try {
            const response = await fetch('/homepage/upload', {
                method: 'POST',
                body: formData
            });

            if (response.ok) {
                const imgUrl = await response.text();
                document.getElementById('imgURL').value = imgUrl;
            } else {
                console.error('File upload failed.');
            }
        } catch (error) {
            console.error('An error occurred during the file upload:', error);
        }
    }
}

document.getElementById('fileInput').addEventListener('change', handleFileSelect);
