package com.bmpl.examviral.quiz.controller;

import java.io.IOException;
//import java.util.ArrayList;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;
/*import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;
*/import com.bmpl.examviral.quiz.model.dto.UserDTO;

/**
 * Servlet implementation class ExamController
 */
@WebServlet("/Exam")
public class ExamController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExamController() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	/*doGet(req,resp);*/
    	String testName = req.getParameter("testName");
    	String institutename = req.getParameter("instituteName");
    	System.out.println("Institute name in examcontroller is "+institutename);
    	String emailId = req.getParameter("emailId");
    	String username = req.getParameter("username");
    	UserDTO userdto = new UserDTO();
    	QuestionDAO quesdao = new QuestionDAO();
    	userdto.setEmail(emailId);
    	userdto.setUsername(username);
    	userdto.setInstitutename(institutename);
    	//ArrayList<QuestionDTO> quizQuesList = quesdao.getTestData(testName);
    	//req.setAttribute("quizQuesList", quizQuesList);
    	ArrayList<QuestionDTO> questionList = quesdao.getQuestions(testName);
		req.setAttribute("questionList", questionList);
    	req.setAttribute("userdetails", userdto);   
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/exam.jsp");
    	dispatcher.forward(req, resp);    	
    }
    

}
