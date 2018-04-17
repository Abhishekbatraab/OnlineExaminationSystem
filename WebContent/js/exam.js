alert("Dont press the back button, click 'Logout' button to get logout");
window.addEventListener("load", bindEvents);
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
});

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
/*
Getting the values of radio button
*/
//var radios = document.getElementsByName('options');
//var spans = document.getElementsByTagName('span');
var radioValue = document.querySelector("#radioValue");

var optionList = document.getElementsByName('options');
var option_value;
for(var i = 0; i < optionList.length; i++){
if(optionList[i].checked){
    option_value = optionList[i].value;
    radioValue.innerHTML = option_value;
}
}
//var checkedRadio = document.querySelector('input[name="options"]:checked').value;
//radioValue.innerHTML = checkedRadio;


$(document).ready(
function(){
    $("#firstQuesLink").click( function(){
        $("#quesNo1Span").show();
        $("#quesFirstSpan").show();
        $("#optionListFirstDiv").show();
        $("#quesNo2Span").hide();
        $("#quesSecondSpan").hide();     
        $("#optionListSecondDiv").hide();
        $("#quesNo3Span").hide();
        $("#quesThirdSpan").hide();     
        $("#optionListThirdDiv").hide();
        $("#quesNo4Span").hide();
        $("#quesFourthSpan").hide();
        $("#optionListFourthDiv").hide();
        $("#quesNo5Span").hide();
        $("#quesFifthSpan").hide();
        $("#optionListFifthDiv").hide();
        
    });
});

$(document).ready(
function(){
    $("#secondQuesLink").click( function(){
        $("#quesNo2Span").show();
        $("#quesSecondSpan").show();
        $("#optionListSecondDiv").show();
        $("#quesNo1Span").hide();
        $("#quesFirstSpan").hide();     
        $("#optionListFirstDiv").hide();
        $("#quesNo3Span").hide();
        $("#quesThirdSpan").hide();     
        $("#optionListThirdDiv").hide();
        $("#quesNo4Span").hide();
        $("#quesFourthSpan").hide();
        $("#optionListFourthDiv").hide();
        $("#quesNo5Span").hide();
        $("#quesFifthSpan").hide();
        $("#optionListFifthDiv").hide();
        
    });
});

$(document).ready(
function(){
    $("#thirdQuesLink").click( function(){
        $("#quesNo3Span").show();
        $("#quesThirdSpan").show();
        $("#optionListThirdDiv").show();
        $("#quesNo1Span").hide();
        $("#quesFirstSpan").hide();     
        $("#optionListFirstDiv").hide();
        $("#quesNo2Span").hide();
        $("#quesSecondSpan").hide();     
        $("#optionListSecondDiv").hide();
        $("#quesNo4Span").hide();
        $("#quesFourthSpan").hide();
        $("#optionListFourthDiv").hide();
        $("#quesNo5Span").hide();
        $("#quesFifthSpan").hide();
        $("#optionListFifthDiv").hide();
        
    });
});

$(document).ready(
function(){
    $("#fourthQuesLink").click( function(){
        $("#quesNo4Span").show();
        $("#quesFourthSpan").show();
        $("#optionListFourthDiv").show();
        $("#quesNo1Span").hide();
        $("#quesFirstSpan").hide();     
        $("#optionListFirstDiv").hide();
        $("#quesNo3Span").hide();
        $("#quesThirdSpan").hide();     
        $("#optionListThirdDiv").hide();
        $("#quesNo2Span").hide();
        $("#quesSecondSpan").hide();
        $("#optionListSecondDiv").hide();
        $("#quesNo5Span").hide();
        $("#quesFifthSpan").hide();
        $("#optionListFifthDiv").hide();
        
    });
});

$(document).ready(
function(){
    $("#fifthQuesLink").click( function(){
        $("#quesNo5Span").show();
        $("#quesFifthSpan").show();
        $("#optionListFifthDiv").show();
        $("#quesNo1Span").hide();
        $("#quesFirstSpan").hide();     
        $("#optionListFirstDiv").hide();
        $("#quesNo3Span").hide();
        $("#quesThirdSpan").hide();     
        $("#optionListThirdDiv").hide();
        $("#quesNo4Span").hide();
        $("#quesFourthSpan").hide();
        $("#optionListFourthDiv").hide();
        $("#quesNo2Span").hide();
        $("#quesSecondSpan").hide();
        $("#optionListSecondDiv").hide();
        
    });
});



//var welcomeDiv = document.querySelector("#welcomeDiv");
//var quesTableDiv = document.querySelector("#quesTableDiv");

//function hideWelcomeDiv(){
//    if(welcomeDiv.style.visibility=="visible"){
//        welcomeDiv.style.visibility = "hidden";
//    }
//    else{
//        welcomeDiv.style.visibility = "visible";
//    }
//    if(quesTableDiv.style.visibility=="hidden"){
//        quesTableDiv.style.visibility="visible";
//    }
//    else{
//        quesTableDiv.style.visibility="hidden";
//    }
//}