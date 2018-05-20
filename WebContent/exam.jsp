<%@page import="java.util.ArrayList, com.bmpl.examviral.quiz.*"%>
<%@page import="java.util.Arrays, com.bmpl.examviral.quiz.*"%>
<%@page import="java.util.HashMap, com.bmpl.examviral.quiz.*"%>
<%@page import="java.util.Map, com.bmpl.examviral.quiz.*"%>
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
    <!-- Angular JS -->
    <script src="js/angular.min.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
    <script>
	    const app = angular.module("myapp", []);
		app.controller('mycontroller', function ($scope) {
	        //This will hide the DIV by default.
	        $scope.firstPage = true;
	        $scope.questionPage = false;
	        $scope.showQuestionPage = function(){
	        	$scope.questionPage = true;
	        	$scope.firstPage = false;
	        };
	        
	    });
    </script>
    <script type="text/javaScript">
			function disableBackButton()
			{
			window.history.forward();
			}
			setTimeout("disableBackButton()", 0);
	</script>
    
</head>
<body onload="disableBackButton()" ng-app="myapp" ng-controller="mycontroller">
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
		int dataSize = questionlist.size();
		String testName = (String)request.getAttribute("testName");
		HashMap<Integer, String[]> map = new HashMap<Integer, String[]>();
		HashMap<Integer, String[]> quesmap = new HashMap<Integer, String[]>();
		int quesNum[] = new int[dataSize];
		String quesArr[] = new String[dataSize];
		String optionAArray[] = new String[dataSize];
		String optionBArray[] = new String[dataSize];
		String optionCArray[] = new String[dataSize];
		String optionDArray[] = new String[dataSize];		
		String option1[] = new String[dataSize];
		String option2[] = new String[dataSize];
		String option3[] = new String[dataSize];
		String option4[] = new String[dataSize];
		String ques1[] = new String[dataSize];
		String ques2[] = new String[dataSize];
		String ques3[] = new String[dataSize];
		String ques4[] = new String[dataSize];
		String ques5[] = new String[dataSize];
		int keys[] = new int[dataSize];
		int quesKeys[] = new int[dataSize];
		UserDTO userdto = (UserDTO)request.getAttribute("userdetails");
		String emailId = userdto.getEmail();
		String username = userdto.getUsername();
		String institutename = userdto.getInstitutename();
		System.out.println("Institute Name in exam page is "+institutename);
		
		for(int i=0,j=i+1,k=j+1,l=k+1; i<questionlist.size();i++){
			QuestionDTO quesSet = questionlist.get(i);
			quesNum[i] = quesSet.getQuesNo();
			quesArr[i] =quesSet.getQuestion();
			for(String s: quesArr){
				System.out.println("New Array "+s);
				
			}
			optionAArray[i]= quesSet.getOptionA();
			optionBArray[i]= quesSet.getOptionB();
			optionCArray[i]= quesSet.getOptionC();
			optionDArray[i]= quesSet.getOptionD();			
			System.out.println("Question No is "+quesNum[i]);
			System.out.println("Question "+(i+1)+" is "+quesArr[i]);
			System.out.println("Option A Array is "+optionAArray[i]);
			System.out.println("Option B Array is "+optionBArray[i]);
			System.out.println("Option C Array is "+optionCArray[i]);
			System.out.println("Option D Array is "+optionDArray[i]);
			map.put(keys[i], optionAArray);
			option1 = map.get(keys[i]);
			System.out.println("Keys of I "+option1[i]);
			map.put(keys[j], optionBArray);
			option2 = map.get(keys[j]);
			System.out.println("Keys of J "+option2[j]);
			map.put(keys[k], optionCArray);
			option3 = map.get(keys[k]);
			System.out.println("Keys of K "+option3[k]);
			map.put(keys[l], optionDArray);
			option4 = map.get(keys[l]);
			System.out.println("Keys of L "+option4[l]);
		}
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
    <div class="row" id="instructionbox" ng-show="firstPage">
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
        <div class="col-lg-8 instructionpage"  id="firstpagediv">
            <h1 class="bg-primary">Instructions Page</h1>
            <div id="instructionContent" class="bg-info">
                <hr>
                <p>
                    Candidates are required to read the instructions related to examination carefully.
                </p>
                <p>About Online Test</p>
                <ul>
                    <li>Test time period is 10 mins</li>
                    <li>This test consists of <%= dataSize %> Questions</li>
                    <li>The test comprises of Object type questions</li>
                    <li>The questions carry 1 mark each</li>        
                </ul>
            </div>
            <!-- <div id="acceptTerms">
                <input type="checkbox" id="readCheckbox" ng-click=showStartbtn() autofocus>
                I read all the instructions that are given above in this instruction page
            </div> -->
            <input type= "button" id="startBtn" value="Start Test" ng-click="showQuestionPage()" class="btn btn-primary" >
            <a href="logout.jsp" class="btn btn-primary">Logout</a>
        </div>
    </div>
    
    <div class="row quespage" ng-show="questionPage" id="quesdiv">
        <div class="col-lg-12 quesdiv">
 			<form action="Test?noofquestions=<%= dataSize%>&testName=<%= testName%>" method="post">
 						<%
 							for(int i=0;i<keys.length;i++){
 								
 						%>	
 						<div class="panel panel-primary">
						<div class="panel-heading">
							<input type="hidden" name="que<%=i%>" value="<%= quesArr[i]%>"/>
						    <h3 class="panel-title"><%= quesNum[i] %>&nbsp &nbsp <%= quesArr[i]%><br></h3>
						</div>
						<div class="panel-body">
							<table>
								<tbody>
									
									<tr>
										<td>A</td>
										<td><input type="radio" name="options<%= i %>" value="optionA">&nbsp <%= option1[i] %></td>
									</tr>
									<tr>
										<td>B</td>
										<td><input type="radio" name="options<%= i %>" value="optionB">&nbsp <%= option2[i] %></td>
									</tr>
									<tr>
										<td>C</td>
										<td><input type="radio" name="options<%= i %>" value="optionC">&nbsp <%= option3[i] %></td>
									</tr>
									<tr>
										<td>D</td>
										<td><input type="radio" name="options<%= i %>" value="optionD">&nbsp <%= option4[i] %></td>
									</tr>								
								</tbody>
							</table>
							   
						</div>
					</div>
 					
 				<%	
 					}
 				%>
 				<%-- <c:forEach var="queslist" items="${requestScope.questionList}">
	        		<div class="panel panel-primary">
						<div class="panel-heading">
						    <h3 class="panel-title"><c:out value="${queslist.quesNo}"></c:out>&nbsp &nbsp<c:out value="${queslist.question}"></c:out><br></h3>
						</div>
						<div class="panel-body">
							<table>
								<tbody>
									<tr>
										<td>A</td>
										<td><input type="radio" name="options" value="optionA">&nbsp<c:out value="${queslist.optionA}"></c:out></td>
									</tr>
									<tr>
										<td>B</td>
										<td><input type="radio" name="options" value="optionB">&nbsp<c:out value="${queslist.optionB}"></c:out></td>
									</tr>
									<tr>
										<td>C</td>
										<td><input type="radio" name="options" value="optionC">&nbsp<c:out value="${queslist.optionC}"></c:out></td>
									</tr>
									<tr>
										<td>D</td>
										<td><input type="radio" name="options" value="optionD">&nbsp<c:out value="${queslist.optionD}"></c:out></td>
									</tr>								
								</tbody>
							</table>
							   
						</div>
					</div>
	        	</c:forEach>
	     --%>    	
	     	<input class="btn btn-primary submitBtn" type="submit" value="Submit">
        	</form>
	  </div>
    </div>
    <!-- <script src="js/exam.js"></script> -->
</body>
</html>