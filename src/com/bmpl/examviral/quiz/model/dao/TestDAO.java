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
		int noofrows = 0;
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
		
		/*
		 * Adding new Test
		 */
		
		public int addTest(TestDTO testdto){
				try {
					con = ConnectionDAO.getConnection();
					String sql = "insert into test(courseId, testName, testDuration, minMarks, totalMarks) values(?,?,?,?,?)";
					ps = con.prepareStatement(sql);
					ps.setInt(1, testdto.getCourseId());
					ps.setString(2, testdto.getTestName());
					ps.setInt(3, testdto.getTestDuration());
					ps.setInt(4, testdto.getMinMarks());
					ps.setInt(5, testdto.getTotalMarks());
					noofrows = ps.executeUpdate();
					return noofrows;
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return noofrows;
		}
		
		/*
		 * getting test id of a specific record
		 */
		public int fetchTestId(String testName){
			try {
				con = ConnectionDAO.getConnection();
				String sql = "select testId from test where testName = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, testName);
				rs = ps.executeQuery();
				while(rs.next()){
					int testId = rs.getInt(1);
					System.out.println("Test Id from db is "+testId);
					return testId;
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;
		}
}
