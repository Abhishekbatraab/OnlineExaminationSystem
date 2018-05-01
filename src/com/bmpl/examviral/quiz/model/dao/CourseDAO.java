package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bmpl.examviral.quiz.model.dto.CourseDTO;

public class CourseDAO implements ConnectionDAO{
	
	private Connection con;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private int result;
	ArrayList<CourseDTO> courseList = new ArrayList<CourseDTO>();
	ArrayList<CourseDTO> courseNamesList = new ArrayList<CourseDTO>();
	ArrayList<CourseDTO> courseIdList = new ArrayList<CourseDTO>();
	CourseDTO coursedto = new CourseDTO();
	public int addCourse(CourseDTO coursedto){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "insert into course(imagePath, title, details, register_date) values(?,?,?,current_timestamp)";
			ps = con.prepareStatement(sql);
			ps.setString(1, coursedto.getImagePath());
			ps.setString(2, coursedto.getTitle());
			ps.setString(3, coursedto.getDetails());
			result = ps.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int deleteCourse(int courseId){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "delete from course where courseId = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, courseId);
			result = ps.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateSpecificRecord(CourseDTO coursedto){
		try {
			System.out.println("Course dto in update db is "+coursedto);
			con = ConnectionDAO.getConnection();
			String sql = "update course set imagePath = ?, title = ?, details = ?, register_date= ? where courseId = ? ";
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			ps = con.prepareStatement(sql);
			ps.setString(1, coursedto.getImagePath());
			ps.setString(2, coursedto.getTitle());
			ps.setString(3, coursedto.getDetails());
			ps.setTimestamp(4, date);
			ps.setInt(5, coursedto.getcourseId());
			result = ps.executeUpdate();
			return result;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<CourseDTO> readCourse(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select courseId, imagePath, title, details, register_date from course";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				CourseDTO coursedto = new CourseDTO();
				coursedto.setcourseId(rs.getInt(1));
				coursedto.setImagePath(rs.getString(2));
				coursedto.setTitle(rs.getString(3));
				coursedto.setDetails(rs.getString(4));
				coursedto.setRegister_date(rs.getString(5));
				courseList.add(coursedto);
			}
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		System.out.println("Course List fetching from db is "+courseList);
		return courseList;
		
	}
	
	public CourseDTO getSpecificRecord(int courseId){
			try {
				con = ConnectionDAO.getConnection();
				String sql = "Select * from course where courseId = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, courseId);
				rs = ps.executeQuery();
				while(rs.next()){
					coursedto.setcourseId(rs.getInt(1));
					coursedto.setImagePath(rs.getString(2));
					coursedto.setTitle(rs.getString(3));
					coursedto.setDetails(rs.getString(4));
					coursedto.setRegister_date(rs.getString(5));
					
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("Specific Record is "+ coursedto);
			return coursedto;
	}
	
	public int getCourseId() throws ClassNotFoundException, SQLException{
		int courseId=0;
		con = ConnectionDAO.getConnection();
		String sql = "Select courseId from course";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()){
			courseId = rs.getInt(1);
		}
		return courseId;
	}
	
	public ArrayList<CourseDTO> getCourseNameList(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select courseId, title from course";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				CourseDTO coursedto = new CourseDTO();
				coursedto.setcourseId(rs.getInt(1));
				coursedto.setTitle(rs.getString(2));
				courseNamesList.add(coursedto);
			}
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		//System.out.println("Course List fetching from db is "+courseNamesList);
		return courseNamesList;
	}
	
	

}
