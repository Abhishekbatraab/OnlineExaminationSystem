<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList, com.bmpl.examviral.quiz.*"%>
<%@page import="java.util.HashMap, com.bmpl.examviral.quiz.*"%>
<%@page import="java.util.Map, com.bmpl.examviral.quiz.*"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.QuestionDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.TestDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.UserDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%			
		ArrayList<QuestionDTO> questionlist = (ArrayList<QuestionDTO>)request.getAttribute("questionList");
		TestDTO testdto = (TestDTO)request.getAttribute("testDetails");
		UserDTO userdto = (UserDTO)request.getAttribute("userdetails");
		session.setAttribute("testDetails", testdto);
		session.setAttribute("userdetails", userdto);
		String testName = (String)request.getAttribute("testName");
		int testDuration = (Integer)request.getAttribute("testDuration");
		int dataSize = questionlist.size();
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
<!DOCTYPE html5">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to <%= testName %> test</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
<link rel="icon" href="../../favicon.ico">
<link href="css/fontawesome.min.css" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Custom css -->
<link rel="stylesheet" href="css/testscreen.css">
<script src="js/timer.js"></script>
</head>

<body>
	<div class="row header">
    	<div class="col-lg-12">
            <div class="logo">
                <img src="images/logo.jpg" alt="">
            </div>
           <h1>Welcome to exam viral<br><span data-shadow-text="Text-Shadow">Java Programming</span><br> test</h1>
       </div>           
    </div>
	<div class="row quespage" ng-show="questionPage" id="quesdiv">
		<div class="col-lg-4 sidepanel">
			<div class="timestatus w3-container w3-allerta">
				<p>Total Time:<span id="totaltime"><c:out value="${testDuration}"></c:out></span></p>
                <p id="showtime" class="w3-xlarge">Time Left: <span id="time"></span> Minutes</p>
            </div>
            <div class="card">
                  <img src="images/newdp.png" alt="John" style="width:100%">
                  <h2>Samarth Parashar</h2>
                  <p class="title">Student</p>
                  <p class="iname">MERI College</p> 
                  <p><button>Contact</button></p>
            </div>
            
        </div>
		<div class="col-lg-8 quesdiv">
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
										<td><input type="radio" name="options<%= i %>" value="optionA" required>&nbsp <%= option1[i] %></td>
									</tr>
									<tr>
										<td>B</td>
										<td><input type="radio" name="options<%= i %>" value="optionB" required>&nbsp <%= option2[i] %></td>
									</tr>
									<tr>
										<td>C</td>
										<td><input type="radio" name="options<%= i %>" value="optionC" required>&nbsp <%= option3[i] %></td>
									</tr>
									<tr>
										<td>D</td>
										<td><input type="radio" name="options<%= i %>" value="optionD" required>&nbsp <%= option4[i] %></td>
									</tr>								
								</tbody>
							</table>
							   
						</div>
					</div>
 					
 				<%	
 					}
 				%>
 			<input class="btn btn-primary submitBtn" id="submitButton" type="submit" value="Submit">
        	</form>
	  </div>
    </div>
</body>
</html>