package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bmpl.examviral.quiz.model.dto.TestDTO;

public class TestDAO implements ConnectionDAO{
		private Connection con=null;
		private PreparedStatement ps = null;
		private ResultSet rs = null;
		TestDTO testdto = new TestDTO();
		ArrayList<TestDTO> testlist = new ArrayList<>();
		
		/*
		 * Fetch the test records from Test table
		 */
		public ArrayList<TestDTO> readTestData(){
			try {
				con = ConnectionDAO.getConnection();
				String sql = "select * from test";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()){
					TestDTO testdto = new TestDTO();
					testdto.setTestId(rs.getInt(1));
					testdto.setCourseId(rs.getInt(2));
					testdto.setTestName(rs.getString(3));
					testdto.setTestDuration(rs.getInt(4));
					testdto.setMinMarks(rs.getInt(5));
					testdto.setTotalMarks(rs.getInt(6));
					testlist.add(testdto);
					
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
				try {
					con.close();
					ps.close();
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			return testlist;
		}
		
		
}
