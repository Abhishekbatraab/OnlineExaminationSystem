package com.bmpl.examviral.quiz.controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.bmpl.examviral.quiz.model.dao.UserDAO;
import com.bmpl.examviral.quiz.model.dto.UserDTO;

/**
 * Servlet implementation class RegisterationController
 */
@WebServlet("/Registration")
public class RegisterationController extends HttpServlet{
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterationController() {
        super();
      // counter++;
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = 0;
		System.out.println("default id is "+id);
		String username = request.getParameter("user");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String dateofbirth = request.getParameter("dob");
		String address = request.getParameter("address");
		String institutename = request.getParameter("institutename");
		UserDTO userdto = new UserDTO();
		userdto.setEmail(email);
		userdto.setUsername(username);
		userdto.setPassword(password);
		userdto.setGender(gender);
		userdto.setDateofbirth(dateofbirth);
		userdto.setAddress(address);
		userdto.setInstitutename(institutename);
		UserDAO userdao = new UserDAO();
		try {
			boolean doesUserExist = userdao.doesUserExist(userdto);
			if(doesUserExist){
				System.out.println("user email already exist, please enter a different email");
				request.setAttribute("userEmail", email);
				RequestDispatcher rd = request.getRequestDispatcher("alreadyexisterror.jsp");
				rd.forward(request, response);
			}
			else{
				userdto.setRoleName("student");
				userdao.addUser(userdto);
				userdao.insertUserLogin(userdto);
				int userId = userdao.takeUserId(userdto);
				userdto.setId(userId);
				request.setAttribute("userdetails", userdto);
				RequestDispatcher rd = request.getRequestDispatcher("regSuccess.jsp");
				rd.forward(request, response);				
			}
		} catch (ClassNotFoundException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
