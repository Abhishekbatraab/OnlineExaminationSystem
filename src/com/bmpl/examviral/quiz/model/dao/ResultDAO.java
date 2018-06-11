package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bmpl.examviral.quiz.model.dto.ResultDTO;

public class ResultDAO implements ConnectionDAO{
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private int result = 0;
	ArrayList<ResultDTO> resultdata = new ArrayList<ResultDTO>();
	
	public int insertResultData(ResultDTO resultdto) throws SQLException{
		try {
			String username = resultdto.getUsername();
			String email = resultdto.getEmail();
			float marks = resultdto.getMarks();
			String testName = resultdto.getTestName();
			con = ConnectionDAO.getConnection();
			String sql = "insert into result(username, email, marks, testDate, testName) value(?,?,?,current_timestamp,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setFloat(3, marks);
			ps.setString(4, testName);
			result = ps.executeUpdate();
			return result;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(con!=null){
				con.close();
			}
			if(ps!=null){
				ps.close();
			}
			if(rs!=null){
				rs.close();
			}
		}
		return result;
		
	}
	
	public int countTotalRecords(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "Select count(*) from result";
			ps = con.prepareStatement(sql);
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
	 * Fetching the results
	 */
	public ArrayList<ResultDTO> getAllResults(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select * from result";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ResultDTO resultdto = new ResultDTO();
				resultdto.setResultId(rs.getInt(1));
				resultdto.setUsername(rs.getString(2));
				resultdto.setEmail(rs.getString(3));
				resultdto.setMarks(rs.getInt(4));
				resultdto.setTestDate(rs.getString(5));
				resultdto.setTestName(rs.getString(6));
				resultdata.add(resultdto);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultdata;
	}

}
