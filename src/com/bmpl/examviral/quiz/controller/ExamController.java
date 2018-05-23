package com.bmpl.examviral.quiz.controller;

import java.io.IOException;
import java.sql.SQLException;
//import java.util.ArrayList;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dao.TestDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;
import com.bmpl.examviral.quiz.model.dto.TestDTO;
/*import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;
*/import com.bmpl.examviral.quiz.model.dto.UserDTO;

/**
 * Servlet implementation class ExamController
 */
@WebServlet("/Exam")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TestDTO testdto = new TestDTO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamController() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    	// TODO Auto-generated method stub
    	/*doGet(req,resp);*/
    	HttpSession session = req.getSession();
    	UserDTO userdetails = (UserDTO)session.getAttribute("userdetails");
    	//UserDTO userdetails = (UserDTO)req.getAttribute("userdetails");
    	String testName = req.getParameter("testName");
    	//String institutename = req.getParameter("instituteName");
    	String institutename = userdetails.getInstitutename();
    	System.out.println("Institute name in examcontroller is "+institutename);
    	//HttpSession session = req.getSession(true);
    	String emailId = userdetails.getEmail();
    	//session.setAttribute("email", emailId);
    	System.out.println("Email id is "+emailId);
    	String username = userdetails.getUsername();
    	UserDTO userdto = new UserDTO();
	    QuestionDAO quesdao = new QuestionDAO();
	    userdto.setEmail(emailId);
	    userdto.setUsername(username);
	    userdto.setInstitutename(institutename);
	    /*
	     * Get test details to show on test screen's first page
	     */
	    TestDAO testdao = new TestDAO();
	    try {
			testdto = testdao.getSpecificTestData(testName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    ArrayList<QuestionDTO> questionList = quesdao.getQuestions(testName);
		req.setAttribute("questionList", questionList);
	    req.setAttribute("userdetails", userdto);
	    req.setAttribute("testData", testdto);
	    req.setAttribute("testName", testName);
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam.jsp");
	    dispatcher.forward(req, resp);
    	
    }
    

}
