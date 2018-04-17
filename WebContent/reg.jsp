<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html5">
<html>
<head>
	<%-- <%@ include file="header.jsp" %> --%>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Student Registration</title>
	<link rel="icon" href="images/favicon-16x16.png">
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/reg.css" />
</head>
<body>
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
		      	<li class="active"><a href="index.jsp">Home</a>
		      	<li><a href="#">About</a>
		        <li><a href="#">Contact</a>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		         	 <li><a href="login.jsp">Student Login</a></li>
		            <li><a href="#">Admin Login</a></li>
		          </ul>
		        </li>
		        <li><a href="reg.jsp">Sign Up <i class="fas fa-user-plus"></i></a>
		        </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	<!--<img alt="" src="http://pecora.asprs.org/wp-content/uploads/2016/08/Pecora-20-Registration-image.jpg">-->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Register Now</button>

	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
		<form id="regform" method="post" action="Registration">
		  <div class="form-group">
		    <label for="username">User Name</label>
		    <input type="text" class="form-control" id="username" name="user" placeholder="User Name">
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="email">Email address</label>
		    <input type="email" class="form-control" id="email" name="email" placeholder="Email">
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="password">Password</label>
		    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="cnfrmpwd">Confirm Password</label>
		    <input type="password" class="form-control" id="cnfrmpwd" name="cnfrmpwd" placeholder="Enter Confirm Password">
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="usergender">Gender</label><br>
		    Male<input type="radio"  class="radioBtn" id="usergenderM" name="gender" value="male">
		    Female<input type="radio" class="radioBtn" id="usergenderF" name="gender" value="female">
            Other<input type="radio" class="radioBtn" id="usergenderO" name="gender" value="other">
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="dateofbirth">Date of Birth</label>
		    <input type="date" class="form-control" id="dateofbirth" name="dob">
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="useraddress">Address</label>
		    <textarea cols="20" rows="5" id="useraddress" name = "address" placeholder="Enter your Address"></textarea>
		    <span></span>
		  </div>
		  <div class="form-group">
		    <label for="institutename">Institute Name</label>
		    <input type="text" class="form-control" id="institutename" name="institutename" placeholder="Enter your institute name">
		    <span></span>
		  </div>
		  <input type="submit" value="submit" class="btn btn-success" />
		  <input type="reset" value="Reset" class="btn btn-primary"/>
		</form>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
</body>
</html>