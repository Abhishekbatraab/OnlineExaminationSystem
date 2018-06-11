package com.bmpl.examviral.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.UserDAO;

/**
 * Servlet implementation class DeleteUserController
 */
@WebServlet("/DeleteUser")
public class DeleteUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userdao = new UserDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int userId = Integer.parseInt(request.getParameter("userId"));
		int result = userdao.deleteUser(userId);
		if(result>=1){
			String message = result+" course deleted";
			response.sendRedirect("adminpage.jsp?message="+message);
		}
	}

}
