<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.CourseDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.UserDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.CourseDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Page</title>
<link rel="icon" href="images/favicon-16x16.png">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/home.css" />
<script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
</head>
<body>
	<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	CourseDAO coursedao = new CourseDAO();
	UserDAO userdao = new UserDAO();
	UserDTO userdto = new UserDTO();
	ArrayList<CourseDTO> courselist = coursedao.readCourse();
	//UserDTO userdto = (UserDTO)request.getAttribute("userdto");
	String email = (String)session.getAttribute("email");
	userdto = userdao.getSpecificRecord(email);
	String institutename = userdto.getInstitutename();
	System.out.println("Institute name in home page is "+institutename);
	request.setAttribute("institutename", institutename);
	System.out.println("Username is "+userdto.getUsername());
	if(courselist.size()>0){
		request.setAttribute("courseList", courselist);
	}
	else{
		System.out.println("No course Found");
	}
	
	%>
	<c:set var="email" value="${sessionScope.email}"></c:set>
	<c:if test="${empty email}">
    	<c:set var="useremail" scope="request" value="/logout.jsp"/>
  	</c:if>
  	<c:set var="username" value="${sessionScope.username}"></c:set>
  	<nav class="navbar navbar-default navbar-fixed-top">
		    <div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="index.jsp"><i class="fas fa-book"></i> <i class="fas fa-graduation-cap"></i> Exam Viral</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li class="active"><a href="#">Home</a>
		      	<li><a href="#">About</a>
		        <li><a href="#">Contact</a>
		        <li><a href="reg.jsp">Sign Up <i class="fas fa-user-plus"></i></a>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		         	 <li><a href="login.jsp">Student Login</a></li>
		            <li><a href="#">Admin Login</a></li>
		          </ul>
		        </li>
		  	  </ul>		      
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		<div class="container">
            <p id="status">
                <span id="newspan">Logged as</span> 
                <span class="label label-success"><i class="fas fa-user"></i><c:out value="${email}" ></c:out></span>
                <a class="btn btn-info" href="logout.jsp">Log Out <i class="fas fa-sign-out-alt"></i></a>
            </p>
            <div class="row">
	            <div class="col-lg-4 col-sm-6"> 	
		                <c:forEach var="courseList" items="${requestScope.courseList}">
		            		
		            			<p><c:out value="${courseList.title}"/></p>
	                   			<a href="/OnlineTestProject/Exam?testName=<c:out value="${courseList.title}"/>&instituteName=<c:out value="${requestScope.institutename}"/>" class="thumbnail" id="java">
	                        	<img src="<c:out value="${courseList.imagePath}"/>" class="img-responsive">
	                    		</a>
	                		
		                </c:forEach>
		         </div>    	 
            </div>
            
		</div>
		<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="js/home.js"></script>
		
</body>
</html>