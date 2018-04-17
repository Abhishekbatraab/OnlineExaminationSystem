<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<link rel="icon" href="images/favicon-16x16.png">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/login.css">
<link href="https://fonts.googleapis.com/css?family=Supermercado+One" rel="stylesheet">
<script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
<script type="text/javascript" src="js/showErrMsg.js"></script>
</head>
<body>
	<%
		String errormessage = (String)request.getAttribute("errorMessage");
	%>
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
		      <a class="navbar-brand" href="index.jsp"><img src="images/logo.jpg"/></a>
		      <a class="navbar-brand" href="index.jsp"><span> Exam Viral</span></a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		      	<li class="active"><a href="index.jsp">Home</a>
		        <!-- <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		         	<li><a href="login.jsp">Student Login</a></li>
		            
		          </ul>
		        </li> -->
		        <!-- <li><a href="reg.jsp">Sign Up <i class="fas fa-user-plus"></i></a> -->
		        <li><a href="about.jsp">About</a>
		        <li><a href="contact.jsp">Contact</a>
		        <li><a href="adminLogin.jsp">Admin Login</a></li>
		      </ul>
		      <!-- <form class="navbar-form navbar-right">
		        <div class="form-group">
		          <input type="text" class="form-control" placeholder="Search by Student Id">
		        </div>
		        <button type="submit" class="btn btn-default">Submit</button>
		      </form> -->
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	<div class="col-sm-4">
            
        </div>
        <div class="col-sm-4 ip">
        	<form action="Login?role=student" method="post">
            <h1>Student Login Details</h1>
            <div class="input-group uname">
                <span class="input-group-addon">
                    <i class="fa fa-user-circle"></i>
                </span>
                <input type="text" class="form-control" name="email" placeholder="Enter your Email Id" required>
            </div><br>
            <div class="input-group pwd">
                <span class="input-group-addon">
                    <i class="fa fa-key"></i>
                </span>
                <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
            </div>
            <button class="btn btn-primary btn-lg btn-block loginBtn" id="lgBtn" type="submit">Login</button>
            <span class="badge badge-warning errormsg" id="errMsgDiv"><%= errormessage %></span>
            </form>
        </div>
        <div class="col-sm-4">
            
        </div>
        <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	    
	    
	    
</body>
</html>