package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.CourseDAO;
import com.bmpl.examviral.quiz.model.dao.TestDAO;
import com.bmpl.examviral.quiz.model.dto.TestDTO;

/**
 * Servlet implementation class ViewTestController
 */
@WebServlet("/AddTest")
public class AddTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseDAO coursedao = new CourseDAO();
    TestDAO testdao = new TestDAO();
    TestDTO testdto = new TestDTO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	int courseId = Integer.parseInt(request.getParameter("courseNameDropDown"));
    	String testName = request.getParameter("testName");
    	int testDuration = Integer.parseInt(request.getParameter("testDuration"));
    	int minMarks = Integer.parseInt(request.getParameter("minMarks"));
    	int maxMarks = Integer.parseInt(request.getParameter("maxMarks"));
    	testdto.setCourseId(courseId);
    	testdto.setTestName(testName);
    	testdto.setTestDuration(testDuration);
    	testdto.setMinMarks(minMarks);
    	testdto.setTotalMarks(maxMarks);
    	int noOfCourseAdded = testdao.addTest(testdto);
    	int testId = testdao.fetchTestId(testdto.getTestName());
    	System.out.println("No of test Added : "+noOfCourseAdded);
    	if(noOfCourseAdded>0){
    		response.sendRedirect("test.jsp?testId="+testId+"&success=new");
    	}
    	else{
    		System.out.println("No test add");
    	}
    	
    	
    }

}
