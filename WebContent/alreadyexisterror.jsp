<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		String email = (String)request.getAttribute("userEmail");
	%> --%>
	<c:catch>
		<c:out value="${requestScope.userEmail}"></c:out>
		<c:out value=" User Already Exist"></c:out>
	</c:catch>
	
	
</body>
</html>