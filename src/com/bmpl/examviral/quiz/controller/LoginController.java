package com.bmpl.examviral.quiz.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmpl.examviral.quiz.commonutils.MD5Secure;
import com.bmpl.examviral.quiz.model.dao.LoginDAO;
import com.bmpl.examviral.quiz.model.dao.UserDAO;
import com.bmpl.examviral.quiz.model.dto.LoginDTO;
import com.bmpl.examviral.quiz.model.dto.UserDTO;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class LoginController extends HttpServlet implements LoginDAO {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @SuppressWarnings("unused")
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	String email = req.getParameter("email");
    	String password = req.getParameter("password");
    	password = MD5Secure.convertToHash(password);
    	String rolename = req.getParameter("role");
    	LoginDTO logindto = new LoginDTO();
    	logindto.setEmail(email);
    	logindto.setPassword(password);
    	logindto.setRole(rolename);
    	UserDAO userdao = new UserDAO();
    	UserDTO userdto = new UserDTO();
    	userdto.setEmail(email);
    	String username = userdao.takeUserName(userdto);
    	try {
    			String role = LoginDAO.authenticateUser(logindto);
    			System.out.println("Role is "+role);
    			logindto.setRole(role);
				int doLogin = LoginDAO.doLogin(logindto);
				System.out.println("Value of dologin is "+doLogin);
				int flag= doLogin;
				System.out.println(flag);
				if(flag!=0){
					/*
					 ***********Authorization************
					 */
					if(role.equals("student")){
						HttpSession session = req.getSession(true);
						session.setAttribute("email", email);
						session.setAttribute("username", username);
						session.getMaxInactiveInterval();
						if(session!=null || session.getAttribute("email")!=null 
								|| session.getAttribute("username")!=null){
							//System.out.println("Student Login");
							RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
							rd.forward(req, resp);
						}
						else{
							String errorMessage = "Invalid UserName or Password";
							resp.sendRedirect("login.jsp?errorMessage="+errorMessage);
						}
					}else if(role.equals("admin"))
					{
						ArrayList<UserDTO> userList = userdao.readAllRecords();
						/*ArrayList<CourseDTO> courseList = coursedao.readCourse();*/
						System.out.println("User List is "+userList);
						HttpSession session = req.getSession(true);
						session.getMaxInactiveInterval();
						if(session!=null || session.getAttribute("userObject")!=null){
							//System.out.println("Admin Login");
							session.setAttribute("email", email);
							session.setAttribute("role", role);
							session.setAttribute("username", username);
							session.setAttribute("userList", userList);
							RequestDispatcher rd = req.getRequestDispatcher("adminpage.jsp");
							rd.forward(req, resp);
						}
						else{
							String errorMessage = "Invalid UserName or Password";
							resp.sendRedirect("adminLogin.jsp?errorMessage="+errorMessage);
						}
					}
					
				}
				else{
					//System.out.println("Some Error");
					if(role=="student"){
						String errorMessage = "You can't login to admin login screen, please click on Admin Login link";
						resp.sendRedirect("login.jsp?errorMessage="+errorMessage);
					}else if(role=="admin"){
						String errorMessage = "You can't login to student login screen, please click on Student Login link";
						resp.sendRedirect("adminLogin.jsp?errorMessage="+errorMessage);
					}else if(role=="Invalid user credentials"){
						String errorMessage = "Invalid user credentials";
						resp.sendRedirect("login.jsp?errorMessage="+errorMessage);
					}
				}
		}catch(ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Error");
		}
    	
   }

}
