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
	private int result = 0;
	ArrayList<CourseDTO> courseList = new ArrayList<CourseDTO>();
	
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
	
	public void deleteCourse(){
		
	}
	
	public void updateCourse(){
		
	}

	public ArrayList<CourseDTO> readCourse(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select subId, imagePath, title, details, register_date from course";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				CourseDTO coursedto = new CourseDTO();
				coursedto.setSubId(rs.getInt(1));
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
	
	
	
	

}
