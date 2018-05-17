<%@page import="java.util.ArrayList, com.bmpl.examviral.quiz.*"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.UserDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.QuestionDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dao.QuestionDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Test</title>
    <link rel="icon" href="favicon-16x16.png">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/radiostyle.css">
    <link rel="stylesheet" href="css/exam.css">
    <!-- Icon Library Link -->
    <link rel="stylesheet" href="css/fontawesome.min.css">    
    <script src="js/jquery-3.2.1.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
</head>
<body>
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
		request.setAttribute("questionList", questionlist);
		UserDTO userdto = (UserDTO)request.getAttribute("userdetails");
		String emailId = userdto.getEmail();
		String username = userdto.getUsername();
		String institutename = userdto.getInstitutename();
		System.out.println("Institute Name in exam page is "+institutename);
	%>
	<%-- <c:set var="quesno" value="${requestScope.quizQuesList.quesNo}"></c:set> --%>
	
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
            <%-- <div class="card">
               <img src="images/newdp.png" class="img-responsive" alt="profic picture" style="width: 100%">
               <h1><c:out value="${username}"></c:out></h1>
               <p class="title">Email: <c:out value="${email}"></c:out></p>
           </div> --%>
        </div>
        <div class="col-lg-8 instructionpage" id="firstpagediv">
            <h1 class="bg-primary">Instructions Page</h1>
            <div id="instructionContent" class="bg-info">
                <hr>
                <p>
                    Candidates are required to read the instructions related to examination carefully.
                </p>
                <p>About Online Test</p>
                <ul>
                    <li>Test time period is 10 mins</li>
                    <li>This test consists of 5 Questions</li>
                    <li>The test comprises of Object type questions</li>
                    <li>The questions carry 1 mark each</li>        
                </ul>
            </div>
            <div id="acceptTerms">
                <input type="checkbox" id="readCheckbox" onclick="goFurther()" autofocus>
                I read all the instructions that are given above in this instruction page
            </div>
            <input type= "button" id="startBtn" value="Start Test" class="btn btn-primary" disabled>
            <a href="logout.jsp" class="btn btn-primary">Logout</a>
        </div>
    </div>
    
    <div class="row quespage" id="quesdiv">
        <div class="col-lg-4">
            <c:forEach var="queslist" items="${requestScope.questionList}">
            	<c:out value="${queslist.quesNo}"></c:out>
				<c:out value="${queslist.question}"></c:out><br>
				<c:out value="${queslist.optionA}"></c:out><br>
				<c:out value="${queslist.optionB}"></c:out><br>
				<c:out value="${queslist.optionC}"></c:out><br>
				<c:out value="${queslist.optionD}"></c:out><br>
			</c:forEach>
		</div>
        <div class="col-lg-8">
            
          
        </div>
    </div>
    <!-- <script src="js/exam.js"></script> -->
</body>
</html>