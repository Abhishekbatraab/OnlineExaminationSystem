package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.bmpl.examviral.quiz.model.dto.CourseDTO;
import com.bmpl.examviral.quiz.model.dto.RolesDTO;
//import com.bmpl.examviral.quiz.commonutils.CRUDOperations;
import com.bmpl.examviral.quiz.model.dto.UserDTO;

public class UserDAO extends UserDTO implements ConnectionDAO{
	
//	public UserDAO(int id, String username, String password, String email, String gender, String dateofbirth,
//			String address, String institutename) {
//		super(id, username, password, email, gender, dateofbirth, address, institutename);
//		// TODO Auto-generated constructor stub
//	}

	Connection con;
	Statement stmnt;
	PreparedStatement ps;
	ResultSet rs;
	UserDTO userdto = new UserDTO();
	int result = 0;
	ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
//	UserDTO userDto = new UserDTO(id, username, email, password, gender, dateofbirth, address, institutename);
	
	/*
	 * Method for getting the username from database
	 */
	public String takeUserName(UserDTO userdto){
		try {
			con = ConnectionDAO.getConnection();
			stmnt = con.createStatement();
			String email = userdto.getEmail();
			String sql = "select * from users where email = '"+email+"'";
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				String username = rs.getString(2);
				userdto.setUsername(username);
				return userdto.getUsername();
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "User not found";
	}
	
	/*
	 * Method for getting user id from database
	 */
	/*public int takeUserId() throws ClassNotFoundException, SQLException{
		Connection con = ConnectionDAO.getConnection();
		Statement stmnt = con.createStatement();
		String sql = "select * from users";
		ResultSet rs = stmnt.executeQuery(sql);
		while(rs.last()){
			int id = rs.getInt(1);
			userDto.setId(id);
			id = userDto.getId();
			System.out.println("Id is "+id);
			return id;
		}
		return 0;
	}*/
	
	/*
	 * Method for getting user id from database
	 */
	public int takeUserId(UserDTO userdto) throws ClassNotFoundException, SQLException{
		con = ConnectionDAO.getConnection();
		stmnt = con.createStatement();
		String email = userdto.getEmail();
		String sql = "select * from users where email = '"+email+"' ";
		rs = stmnt.executeQuery(sql);
		while(rs.next()){
			int userid = rs.getInt(1);
			userdto.setId(userid);
			return userdto.getId();
		}
		return 0;
	}
	
	public ArrayList<UserDTO> readAllRecords() throws ClassNotFoundException, SQLException{
		con = ConnectionDAO.getConnection();
		stmnt = con.createStatement();
		String sql = "select * from users where rolename = 'student' ";
		rs = stmnt.executeQuery(sql);
		while(rs.next()){
			UserDTO userdto = new UserDTO();
			userdto.setId(rs.getInt(1));
			userdto.setUsername(rs.getString(2));
			userdto.setPassword(rs.getString(3));
			userdto.setEmail(rs.getString(4));
			userdto.setDateofbirth(rs.getString(5));
			userdto.setGender(rs.getString(6));
			userdto.setAddress(rs.getString(7));
			userdto.setInstitutename(rs.getString(8));
			userdto.setRegisterdate(rs.getString(10));
			userList.add(userdto);
			System.out.println("Latest list is"+userList);
			
		}
		
		return userList;
		
	}
	
	/*
	 * Method for checking whether the user already exist in the user table or not
	 */
	public boolean doesUserExist(UserDTO userdto) throws ClassNotFoundException, SQLException{
		Connection con = null;
	   	ResultSet rs = null;
	   	Statement stmnt = null;
	   	int flag = 0;
	   	con = ConnectionDAO.getConnection();
	   	stmnt = con.createStatement();
	   	String email = userdto.getEmail();
	   	String sql = "select * from users where email = '"+email+"' ";
	  	rs = stmnt.executeQuery(sql);
	   	while(rs.next()){
	   		flag=1;
	   	}
	   	if(flag!=0){	
	   		System.out.println("Email is "+email);
	   		return true;
	   	}
	   	return false;
	   	
    }    	
	
	/*
	 * Method for Registering user
	 */
	public void addUser(UserDTO userdto, RolesDTO rolesdto)
			throws SQLException, ClassNotFoundException{
				Connection con = ConnectionDAO.getConnection();
				String username = userdto.getUsername();
				String password = userdto.getPassword();
				String email = userdto.getEmail();
				String dateofbirth = userdto.getDateofbirth();
				String gender = userdto.getGender();
				String address = userdto.getAddress();
				String institutename = userdto.getInstitutename();
				String rolename = rolesdto.getRoleName();
				String sql = "insert into users(username, password, email, dateofbirth, gender, address, institutename, rolename, registerdate)"
						+ "values(?,?,?,?,?,?,?,?,current_timestamp) ";
				System.out.println(sql);
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, username);
				ps.setString(2, password);
				ps.setString(3, email);
				ps.setString(4, dateofbirth);
				ps.setString(5, gender);
				ps.setString(6, address);
				ps.setString(7, institutename);
				ps.setString(8, rolename);
				ps.executeUpdate();
	}
	
	public void insertUserLogin(UserDTO userdto, RolesDTO rolesdto) throws ClassNotFoundException, SQLException{
		Connection con = ConnectionDAO.getConnection();
		String username = userdto.getUsername();
		String password = userdto.getPassword();
		String email = userdto.getEmail();
		String rolename = rolesdto.getRoleName();
		String sql = "insert into userlogin(roleName, username, password, email) values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, rolename);
		ps.setString(2, username);
		ps.setString(3, password);
		ps.setString(4, email);
		ps.executeUpdate();
	}

	public UserDTO getSpecificRecord(String email){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select * from users where email = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			while(rs.next()){
				UserDTO userdto = new UserDTO();
				userdto.setId(rs.getInt(1));
				userdto.setUsername(rs.getString(2));
				userdto.setPassword(rs.getString(3));
				userdto.setEmail(rs.getString(4));
				userdto.setDateofbirth(rs.getString(5));
				userdto.setGender(rs.getString(6));
				userdto.setAddress(rs.getString(7));
				userdto.setInstitutename(rs.getString(8));
				userdto.setRegisterdate(rs.getString(10));
				System.out.println("Specific record of user is "+userdto);
				return userdto;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userdto;
	}
	
	public UserDTO getSpecificRecord(int userId){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select * from users where id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			while(rs.next()){
				UserDTO userdto = new UserDTO();
				userdto.setId(rs.getInt(1));
				userdto.setUsername(rs.getString(2));
				userdto.setPassword(rs.getString(3));
				userdto.setEmail(rs.getString(4));
				userdto.setDateofbirth(rs.getString(5));
				userdto.setGender(rs.getString(6));
				userdto.setAddress(rs.getString(7));
				userdto.setInstitutename(rs.getString(8));
				userdto.setRegisterdate(rs.getString(10));
				System.out.println("Specific record of user is "+userdto);
				return userdto;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userdto;
	}
	
	public int updateSpecificRecord(UserDTO userdto){
		try {
			System.out.println("User dto in update db is "+userdto);
			con = ConnectionDAO.getConnection();
			String sql = "update users set username = ?, password = ?, email = ?, dateofbirth = ?, gender = ?, address = ?, institutename = ?, registerdate = ? where id = ? ";
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			ps = con.prepareStatement(sql);
			ps.setString(1, userdto.getUsername());
			ps.setString(2, userdto.getPassword());
			ps.setString(3, userdto.getEmail());
			ps.setString(4, userdto.getDateofbirth());
			ps.setString(5, userdto.getGender());
			ps.setString(6, userdto.getAddress());
			ps.setString(7, userdto.getInstitutename());
			ps.setTimestamp(8, date);
			ps.setInt(9, userdto.getId());
			result = ps.executeUpdate();
			return result;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int countTotalRecords(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "Select count(*) from users where rolename= ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "student");
			rs = ps.executeQuery();
			while(rs.next()){
				result = rs.getInt(1);
				return result;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	/*
	 * Removing an user
	 */
	public int deleteUser(int userId){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "delete from users where id = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			result = ps.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	} 
}
