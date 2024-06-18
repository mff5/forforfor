function goProductUpdate(productNo) {
    window.location.href = '/homepage/admin?action=productUpdateForm&productNo='+encodeURIComponent(productNo);
}
function goProductDelete(productNo) {
    if (confirm("삭제하시겠습니까?"))   {
        window.location.href = '/homepage/admin?action=deleteProduct&productNo='+encodeURIComponent(productNo);
    }
}
function goProductReset() {
    if (confirm("상품목록을 초기화하시겠습니까?"))    {
        window.location.href = '/homepage/admin?action=productReset';
    }
}