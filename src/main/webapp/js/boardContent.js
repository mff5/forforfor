function goReply(postNo, refNo, stepNo, depthLevel) {
    document.location.href = 'board.jsp?postNo=' + encodeURIComponent(postNo)+'&refNo=' + encodeURIComponent(refNo)
    +'&stepNo=' + encodeURIComponent(stepNo) + '&depthLevel=' + encodeURIComponent(depthLevel);
}

function goModify(postNo, pageNum) {
    document.location.href = 'boardModify.jsp?postNo=' + encodeURIComponent(postNo) + '&pageNum=' + encodeURIComponent(pageNum);
}
function goDelete(postNo, pageNum) {
    document.location.href = 'boardDelete.jsp?postNo=' + encodeURIComponent(postNo) + '&pageNum=' + encodeURIComponent(pageNum);
}
function goList(pageNum) {
    document.location.href = 'boardList.jsp?pageNum=' + encodeURIComponent(pageNum);
}