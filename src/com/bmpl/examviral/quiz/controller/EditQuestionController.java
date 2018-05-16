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
 * Servlet implementation class EditQuestionController
 */
@WebServlet("/EditQuestion")
public class EditQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionDAO quesdao = new QuestionDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQuestionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int quesNo = Integer.parseInt(request.getParameter("quesNo"));
		String testName= request.getParameter("testName");
		String question = request.getParameter("quesName");
		String optionA = request.getParameter("optionA");
		String optionB = request.getParameter("optionB");
		String optionC = request.getParameter("optionC");
		String optionD = request.getParameter("optionD");
		String correctAnswer = request.getParameter("options");
		QuestionDTO quesdto = new QuestionDTO();
		quesdto.setTestName(testName);
		quesdto.setQuesNo(quesNo);
		quesdto.setQuestion(question);
		quesdto.setOptionA(optionA);
		quesdto.setOptionB(optionB);
		quesdto.setOptionC(optionC);
		quesdto.setOptionD(optionD);
		quesdto.setCorrectAnswer(correctAnswer);
		int result = quesdao.updateSpecificQuestion(quesdto);
		if(result>0){
			response.sendRedirect("editQuestions.jsp?quesNo="+quesdto.getQuesNo()+"&message= Question no."+quesdto.getQuesNo()+" Successfully edited&testName="+quesdto.getTestName());
		}
		else{
			response.sendRedirect("editQuestions.jsp?quesNo="+quesdto.getQuesNo()+"&message= No Questions edited");
		}
	}

}
