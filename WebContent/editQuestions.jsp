<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.TestDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.TestDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.QuestionDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.QuestionDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	/* 
	request.setAttribute("testName", testName);
	
	int quesNumber = Integer.parseInt(request.getParameter("quesNo"));//updated question question number */
	/* request.setAttribute("quesno", quesNumber);
	request.setAttribute("quesNo", quesNo); */
	/* String message = request.getParameter("message"); */
	/* request.setAttribute("message", message); */
	
	QuestionDAO quesdao = new QuestionDAO();
	QuestionDTO quesdto = new QuestionDTO();
	int quesNo = Integer.parseInt(request.getParameter("quesNo"));
	quesdto.setQuesNo(quesNo);
	QuestionDTO quesRecord = quesdao.getSpecificQuestion(quesdto);
	System.out.println("Question Record is "+quesRecord.toString());
	request.setAttribute("quesrecord", quesRecord);
	quesdto = (QuestionDTO)request.getAttribute("quesrecord");
	System.out.println("Question from question record is"+quesdto.getQuestion());
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
    <link href="css/editques.css" rel="stylesheet">
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
	            <li><a href="questions.jsp">Questions</a></li>
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
       <h1>Update Questions</h1>
       <h2><c:out value="${param.message}"></c:out> </h2>
	   <div class="updateques">
	    <form class="form-horizontal" action="EditQuestion?testName=<c:out value="${param.testName}"></c:out>&quesNo=<c:out value="${param.quesNo}"></c:out>" method="post">
		  <div class="form-group">
		     <label for="" class="col-sm-2 control-label">Test Name</label>
			 <div class="col-sm-10">
			      	<label><c:out value="${param.testName}"></c:out></label>
			 </div>
		  </div>
		  <div class="form-group">
			  <label for="question" class="col-sm-2 control-label">Question</label>
			  <div class="col-sm-10">
			      <textarea id="question" rows="4" cols="20" name="quesName"><c:out value='${quesrecord.getQuestion()}'/></textarea>
			  </div>
		  </div>			  
		 <div class="form-group">
		    <label for="optionA" class="col-sm-2 control-label">Option A</label>
			<input type="radio" name="options" value="optionA">
			<div class="col-sm-10">
			      <textarea id="optionA" rows="4" cols="20" name="optionA"><c:out value='${quesrecord.getOptionA()}'/></textarea>
			</div>
	     </div>
		 <div class="form-group">
			<label for="optionB" class="col-sm-2 control-label">Option B</label>
			<input type="radio" name="options" value="optionB">
			<div class="col-sm-10">
		      <textarea id="optionB" rows="4" cols="20" name="optionB"><c:out value='${quesrecord.getOptionB()}'/></textarea>
		    </div>
		</div>
		<div class="form-group">
		   	<label for="optionC" class="col-sm-2 control-label">Option C</label>
		  	<input type="radio" name="options" value="optionC">
			<div class="col-sm-10">
		       <textarea id="optionC" rows="4" cols="20" name="optionC"><c:out value='${quesrecord.getOptionC()}'/></textarea>
			</div>
	    </div>
		<div class="form-group">
		   	<label for="optionD" class="col-sm-2 control-label">Option D</label>
		   	<input type="radio" name="options" value="optionD">
			<div class="col-sm-10">
		       <textarea id="optionD" rows="4" cols="20" name="optionD"><c:out value='${quesrecord.getOptionD()}'/></textarea>
		  	</div>
		 </div>
		<div class="form-group">
		   <div class="col-sm-offset-2 col-sm-10">
			  <button type="submit" class="btn btn-default orange">Update Question <i class="fas fa-pencil-alt"></i></button>
		   </div>
		</div>
	</form>
	 <!-- <button class="btn btn-primary" ng-click="goBack()"><i class="far fa-hand-point-left before"></i><span>Back to Questions</span> </button> -->
  </div><!-- Update Question close div  -->
			
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
