alert("Dont press the back button, click 'Logout' button to get logout");
/*window.addEventListener("load", bindEvents);
var startBtn = document.querySelector("#startBtn");
var readCheckbox = document.querySelector("#readCheckbox");
function bindEvents(){
    //.addEventListener("click", );
    
}

function goFurther(){
    if(readCheckbox.checked==true){
        startBtn.disabled=false;
    }
    else{
        startBtn.disabled=true;
    }
}

$(document).ready(
	    function(){
	        $("#startBtn").click( function(){
	            $("#quesdiv").show();
	            $("#queslist").show();
	            $("#instructionbox").hide();
	        });
});*/

/*
Hidin and showing divs of question page and instruction page
*/

$(document).ready(
function(){
    $("#startBtn").click( function(){
        $("#quesdiv").show();
        $("#instructionbox").hide();
        
    });
});
