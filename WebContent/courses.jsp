<%@page import="com.bmpl.examviral.quiz.model.dao.CourseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.CourseDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.CourseDAO" %>
<%@ page import="java.util.ArrayList"%>
<%
	/* response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
	response.setDateHeader("Expires", 0);
	response.setHeader("Pragma", "no-cache");
	String user = null;
	if(session.getAttribute("username") == null || session.getAttribute("role") == null){
		response.sendRedirect("index.jsp");
	}
	else{ 
		String role= (String)session.getAttribute("role");
		if(role!="admin"){
			response.sendRedirect("index.jsp");
		}
		else{
			user = (String) session.getAttribute("username");			
		}
	}	 */
	CourseDAO coursedao = new CourseDAO();
	ArrayList<CourseDTO> courselist =  coursedao.readCourse();
	if(courselist.size()>0){
		request.setAttribute("courselist", courselist);
		request.setAttribute("message", "");
		//System.out.println("List of courses"+courselist);
	}
	else{
		request.setAttribute("message", "No records found");
	}
	//System.out.println("Courselist is "+courselist);
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
    <link rel="icon" href="./favicon-16x16.png">
    <title>Courses</title>
	
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="css/addcourse.css">
    <!-- Data tables css -->
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css"></link>
    <!-- Angular JS -->
    <script src="js/angular.min.js"></script>
    
    
    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    	const app = angular.module("myapp", []);
        app.controller('mycontroller', function ($scope) {
            //This will hide the DIV by default.
            $scope.IsVisible = false;
            $scope.viewcoursevisible = true;
            $scope.viewHeading = "List of Courses";
            $scope.ShowHide = function () {
                //If DIV is visible it will be hidden and vice versa.
                $scope.IsVisible = true;
                $scope.viewcoursevisible = false;
                
            }
            $scope.ShowHideView = function(){
            	//If DIV is visible it will be hidden and vice versa.
            	$scope.viewHeading = "View Courses";
                $scope.viewcoursevisible = true;
            	$scope.IsVisible = false;
            	
            }            
       });
    </script>
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
            <li><a href="adminpage.jsp">Dashboard<span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="courses.jsp">Course Details</a></li>
            <li><a href="javascript:void(0);" ng-click="ShowHideView()">View Courses</a></li>
            <li><a href="javascript:void(0);" ng-click="ShowHide()">Add Courses</a></li>
          	<li><a href="#">Questions</a></li>
            <li><a href="#">User Accounts</a></li>
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
          <h1 class="page-header bgcourse">Manage Courses</h1>
          <h1><c:out value="${param.message}"/></h1>
          <!-- <input type="checkbox" ng-init="showhide=false" ng-model="showhide"/> -->
          <div ng-show="IsVisible">
          	  <h1>Add Course</h1>
	          <form action="AddCourse" method="post" enctype="multipart/form-data" class="form-signin formcontent" >
	            	<table>
	            		<tr>
		            		<td><label for="ImageUpload">Browse Image:</label></td>
		        			<td><input type="file" value="Browse...." name="uploadimage"/></td></tr>
	        			<tr>
		            		<td><label for="datalist">Title:</label></td>
		        			<td><input id="text" name="coursetitle"/></td>
	        			</tr>
						<tr>
		            		<td><label for="title">Details:</label></td>
		        			<td><textarea class="textareadetails" name="coursedetails" id="title" cols="50px" rows="4"></textarea></td></tr>
	                	<tr>
	                      <td></td>
	                      <td>
	                           <div class="checkbox">
	                                <input type="submit" name="submit" class="button" value="Add Course" />
	                           </div>
	                      </td>
	                	</tr>
	              </table>
	         </form>
	         
	       </div>
	       <div ng-show="viewcoursevisible">
	       		<h1 ng-model="viewHeading">{{viewHeading}}</h1>
	       		<div class="table-responsive">
	            <table id="example" class="table table-striped table-bordered" style="width:100%">
	              <thead>
	                <tr>
	                  <th>CourseId</th>
	                  <th>Image</th>
	                  <th>Title</th>
	                  <th>Details</th>
	                  <th>Register Date</th>	              
	                  <th>Action</th>
	                </tr>
	              </thead>
	              
	              <tbody> 
	              <tr><c:out value="${requestScope.message}"></c:out></tr>  	
	              	
	                <c:forEach var="courseList" items="${requestScope.courselist}">
	                	 
	                	<tr>
							<td><c:out value="${courseList.courseId }"/></td>
							<td><img src="<c:out value="${courseList.imagePath}"/>"></img></td>
							<td><c:out value="${courseList.title}"/></td>
							<td><c:out value="${courseList.details}"/></td>
							<td><c:out value="${courseList.register_date}"/></td>
							<td>
								<table>
									<tr>
										<td class="editbtn"><a href="editcourse.jsp?courseId=${courseList.courseId}">Edit</a></td>
										<td class="deletebtn"><a href="DeleteCourse?courseId=${courseList.courseId}">Delete</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
	             </tbody>
	            </table>
	       </div>
	       </div> 
        </div>
        	         

          
    </div><!--Container-fluid division end -->
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="./js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="./js/holder.min.js"></script>
    <!-- Data Table JS -->
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/datatable.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
   
    
  </body>
</html>
