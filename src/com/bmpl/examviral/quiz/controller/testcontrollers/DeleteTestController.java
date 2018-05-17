package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dao.TestDAO;

/**
 * Servlet implementation class DeleteTestController
 */
@WebServlet("/DeleteTest")
public class DeleteTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TestDAO testdao = new TestDAO();
	QuestionDAO quesdao = new QuestionDAO();
	int result = 0;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletRes
	 * ponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String testName = request.getParameter("testName");
		result = testdao.deleteTest(testName);
		int testDel = quesdao.deleteSpecificQuestion(testName);
		System.out.println("value of test"+testDel);
		if(result>0||testDel>0){
			System.out.println("Test Deleted");
			String message = testName+" Test and its questions successfully deleted";
			response.sendRedirect("test.jsp?message="+message);
		}
		
	}

}
