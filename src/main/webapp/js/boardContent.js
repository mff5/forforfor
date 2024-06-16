function goReply(postNo, refNo, stepNo, depthLevel) {
    document.location.href = '/homepage/common?action=boardForm&postNo=' + encodeURIComponent(postNo)+'&refNo=' + encodeURIComponent(refNo)
    +'&stepNo=' + encodeURIComponent(stepNo) + '&depthLevel=' + encodeURIComponent(depthLevel);
}

function goModify(postNo, pageNum) {
    document.location.href = '/homepage/common?action=boardUpdateForm&postNo=' + encodeURIComponent(postNo) +'&pageNum=' + encodeURIComponent(pageNum);
}
function goDelete(postNo, pageNum) {
    document.location.href = '/homepage/common?action=boardDeleteForm&postNo=' + encodeURIComponent(postNo) + '&pageNum=' + encodeURIComponent(pageNum);
}
function goList(pageNum) {
    document.location.href = '/homepage/common?action=boardList&pageNum=' + encodeURIComponent(pageNum);
}