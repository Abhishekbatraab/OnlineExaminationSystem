<%@page import="com.bmpl.examviral.quiz.model.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html5>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration Successful</title>
	<link rel="icon" href="images/favicon-16x16.png">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<link href="https://fonts.googleapis.com/css?family=Supermercado+One" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<link rel="stylesheet" href="css/regs.css">
</head>
<body>
	<%-- <%
		UserDTO userdto = (UserDTO)request.getAttribute("userdetails");
		int id = userdto.getId();
		String username = userdto.getUsername();
		String password = userdto.getPassword();
		String email = userdto.getEmail();
		String dateofbirth = userdto.getDateofbirth();
		String address = userdto.getAddress();
		String institutename = userdto.getInstitutename();
	%> --%>
	<c:set var="id" value="${requestScope.userdetails.id}"></c:set>
	<c:set var="username" value="${requestScope.userdetails.username}"></c:set>
	<c:set var="email" value="${requestScope.userdetails.email}"></c:set>
	<c:set var="dateofbirth" value="${requestScope.userdetails.dateofbirth}"></c:set>
	<c:set var="password" value="${requestScope.userdetails.password}"></c:set>
	<c:set var="address" value="${requestScope.userdetails.address}"></c:set>
	<c:set var="institutename" value="${requestScope.userdetails.institutename}"></c:set>
		
	<div class="box">
        <img src="images/green.png" alt="">   
        <h1>Congratulations <c:out value="${username}"></c:out>!</h1>
        <h2>You have successfully registered on our web site</h2>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">Your Registration Information</h3>
            </div>
            <div class="panel-body">
  				<p>Registration id : <span> <c:out value="${id}"></c:out></span></p>          
                <p>Email : <span><c:out value="${email}"></c:out></span></p>
                <p>Password : <span><c:out value="${password}"></c:out></span></p>
                <p>Date Of birth : <span><c:out value="${dateofbirth}"></c:out></span></p>
                <p>Address : <span><c:out value="${address}"></c:out></span></p>
                <p>Institute Name : <span><c:out value="${institutename}"></c:out></span></p>
            </div>
        </div>
        <a href="index.jsp" class="btn btn-primary">Home</a>
        <a href="login.jsp" class="btn btn-primary lgbtn" role="button">Login</a>
   </div>
	
</body>
</html>