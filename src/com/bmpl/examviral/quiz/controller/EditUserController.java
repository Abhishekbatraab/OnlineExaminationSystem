package com.bmpl.examviral.quiz.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.commonutils.MD5Secure;
import com.bmpl.examviral.quiz.model.dao.UserDAO;
import com.bmpl.examviral.quiz.model.dto.UserDTO;

/**
 * Servlet implementation class EditUserController
 */
@WebServlet("/EditUser")
public class EditUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userdao = new UserDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			int userId = Integer.parseInt(request.getParameter("userId"));
			System.out.println("User id in edit user controller is "+userId);
			String username = request.getParameter("user");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			password=MD5Secure.convertToHash(password);
			String gender = request.getParameter("gender");
			String dateofbirth = request.getParameter("dob");
			String address = request.getParameter("address");
			String institutename = request.getParameter("institutename");
			UserDTO userdto = new UserDTO();
			userdto.setId(userId);
			userdto.setEmail(email);
			userdto.setUsername(username);
			userdto.setPassword(password);
			userdto.setGender(gender);
			userdto.setDateofbirth(dateofbirth);
			userdto.setAddress(address);
			userdto.setInstitutename(institutename);
			int result = userdao.updateSpecificRecord(userdto);
			System.out.println("Result is "+result);			
			if(result>=1){
				System.out.println("User Updated successfully");
				String message = result + " records updated successfully";
				response.sendRedirect("editusers.jsp?userId="+userdto.getId()+"&message="+message);
				
			}
			else{
				System.out.println("User Not updated");
				String message="user not updated!";
				request.setAttribute("message", message);
				response.sendRedirect("editusers.jsp?userId="+userdto.getId()+"&message="+message);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Some error");
		}
	}

}
