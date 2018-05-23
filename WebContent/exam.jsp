<%@page import="java.util.ArrayList, com.bmpl.examviral.quiz.*"%>
<%@page import="java.util.Arrays, com.bmpl.examviral.quiz.*"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.UserDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.TestDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.QuestionDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dao.QuestionDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Test</title>
    <link rel="icon" href="favicon-16x16.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/exam.css">
    <!-- Icon Library Link -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- Angular JS -->
    <script src="js/angular.min.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
    <script type="text/javaScript">
			function disableBackButton()
			{
			window.history.forward();
			}
			setTimeout("disableBackButton()", 0);
	</script>
    
</head>
<body onload="disableBackButton()">
	<%-- <%
		UserDTO userdto = (UserDTO) request.getAttribute("userdetails");
		String emailId = userdto.getEmail();
		String username = userdto.getUsername();
		ArrayList<QuestionDTO> quizqueslist  =  (ArrayList<QuestionDTO>) request.getAttribute("quizQuesList");
		QuestionDTO quesdto = new QuestionDTO();
		int quesno = 0;
		
	%>  --%>
	<%
			ArrayList<QuestionDTO> questionlist  =  (ArrayList<QuestionDTO>) request.getAttribute("questionList");
			//request.setAttribute("questionList", questionlist);
			session.setAttribute("questionList", questionlist);
			int dataSize = questionlist.size();
			String testName = (String)request.getAttribute("testName");
			UserDTO userdto = (UserDTO)request.getAttribute("userdetails");
			TestDTO testdto = (TestDTO)request.getAttribute("testData");
			int testDuration = testdto.getTestDuration();
			System.out.println("Time duration is "+testDuration);
			int minMarks = testdto.getMinMarks();
			int totalMarks = testdto.getTotalMarks();
			String emailId = userdto.getEmail();
			String username = userdto.getUsername();
			String institutename = userdto.getInstitutename();
			userdto.setEmail(emailId);
			userdto.setUsername(username);
			userdto.setInstitutename(institutename);
			testdto.setMinMarks(minMarks);
			testdto.setTotalMarks(totalMarks);
			session.setAttribute("userdetails", userdto);
			session.setAttribute("testDuration", testDuration);
			session.setAttribute("testdetails", testdto);
			//request.setAttribute("userdetails", userdto);
			System.out.println("Email in jsp is "+ emailId);
			System.out.println("Institute Name in exam page is "+institutename);		
	%>	
    <div class="row">
    
        <div class="col-lg-12 header">
            <div class="siteLogo">
                <img src="images/logo.jpg" alt="">
                <h1>Exam Viral</h1>
            </div>
        </div>        
    </div>
    <div class="row" id="instructionbox">
        <div class="col-lg-4">
			<div class="card">
			  <img src="images/newdp.png" alt="John" style="width:100%">
			  <h2><c:out value="${username}"></c:out></h2>
			  <p class="title">Student</p>
			  <p><%= institutename %></p>
			  <!-- <a href="#"><i class="fa fa-dribbble"></i></a> 
			  <a href="#"><i class="fa fa-twitter"></i></a> 
			  <a href="#"><i class="fa fa-linkedin"></i></a> 
			  <a href="#"><i class="fa fa-facebook"></i></a> --> 
			  <!-- <p><button>Contact</button></p> -->
			</div>
        </div>
        <div class="col-lg-8 instructionpage"  id="firstpagediv">
            <h1 class="bg-primary">Instructions Page</h1>
            <div id="instructionContent" class="bg-info">
                <hr>
                <p>
                    Candidates are required to read the instructions related to examination carefully.
                </p>
                <p>About Online Test</p>
                <ul>
                    <li>Test time period is <%= testDuration%>&nbsp;Minutes</li>
                    <li>This test consists of <%= dataSize %> Questions</li>
                    <li>The test comprises of Object type questions</li>
                    <li>The questions carry 1 mark each</li>        
                </ul>
            </div>
            <!-- <div id="acceptTerms">
                <input type="checkbox" id="readCheckbox" ng-click=showStartbtn() autofocus>
                I read all the instructions that are given above in this instruction page
            </div> -->
            <%-- <a class="btn btn-primary" href="/OnlineTestProject/TestScreen?testName=<c:out value="${testName}"></c:out>" >Start Test</a> --%>
            <!-- <input type= "button" id="startBtn" value="Start Test" ng-click="showQuestionPage()" href="TestScreenController?" class="btn btn-primary" > -->
            <form action="TestScreen?testName=<c:out value="${testName}"></c:out>&testDuration=<c:out value="${testDuration}"></c:out>" method="Post">
            	<input type="submit" value="Start Test" class="btn btn-primary">
            </form>	
            <a href="logout.jsp" class="btn btn-primary">Logout</a>
        </div>
    </div>
    <!-- <script src="js/exam.js"></script> -->
</body>
</html>