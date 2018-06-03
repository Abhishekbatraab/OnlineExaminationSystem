/**
 * For Validating the user input
 */

window.addEventListener("load", init);

function init(){
	userPwd= document.querySelector("#password");
	confirmPwd = document.querySelector("#cnfrmpwd");
	message = document.querySelector("#message");
	confirmPwd.addEventListener("blur", matchpassword);
}

function matchpassword(){
	if(userPwd.value!=""&&confirmPwd.value!=""){
        if(userPwd.value==confirmPwd.value){
            message.innerHTML = "Password Matched";
        }
        else{
            message.innerHTML = "Cannot match the password";
        }
    }
    else{
        message.innerHTML = "";
    }
}

