<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html5>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="favicon-16x16.png">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Exam Viral | Admin Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="css/adminlogin.css" rel="stylesheet">

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
		        <li><a href="login.jsp">Student Login</a></li>
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

    <div class="container">

      <form class="form-signin" action="Login?role=admin" method="post">
        <h2 class="form-signin-heading">Admin Login Details</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
       	<a>Forgot Password?</a>        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <span class="badge badge-warning errormsg" id="errMsgDiv"><c:out value="${param.errorMessage}"></c:out></span>
      </form>

    </div> <!-- /container -->

  </body>
</html>
