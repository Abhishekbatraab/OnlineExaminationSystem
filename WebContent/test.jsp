<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bmpl.examviral.quiz.model.dto.TestDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.TestDAO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dto.CourseDTO" %>
<%@ page import="com.bmpl.examviral.quiz.model.dao.CourseDAO" %>
<%@ page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	TestDAO testdao = new TestDAO();
	TestDTO testdto = new TestDTO();
	CourseDAO coursedao = new CourseDAO();
	ArrayList<CourseDTO> courseNameList = coursedao.getCourseNameList();
	ArrayList<TestDTO> testlist = testdao.readTestData();

	if(testlist.size()==0||courseNameList.size()==0){
		System.out.println("No Record Found");
		String message = "No record Found";
		request.setAttribute("message", message);
	}
	else{
		request.setAttribute("testlist", testlist);
		request.setAttribute("coursenamelist", courseNameList);
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Total Test</h1>
	<div>
		<form action="" method="post">
			<table>
				<tr>
					<td><label>Course Name</label></td>
					<td>
						<select name="courseDropDown">
							<option>Select</option>
							<c:forEach var="courseNameList" items="${requestScope.coursenamelist}">
								<option value="${courseNameList.title}">
									<c:out value="${courseNameList.title}"></c:out>
								</option>
							</c:forEach>	
						</select>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div ng-show="testdatadiv">
	       		<h1 ng-model="viewHeading">View Tests</h1>
	       		<div class="table-responsive">
	            <table id="example" class="table table-striped table-bordered" style="width:100%">
	              <thead>
	                <tr>
	                  <th>Test Id</th>
	                  <th>courseId</th>
	                  <th>Test Name</th>
	                  <th>Test Timing</th>
	                  <th>Minimum Marks</th>	              
	                  <th>Total Marks</th>
	                </tr>
	              </thead>
	              
	              <tbody> 
	              <tr><c:out value="${requestScope.message}"></c:out></tr>  	
	              	
	                <c:forEach var="testList" items="${requestScope.testlist}">
	                	 
	                	<tr>
							<td><c:out value="${testList.testId }"/></td>
							<td><c:out value="${testList.courseId}"/></td>
							<td><c:out value="${testList.testName}"/></td>
							<td><c:out value="${testList.minMarks}"/></td>
							<td><c:out value="${testList.totalMarks}"/></td>
							<td>
								<table>
									<tr>
										<td class="editbtn"><a>Edit</a></td>
										<td class="deletebtn"><a>Delete</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</c:forEach>
	             </tbody>
	            </table>
	       </div>
</body>
</html>