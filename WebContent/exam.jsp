<%@page import="java.util.ArrayList, com.bmpl.examviral.quiz.*"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.UserDTO"%>
<%@page import="com.bmpl.examviral.quiz.model.dto.QuestionDTO"%>
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
		
	%> --%>
	<c:set var="emailId" value="${requestScope.userdetails.email}"></c:set>
	<c:set var="username" value="${requestScope.userdetails.username}"></c:set>
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
               <img src="images/newdp.png" class="img-responsive" alt="profic picture" style="width: 100%">
               <h1><c:out value="${username}"></c:out></h1>
               <p class="title">Email: <c:out value="${email}"></c:out></p>
           </div>
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
            <c:forEach var="queslist" items="${requestScope.quizQuesList}">
            	<c:out value="${queslist.quesNo}"></c:out>
				<c:out value="${queslist.question}"></c:out><br>
				<c:out value="${queslist.optionA}"></c:out><br>
				<c:out value="${queslist.optionB}"></c:out><br>
				<c:out value="${queslist.optionC}"></c:out><br>
				<c:out value="${queslist.optionD}"></c:out><br>
			</c:forEach>
			
        </div>
        <div class="col-lg-8">
            <div class="panel panel-default subtitle">
               <h1>JAVA You Selected <span id="radioValue"></span></h1>               
           </div>
           <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Quesion No <span id="quesNo1Span">1</span><span id="quesNo2Span" class="quesSecondSpan">2</span>
                    <span id="quesNo3Span" class="quesThirdSpan">3</span>
                    <span id="quesNo4Span" class="quesFourthSpan">4</span>
                    <span id="quesNo5Span" class="quesFifthSpan">5</span>              
                    </h3>
                  </div>
                  <div class="panel-body">
                        Question : <span id="quesFirstSpan">This is first question</span>
                        <span id="quesSecondSpan" class="secondQuesSpan">This is second question</span>
                        <span id="quesThirdSpan" class="thirdQuesSpan">This is third question</span>
                        <span id="quesFourthSpan" class="fourthQuesSpan">This is fourth question</span>
                        <span id="quesFifthSpan" class="fifthQuesSpan">This is fifth question</span>
                        <hr>
                        <div id="optionListFirstDiv" class="optionList1">
                              <label>
                                <input type="radio" class="option-input radio" name="options" value="1"/>
                                <span id="option1">Option 1</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" value="2"/>
                                <span id="option2" >Option 2</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" value="3"/>
                                <span id="option3" >Option 3</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" value="4"/>
                                <span id="option4" >Option 4</span>
                              </label>
                        </div>
                        <div id="optionListSecondDiv" class="optionList2">
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option5">Option 5</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option6">Option 6</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option7">Option 7</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option8">Option 8</span>
                              </label>
                        </div>
                        <div id="optionListThirdDiv" class="optionList3">
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option9">Option 9</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option10">Option 10</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option11">Option 11</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option12">Option 12</span>
                              </label>
                        </div>
                        <div id="optionListFourthDiv" class="optionList4">
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option13">Option 13</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option14">Option 14</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option15">Option 15</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option16">Option 16</span>
                              </label>
                        </div>
                        <div id="optionListFifthDiv" class="optionList5">
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option17">Option 17</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option18">Option 18</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option19">Option 19</span>
                              </label><br>
                              <label>
                                <input type="radio" class="option-input radio" name="options" />
                                <span id="option20">Option 20</span>
                              </label>
                        </div>
                </div>
            </div>
            <ul class="pagination">
                  <li><a href="#" id="firstQuesLink">1</a></li>
                  <li><a href="#" id="secondQuesLink">2</a></li>
                  <li><a href="#" id="thirdQuesLink">3</a></li>
                  <li><a href="#" id="fourthQuesLink">4</a></li>
                  <li><a href="#" id="fifthQuesLink">5</a></li>
                  <li><button id="submitBtn">Submit</button></li>
            </ul>
        </div>
    </div>
    <script src="js/exam.js"></script>
</body>
</html>