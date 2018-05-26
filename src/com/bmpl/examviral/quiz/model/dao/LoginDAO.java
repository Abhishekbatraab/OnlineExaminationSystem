package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bmpl.examviral.quiz.model.dto.LoginDTO;
//import com.bmpl.examviral.quiz.model.dto.UserDTO;


public interface LoginDAO extends ConnectionDAO {
	
	/*
	 * ************AUTHENTICATION*****************
	 * Method for authenticate the user whether it is an admin or student
	 */
	
	public static String authenticateUser(LoginDTO logindto) throws SQLException{
		Connection con = null;
    	ResultSet rs = null;
    	PreparedStatement ps = null;
		String email = logindto.getEmail();
		String password = logindto.getPassword();
		String role = logindto.getRole();
		System.out.println("EMail from Bean is "+ email);
		System.out.println("Password from bean is "+password);
		System.out.println("Role from bean is "+role);
		String emailDB = "";
		String passwordDB = "";
		String roleDB = "";
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select email, password, rolename from userlogin";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				emailDB = rs.getString("email");
				passwordDB = rs.getString("password");
				roleDB = rs.getString("rolename");
				System.out.println("Email frm db is "+emailDB);
				System.out.println("pwd frm db is "+passwordDB);
				System.out.println("role frm db is "+roleDB);
				if(email.equals(emailDB)&&password.equals(passwordDB)&&role.equals("admin"))
					return "admin";
				if(email.equals(emailDB)&&password.equals(passwordDB)&&role.equals("student"))
					return "student";
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(rs!=null){
				rs.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(con!=null){
				con.close();
			}
		}
		return "Invalid user credentials";
	}
	
	/*
	 * Method for login
	 */	
	public static int doLogin(LoginDTO logindto) throws ClassNotFoundException, SQLException{
		Connection con = null;
    	ResultSet rs = null;
    	PreparedStatement ps = null;
    	con = ConnectionDAO.getConnection();
    	String sql = "select * from users where email = ? and password = ? and rolename = ?";
    	ps = con.prepareStatement(sql);
    	ps.setString(1, logindto.getEmail());
    	ps.setString(2, logindto.getPassword());
    	ps.setString(3, logindto.getRole());
    	rs = ps.executeQuery();
    	while(rs.next()){
    		return 1;
    	}
    	return 0;
    }
}
