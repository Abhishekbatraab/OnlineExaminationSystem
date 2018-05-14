package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bmpl.examviral.quiz.model.dto.UserDTO;

/*
 * Check the roles of user
 */
public class RolesDAO implements ConnectionDAO{
	
	public String checkRole(UserDTO userdto) throws SQLException{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		String roleName = userdto.getRoleName();
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select roleName from roles where roleName = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, roleName);
			rs = ps.executeQuery();
			while(rs.next()){
				String rolename = rs.getString(2);
				return rolename;
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
		
		return "Invalid Role Name";
		
	}
}
