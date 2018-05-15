<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.TestDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.TestDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.QuestionDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.QuestionDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	QuestionDAO quesdao = new QuestionDAO();
	String testName = request.getParameter("testName");
	String testname = request.getParameter("testname");
	request.setAttribute("testName", testName);
	request.setAttribute("testname", testname);
	//testname = request.getParameter("testname"); //testname getting from controller 
	
	ArrayList<QuestionDTO> questionlist = quesdao.getQuestions();
	System.out.println("No of questions is "+questionlist.size());
	if(questionlist.size()==0){
		System.out.println("No Record Found");
		String message = "No record Found";
		request.setAttribute("message", message);
	}
	else{
		request.setAttribute("queslist", questionlist);
		/* request.setAttribute("coursenamelist", courseNameList); */
	}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link href="css/fontawesome-all.css" rel="stylesheet">
    <title>Questions Dashboard</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/questions.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <!-- <link href="css/adminpage.css" rel="stylesheet"></link> -->
    
    <!-- Angular JS -->
    <script src="js/angular.min.js"></script>
    
    <script type="text/javascript">
    	const app = angular.module("myapp", []);
        app.controller('mycontroller', function ($scope) {
            //This will hide the DIV by default.
            
       });
    </script>
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body ng-app="myapp" ng-controller="mycontroller">

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Exam Viral - An Online Examination System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="adminpage.jsp">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
          <!-- <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form> -->
        </div>
      </div>
    </nav>
	<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
	          <ul class="nav nav-sidebar">
	            <li class="active"><a href="adminpage.jsp">Dashboard<span class="sr-only">(current)</span></a></li>
	            <li><a href="#">Profile</a></li>
	            <li><a href="#">Students</a></li>
	            <li><a href="courses.jsp">Courses</a></li>
	            <li><a href="#">Questions</a></li>
	            <li><a href="test.jsp">Test</a></li>
	            <li><a href="#">Results</a></li>                     
	          </ul>
	          <ul class="nav nav-sidebar">
	            <li><a href="">Results</a></li>
	            <li><a href="">Nav item again</a></li>
	            <li><a href="">One more nav</a></li>
	            <li><a href="">Another nav item</a></li>
	            <li><a href="">More navigation</a></li>
	          </ul>
	          <ul class="nav nav-sidebar">
	            <li><a href="">Nav item again</a></li>
	            <li><a href="">One more nav</a></li>
	            <li><a href="">Another nav item</a></li>
	          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	          <h1 class="page-header">Manage Questions <span class="after">Total Questions: <span><%= questionlist.size() %></span></span></h1>
	          <div>
	       		<h1 ng-model="viewHeading">View Questions</h1>
	       		<div class="table-responsive">
	            <table id="example" class="table table-striped table-bordered" style="width:100%">
	              <thead>
	                <tr>
	                  <th>Question No.</th>
	                  <th>Question</th>
	                  <th>Option A</th>
	                  <th>Option B</th>
	                  <th>Option C</th>	              
	                  <th>Option D</th>
	                  <th>Correct Answer</th>
	                  <th>Actions</th>
	                </tr>
	              </thead>
	              <tbody> 
	              <tr><c:out value="${requestScope.message}"></c:out></tr>  	
	              	
	                <c:forEach var="questionList" items="${requestScope.queslist}">
	                	 
	                	<tr>
							<td><c:out value="${questionList.quesNo}"/></td>
							<td><c:out value="${questionList.question}"/></td>
							<td><c:out value="${questionList.optionA}"/></td>
							<td><c:out value="${questionList.optionB}"></c:out>
							<td><c:out value="${questionList.optionC}"/></td>
							<td><c:out value="${questionList.optionD}"/></td>
							<td><c:out value="${questionList.correctAnswer}"/></td>
							<td>
								<table>
									<tr>
										<td class="editquesbtn"><a>Edit </a></td> 
										<td class="deletebtn"><a>Delete</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
	             </tbody>
	            </table>
	       		</div>          
        </div><!-- Question data close div -->
        	  
	      	  <div >
	      	  	
			  	<form class="form-horizontal" action="AddQuestions?testname=<c:out value="${requestScope.testName}"></c:out>" method="post">
					  <div class="form-group">
					    <label for="" class="col-sm-2 control-label">Test Name</label>
					    <div class="col-sm-10">
					      	<label><c:out value="${requestScope.testName}"></c:out></label>
					      	<label><c:out value="${requestScope.testname}"></c:out></label>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="question" class="col-sm-2 control-label">Question</label>
					    <div class="col-sm-10">
					      <textarea id="question" rows="4" cols="20" name="quesName"></textarea>
					    </div>
					  </div>
					  
						<div class="form-group">
						   <label for="optionA" class="col-sm-2 control-label">Option A</label>
						   <input type="radio" name="options" value="optionA">
						   <div class="col-sm-10">
						      <textarea id="optionA" rows="4" cols="20" name="optionA"></textarea>
						   </div>
						</div>
						<div class="form-group">
							<label for="optionB" class="col-sm-2 control-label">Option B</label>
							<input type="radio" name="options" value="optionB">
							<div class="col-sm-10">
						      <textarea id="optionB" rows="4" cols="20" name="optionB"></textarea>
						   </div>
					    </div>
					    <div class="form-group">
					    	<label for="optionC" class="col-sm-2 control-label">Option C</label>
					    	<input type="radio" name="options" value="optionC">
							<div class="col-sm-10">
						      <textarea id="optionC" rows="4" cols="20" name="optionC"></textarea>
							</div>
					    </div>
					    <div class="form-group">
					    	<label for="optionD" class="col-sm-2 control-label">Option D</label>
					    	<input type="radio" name="options" value="optionD">
							<div class="col-sm-10">
						      <textarea id="optionD" rows="4" cols="20" name="optionD"></textarea>
						   	</div>
					    </div>
					 	<!-- <div class="form-group">
					    	<label for="" class="col-sm-2 control-label">Correct Answer</label>
						    <div class="col-sm-10">
						      	<label></label>
						    </div>
					    </div> -->							
						<div class="form-group">
						   <div class="col-sm-offset-2 col-sm-10">
							      <button type="submit" class="btn btn-default orange">Add Question <i class="fas fa-plus before"></i></button>
						   </div>
					    </div>
				</form>
				<button class="btn btn-primary" ng-click="goBack()"><i class="far fa-hand-point-left before"></i><span>Back to Questions</span> </button>
			</div><!-- Add Question close div  -->
			
		</div><!-- Main Div end -->
		
		
      </div>
    </div>
	
    <!-- Bootstrap core JavaScript
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="js/holder.min.js"></script>
   
</body>
</html>
