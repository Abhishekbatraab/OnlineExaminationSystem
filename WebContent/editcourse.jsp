<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.CourseDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.CourseDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	} */
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

    <title>OES | Edit Courses</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="css/adminpage.css"rel="stylesheet"></link>
    <!-- <script src="js/angular.min.js"></script> -->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

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
            <li><a href="#">Test</a></li>
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
          <h1 class="page-header">Edit Courses</h1>
			<% 
		CourseDTO coursedto = new CourseDTO();
		CourseDAO coursedao = new CourseDAO();
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		System.out.println("Course id from url is "+courseId);
		CourseDTO courserecord = coursedao.getSpecificRecord(courseId);
		request.setAttribute("courserecord", courserecord);
		System.out.println("Course record in jsp file"+courserecord);
	%>
	<form action="EditCourse?courseId=${courserecord.getcourseId()}" method="post" enctype="multipart/form-data" class="form-signin formcontent" >
	    <table>
	    	 <tr>
		     	<td><label for="ImageUpload">Browse Image:</label></td>
		     	<td><input type="file" value="Browse...." name="uploadimage"/></td>
		     </tr>
	         <tr>
		     	<td><label for="datalist">Title:</label></td>
		        <td><input id="text" value="<c:out value='${courserecord.getTitle()}'/>" name="coursetitle"></td>
		        
	        </tr>
			<tr>
		        <td><label for="title">Details:</label></td>
		        <td><textarea class="textareadetails" name="coursedetails" id="title" cols="50px" rows="4" ><c:out value="${courserecord.getDetails()}"></c:out></textarea></td></tr>
	        <tr>
				<td></td>
	            <td>
	            	<div class="checkbox">
	                	<input type="submit" name="submit" class="button" value="Update Course" />
	                </div>
				</td>
		 	</tr>
	      </table>
	 </form>
	 <h1><c:out value="${param.message}"></c:out></h1>
          
          
          
        </div>
      </div>
    </div><!--Container-fluid division end -->
    
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



	