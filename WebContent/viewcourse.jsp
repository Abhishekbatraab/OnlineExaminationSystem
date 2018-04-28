<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="coursedto" value= "${requestScope.courseInfo}"/>
	<c:set var="title" value="${coursedto.details}"></c:set>
	<c:set var="imagePath" value= "${coursedto.imagePath}"/>
	<c:set var="details" value="${coursedto.details}"></c:set>
	
	
	<h1><c:out value="${request.message}"/></h1>
	<img src="<c:out value="${imagePath}"/>"></img>
	<h2>Course Title is <c:out value="${title}"/> </h2>
	<h2>Course Details</h2>
	<p><c:out value="${details}"/></p>	
</body>
</html>