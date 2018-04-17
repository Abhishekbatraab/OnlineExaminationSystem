/**
 * 
 */

var lgBtn = document.querySelector("#lgBtn");
if(lgBtn){
lgBtn.addEventListener("click", showErrorMsg);
}

function showErrorMsg()
{
	var errorMsg = document.querySelector("#errMsg");
	if(errMsgDiv.style.display == "none"){
		errMsgDiv.style.display="block";
	}
	else{
		errMsgDiv.style.display = "none";
	}
}