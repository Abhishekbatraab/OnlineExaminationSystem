<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.TestDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.TestDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.CourseDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.CourseDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	TestDAO testdao = new TestDAO();
	TestDTO testdto = new TestDTO();
	CourseDAO coursedao = new CourseDAO();
	ArrayList<CourseDTO> courseNameList = coursedao.getCourseNameList();
	request.setAttribute("coursenameList", courseNameList);
	System.out.println("Course Name List in jsp is "+courseNameList);
	ArrayList<TestDTO> testlist = testdao.readTestData();
	if(testlist.size()==0){
		System.out.println("No Record Found");
		String message = "No record Found";
		request.setAttribute("message", message);
	}
	else{
		request.setAttribute("testlist", testlist);
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
    <title>Dashboard</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/test.css" rel="stylesheet">
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/adminpage.css" rel="stylesheet"></link>
    
    <!-- Angular JS -->
    <script src="js/angular.min.js"></script>
    
    <script type="text/javascript">
    	const app = angular.module("myapp", []);
        app.controller('mycontroller', function ($scope) {
            //This will hide the DIV by default.
            $scope.testdatadiv = true;
            $scope.AddTestDiv = false;
            $scope.showTestDiv = function () {
                //If DIV is visible it will be hidden and vice versa.
                $scope.AddTestDiv = true;
                $scope.testdatadiv = false;            
            }
            $scope.goBack = function(){
            	$scope.testdatadiv = true;
            	$scope.AddTestDiv = false;
            }
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
	          <h1 class="page-header">Manage Tests <span class="after">Total Tests: <span><%= testlist.size() %></span></span></h1>
	          <div ng-show="testdatadiv">
	       		<h1 ng-model="viewHeading">View Tests</h1>
	       		<div class="table-responsive">
	            <table id="example" class="table table-striped table-bordered" style="width:100%">
	              <thead>
	                <tr>
	                  <th>Test Id</th>
	                  <th>courseId</th>
	                  <th>Test Name</th>
	                  <th>Test Timing</th>
	                  <th>Minimum Marks</th>	              
	                  <th>Total Marks</th>
	                  <th>Action</th>
	                </tr>
	              </thead>
	              <tbody> 
	              <tr><c:out value="${requestScope.message}"></c:out></tr>  	
	              	
	                <c:forEach var="testList" items="${requestScope.testlist}">
	                	 
	                	<tr>
							<td><c:out value="${testList.testId }"/></td>
							<td><c:out value="${testList.courseId}"/></td>
							<td><c:out value="${testList.testName}"/></td>
							<td><c:out value="${testList.testDuration}"></c:out>
							<td><c:out value="${testList.minMarks}"/></td>
							<td><c:out value="${testList.totalMarks}"/></td>
							<td>
								<table>
									<tr>
										<td class="addquesbtn"><a href="questions.jsp?testName=${testList.testName}">Add Questions </a></td> 
										<td class="deletebtn"><a>Delete</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
	             </tbody>
	            </table>
	            <button class="orange" ng-click="showTestDiv()">New Test <i class="fas fa-plus"></i></button>
	       		</div>          
        </div><!-- Test data close div -->
        	  
	      	  <div ng-show="AddTestDiv">
	      	  	
			  	<form class="form-horizontal" action="AddTest" method="post">
					  <div class="form-group">
					    <label for="courseidname" class="col-sm-2 control-label">Course Id and Course Name</label>
					    <div class="col-sm-10">
					      <select class="form-control" name="courseNameDropDown" id="courseidname">
									<option>Select Course</option>
									<c:forEach var="coursenamelist" items="${requestScope.coursenameList}">
										<option value="${coursenamelist.courseId}">
											<c:out value="${coursenamelist.courseId}"></c:out> |
											<c:out value="${coursenamelist.title}"></c:out>
										</option>
									</c:forEach>	
						  </select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="testname" class="col-sm-2 control-label">Test Name</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="testname" name="testName" placeholder="Same as course Name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="testtime" class="col-sm-2 control-label">Test Duration (Minutes)</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="testtime" name="testDuration" placeholder="Enter test duration">
					    </div>
					  </div>
					  
						<div class="form-group">
						   <label for="minmarks" class="col-sm-2 control-label">Minimum Marks</label>
						   <div class="col-sm-10">
						      <input type="text" class="form-control" id="minmarks" name="minMarks" placeholder="Enter Minimum Marks">
						   </div>
						</div>
						<div class="form-group">
							<label for="maxmarks" class="col-sm-2 control-label">Maximum Marks</label>
							<div class="col-sm-10">
						      <input type="text" class="form-control" id="maxmarks" name="maxMarks" placeholder="Enter Maximum Marks">
						    </div>
					    </div>
						<div class="form-group">
						   <div class="col-sm-offset-2 col-sm-10">
							      <button type="submit" class="btn btn-default orange">Add Test <i class="fas fa-plus before"></i></button>
						   </div>
					    </div>
				</form>
				<button class="btn btn-primary" ng-click="goBack()"><i class="far fa-hand-point-left before"></i><span>Back to Test</span> </button>
			</div><!-- Add test close div  -->
			
		</div><!-- Main Div end -->
		
		
      </div>
    </div>
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="js/holder.min.js"></script>
   
</body>
</html>
