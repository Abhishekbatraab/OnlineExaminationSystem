package com.bmpl.examviral.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;

/**
 * Servlet implementation class AddQuestionsController
 */
@WebServlet("/AddQuestions")
public class AddQuestionsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestionsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String testname = request.getParameter("testname");
		String quesName = request.getParameter("quesName");
		String optionA = request.getParameter("optionA");
		String optionB = request.getParameter("optionB");
		String optionC = request.getParameter("optionC");
		String optionD = request.getParameter("optionD");
		String correctAnswer = request.getParameter("options");
		QuestionDTO quesdto = new QuestionDTO();
		quesdto.setQuestion(quesName);
		quesdto.setOptionA(optionA);
		quesdto.setOptionB(optionB);
		quesdto.setOptionC(optionC);
		quesdto.setOptionD(optionD);
		quesdto.setCorrectAnswer(correctAnswer);
		QuestionDAO quesdao = new QuestionDAO();
		int noofrows = quesdao.addQuestions(quesdto, testname);
		if(noofrows>0){
			response.sendRedirect("questions.jsp?message="+noofrows+" Question(s) added&testname="+testname);
		}else{
			response.sendRedirect("questions.jsp?message=No questions added&testname="+testname);
		}
		
	}

}
