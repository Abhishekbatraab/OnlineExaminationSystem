package com.bmpl.examviral.quiz.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.QuestionDAO;

/**
 * Servlet implementation class DeleteQuestionController
 */
@WebServlet("/DeleteQuestion")
public class DeleteQuestionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	QuestionDAO quesdao = new QuestionDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteQuestionController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int quesNo = Integer.parseInt(request.getParameter("quesNo"));
		int result = quesdao.deleteSpecificQuestion(quesNo);
		if(result>0){
			System.out.println("Question Deleted");
			String message = "Question No. "+quesNo +" is Successfully deleted";
			/*request.setAttribute("message", message);*/
			/*RequestDispatcher rd = request.getRequestDispatcher("questions.jsp");
			rd.forward(request, response);*/
			response.sendRedirect("questions.jsp?message="+message);
		}
		else{
			response.sendRedirect("questions.jsp?message=Question not deleted");
		}
	}

}
