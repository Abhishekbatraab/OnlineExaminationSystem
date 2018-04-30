<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
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

    <title>Dashboard</title>

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
            <li><a href="#">Dashboard</a></li>
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
            <li class="active"><a href="#">Dashboard<span class="sr-only">(current)</span></a></li>
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
          <h1 class="page-header">Admin <%= user %>  Dashboard</h1>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="images/CourseImages/java_logo.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Java</h4>
              <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
 					 More>>
			   </a>
			  <div class="collapse" id="collapseExample">
				  <div class="well">
					    About Java
				  </div>
			   </div>
              <!-- <span class="text-muted">Something else</span> -->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="images/CourseImages/css3.png" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>CSS3</h4>
              <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample1" aria-expanded="false" aria-controls="collapseExample">
 					 More>>
			   </a>
			  <div class="collapse" id="collapseExample1">
				  <div class="well">
					    About CSS3
				  </div>
			   </div>
              <!-- <span class="text-muted">Something else</span> -->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="images/CourseImages/c.jpeg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>C++</h4>
              <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample2" aria-expanded="false" aria-controls="collapseExample">
 					 More>>
			   </a>
			  <div class="collapse" id="collapseExample2">
				  <div class="well">
					    About c++ 
				  </div>
			   </div>
              <!-- <span class="text-muted">Something else</span> -->
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="images/CourseImages/php.jpeg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>PHP</h4>
              <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample3" aria-expanded="false" aria-controls="collapseExample">
 					 More>>
			   </a>
			  <div class="collapse" id="collapseExample3">
				  <div class="well">
					    About PHP
				  </div>
			   </div>
              <!-- <span class="text-muted">Something else</span> -->
            </div>
          </div>

          <h2 class="sub-header">List of All Registered Students</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Username</th>
                  <th>Password</th>
                  <th>Email</th>
                  <th>Date of birth</th>
                  <th>Gender</th>
                  <th>Address</th>
                  <th>Institute Name</th>
                  <th>Registration Date</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="userlist" items="${sessionScope.userList}">
					<tr>
						<td><c:out value="${userlist.id}"/></td>
						<td><c:out value="${userlist.username}"/></td>
						<td><c:out value="${userlist.password}"/></td>
						<td><c:out value="${userlist.email}"/></td>
						<td><c:out value="${userlist.dateofbirth}"/></td>
						<td><c:out value="${userlist.gender}"/></td>
						<td><c:out value="${userlist.address}"/></td>
						<td><c:out value="${userlist.institutename}"/></td>
						<td><c:out value="${userlist.registerdate}"/></td>
					</tr>
				</c:forEach>
                </tbody>
            </table>
          </div>
          <%-- <h2 class="sub-header">List of Courses</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Username</th>
                  <th>Password</th>
                  <th>Email</th>
                  <th>Date of birth</th>
                  <th>Gender</th>
                  <th>Address</th>
                  <th>Institute Name</th>
                  <th>Registration Date</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="courselist" items="${sessionScope.courselist}">
	                	<tr>
							<td><c:out value="${courselist.subId}"/></td>
							<td><img src="<c:out value="${courselist.imagePath}"/></img>"></td>
							<td><c:out value="${courselist.title}"/></td>
							<td><c:out value="${courselist.details}"/></td>
							<td><c:out value="${courselist.register_date}"/></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>
          </div> --%>
          
        </div>
      </div>
    </div><!--Container-fluid division end -->
    <!-- <div class="row courseDiv">
    	<div class="col-lg-6 partition1">   	        
    	    <div class="courseDetails">
    	        <label for="courseName">Course:</label>
    	        Split button
                <div class="btn-group">
                  <button type="button" class="btn btn-info">Add Course to list</button>
                  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                  </button>
                  <form method="post">	
                  <select class="dropdown-menu" name="courseName" multiple required>
                    <option value="0" selected>Select Course</option>
    	            <option value="1">C</option>
    	            <option value="2">C++</option>
    	            <option value="3">C#</option>
    	            <option value="4">HTML5</option>
    	            <option value="5">JAVA</option>
    	            <option value="6">JavaScript</option>
    	            <option value="7">Kotlin</option>
    	            <option value="8">php</option>
    	            <option value="9">css3</option>
    	            <option value="10">Asp.net</option>
                  </select>
              	  <input type="submit" value="Add subjects">               
                </form>
                
                </div>
                <div>
                <form action="FileUploadHandler" method="post" enctype="multipart/form-data">
                	<label>Browse File: </label>
                	<input name="file" type="file" />
                	<input value="upload" type="submit">
                </form>
                </div>
                <table border="1">
                    <thead>
                       <tr>
                            <th>Id</th>
                            <th>Title</th>
                            <th>Details</th>
                            <th>Register Date</th>
                       </tr>                 
                    </thead>
                    <tbody>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>	
                    </tbody>
                </table>
    	    </div>
    	</div>
    	<div class="col-lg-6 partition2">
    	
    	</div> -->
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
