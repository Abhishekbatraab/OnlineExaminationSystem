<%@page import="com.bmpl.examviral.quiz.model.dao.ResultDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.TestDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.TestDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.CourseDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.CourseDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.UserDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.QuestionDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	TestDAO testdao = new TestDAO();
	TestDTO testdto = new TestDTO();
	UserDAO userdao = new UserDAO();
	ResultDAO resultdao = new ResultDAO();
	QuestionDAO quesdao = new QuestionDAO();
	CourseDAO coursedao = new CourseDAO();
	int totalRecords=0;
	int totalusers=0;
	int totalquestions = 0;
	int totalresults = 0;
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
		totalusers = userdao.countTotalRecords();
		totalRecords = testdao.countTotalRecords();
		totalquestions = quesdao.countTotalRecords();
		totalresults = resultdao.countTotalRecords();
		request.setAttribute("testlist", testlist);
		/* request.setAttribute("coursenamelist", courseNameList); */
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="images/favicon-16x16.png">
  <link href="css/fontawesome-all.css" rel="stylesheet">
  <title>Exam Viral | Admin</title>
  <!-- Bootstrap core CSS-->
  <link href="bootstrap-4.1.1-dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="font-awesome-4.7.0/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
  <link href="css/test.css" rel="stylesheet">
      <!-- Angular JS -->
    <script src="js/angular.min.js"></script>
    
    <script type="text/javascript">
    	const app = angular.module("myapp", []);
        app.controller('mycontroller', function ($scope) {
            //This will hide the DIV by default.
            $scope.testdatadiv = true;
            $scope.AddTestDiv = false;
            $scope.viewheading = "Manage Tests";
            $scope.carddiv = true;
            $scope.showTestDiv = function () {
                //If DIV is visible it will be hidden and vice versa.
                $scope.AddTestDiv = true;
                $scope.testdatadiv = false;
                $scope.viewheading = "Add Tests";
                $scope.carddiv = false;
            }
            $scope.goBack = function(){
            	$scope.testdatadiv = true;
            	$scope.AddTestDiv = false;
            	$scope.viewheading = "Manage Tests";
            	$scope.carddiv = true;
            }
       });
    </script>
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top" ng-app="myapp" ng-controller="mycontroller">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.jsp">Exam Viral</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="adminpage.jsp">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">Dashboard</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-user"></i>
            <span class="nav-link-text">Profile</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Tests">
          <a class="nav-link" href="test.jsp">
            <i class="fa fa-fw fa-book"></i>
            <span class="nav-link-text">Test</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Questions">
          <a class="nav-link" href="questions.jsp">
            <i class="fa fa-fw fa-question-circle"></i>
            <span class="nav-link-text">Questions</span>
          </a>
        </li>
        <!-- <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">Components</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="navbar.html">Navbar</a>
            </li>
            <li>
              <a href="cards.html">Cards</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Example Pages">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseExamplePages" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-file"></i>
            <span class="nav-link-text">Pages</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseExamplePages">
            <li>
              <a href="login.jsp">Login Page</a>
            </li>
            <li>
              <a href="reg.jsp">Registration Page</a>
            </li>
            <li>
              <a href="#">Forgot Password Page</a>
            </li>
            <li>
              <a href="#">Blank Page</a>
            </li>
          </ul>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Menu Levels">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-sitemap"></i>
            <span class="nav-link-text">Menu Levels</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseMulti">
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a href="#">Second Level Item</a>
            </li>
            <li>
              <a class="nav-link-collapse collapsed" data-toggle="collapse" href="#collapseMulti2">Third Level</a>
              <ul class="sidenav-third-level collapse" id="collapseMulti2">
                <li>
                  <a href="#">Third Level Item</a>
                </li>
                <li>
                  <a href="#">Third Level Item</a>
                </li>
                <li>
                  <a href="#">Third Level Item</a>
                </li>
              </ul>
            </li>
          </ul>
        </li> -->
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="courses.jsp">
            <i class="fa fa-fw fa-graduation-cap"></i>
            <span class="nav-link-text">Courses</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Link">
          <a class="nav-link" href="#">
            <i class="fa fa-fw fa-users"></i>
            <span class="nav-link-text">User Accounts</span>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <form class="form-inline my-2 my-lg-0 mr-lg-2">
            <div class="input-group">
              <input class="form-control" type="text" placeholder="Search for...">
              <span class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fa fa-search"></i>
                </button>
              </span>
            </div>
          </form>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">My Dashboard</li>
      </ol>
      <!-- Icon Cards-->
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-primary o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fw fa-users"></i>
              </div>
              <div class="mr-5">Total Users <span><%= totalusers %></span></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="#">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-warning o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-book" aria-hidden="true"></i>
              </div>
              <div class="mr-5">Total Tests <span><%= totalRecords %></span></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="test.jsp">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-success o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-question-circle" aria-hidden="true"></i>
              </div>
              <div class="mr-5">Total Questions <span><%= totalquestions%></span></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="questions.jsp">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-3">
          <div class="card text-white bg-danger o-hidden h-100">
            <div class="card-body">
              <div class="card-body-icon">
                <i class="fa fa-fw fa-pie-chart" aria-hidden="true"></i>
              </div>
              <div class="mr-5">Student Results <span><%= totalresults %></span></div>
            </div>
            <a class="card-footer text-white clearfix small z-1" href="#">
              <span class="float-left">View Details</span>
              <span class="float-right">
                <i class="fa fa-angle-right"></i>
              </span>
            </a>
          </div>
        </div>
      </div>
      <div>
      	<h1 class="page-header" ng-model="viewheading">{{viewheading}} </h1>
	    <h2><c:out value="${param.message}"></c:out></h2>
      </div>
      <!-- Example DataTables Card-->
      <div class="card mb-3" ng-show="carddiv">
        <div class="card-header">
          <i class="fa fa-table"></i> List of all tests</div>
        <div class="card-body">
        	
          <div class="table-responsive" ng-show="testdatadiv">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
              <tfoot>
                <tr>
                  <th>Test Id</th>
				  <th>courseId</th>
	              <th>Test Name</th>
	              <th>Test Timing</th>
	              <th>Minimum Marks</th>	              
	              <th>Total Marks</th>
	              <th>Action</th>
                </tr>
              </tfoot>
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
										<td class="addquesbtn"><a href="addquestions.jsp?testName=${testList.testName}">Add Questions </a></td> 
										<td class="deletebtn"><a href="DeleteTest?testName=${testList.testName}">Delete</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
              </tbody>
            </table>
            <button class="orange" ng-click="showTestDiv()">New Test <i class="fas fa-plus"></i></button>
          </div>
        </div>
        <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
      </div>
      <div ng-show="AddTestDiv">
	      	  	
			  	<form class="form-horizontal" action="AddTest" method="post">
					  <div class="form-group">
					    <label for="courseidname" class="col-sm-2 control-label">Course Id and Course Name</label>
					    <div class="col-sm-10">
					      <select class="form-control" name="courseNameDropDown" id="courseidname" required>
									<option >Select Course</option>
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
					      <input type="text" class="form-control" id="testname" name="testName" placeholder="Same as course Name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="testtime" class="col-sm-2 control-label">Test Duration (Minutes)</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="testtime" name="testDuration" placeholder="Enter test duration" required>
					    </div>
					  </div>
					  
						<div class="form-group">
						   <label for="minmarks" class="col-sm-2 control-label">Minimum Marks</label>
						   <div class="col-sm-10">
						      <input type="text" class="form-control" id="minmarks" name="minMarks" placeholder="Enter Minimum Marks" required>
						   </div>
						</div>
						<div class="form-group">
							<label for="maxmarks" class="col-sm-2 control-label">Maximum Marks</label>
							<div class="col-sm-10">
						      <input type="text" class="form-control" id="maxmarks" name="maxMarks" placeholder="Enter Maximum Marks" required>
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
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small><p>&copy; 2018 Brain Mentors Pvt. Ltd, All Rights Reserved | <a href="index.jsp" class="footer-link">Powered by Exam Viral</a></p></small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="logout.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="jquery/jquery-3.2.1.min.js"></script>
    <script src="bootstrap-4.1.1-dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="js/Chart.min.js"></script>
    <script src="datatables/jquery.dataTables.js"></script>
    <script src="datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
</body>

</html>
