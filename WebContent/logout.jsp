<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logout Page</title>
<link rel="icon" href="images/favicon-16x16.png">
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/logout.js"></script>
</head>
<body>
	<%
		request.getSession().invalidate();
		response.sendRedirect("index.jsp");	
	%>	
	<h1><c:out value="You logged out successfully"></c:out></h1>
	<a href="index.jsp" class="btn btn-primary">Home</a>
</body>
</html>