package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmpl.examviral.quiz.model.dto.QuestionDTO;
import com.bmpl.examviral.quiz.model.dto.TestDTO;
import com.bmpl.examviral.quiz.model.dto.UserDTO;
/**
 * Servlet implementation class TestScreenController
 */
@WebServlet("/TestScreen")
public class TestScreenController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestScreenController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			ArrayList<QuestionDTO> questionlist = (ArrayList<QuestionDTO>)session.getAttribute("questionList");
			UserDTO userdto = (UserDTO)session.getAttribute("userdetails");
			TestDTO testdto = (TestDTO)session.getAttribute("testdetails");
			System.out.println("Email is "+userdto.getEmail());
			String testName = request.getParameter("testName");
			int testDuration = (Integer)session.getAttribute("testDuration");
			System.out.println("Test name is "+testName);
			//session.setAttribute("email", userdto.getEmail());
			request.setAttribute("userdetails", userdto);
			request.setAttribute("testDetails", testdto);
			request.setAttribute("testName", testName);
			request.setAttribute("testDuration", testDuration);
			request.setAttribute("questionList", questionlist);
			RequestDispatcher rd = request.getRequestDispatcher("testscreen.jsp");
			rd.forward(request, response);
			
	}
		//int dataSize = questionlist.size();
	

}
