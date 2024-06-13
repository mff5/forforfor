function calculatePrice() {
    const originalPrice = document.querySelector("#originalPrice").value;
    const discountRate = document.querySelector("#discount").value;
    const price = originalPrice - (originalPrice * (discountRate / 100));
    document.querySelector("#price").value = price;
}


function handleFileSelect(event) {
    const file = event.target.files[0];
    if (file) {
        document.querySelector("#imgURL").value = '../img/' + file.name;
    }
}

function triggerFileInput() {
    document.querySelector("#fileInput").click();
}