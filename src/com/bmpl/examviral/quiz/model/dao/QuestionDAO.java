package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.bmpl.examviral.quiz.model.dto.QuestionDTO;

public class QuestionDAO{
	
	Connection con;
	Statement st;
	ResultSet rs;
	
	ArrayList<QuestionDTO> quizQuesList = new ArrayList<QuestionDTO>(); 
	
	public ArrayList<QuestionDTO> getTestData(String testName){
		try{
			 con= ConnectionDAO.getConnection();
			 st= con.createStatement();
			 String sql = "select * from "+testName;
			 rs= st.executeQuery(sql);
			 while(rs.next()){
				 QuestionDTO obj = new QuestionDTO();
				 obj.setQuesNo(rs.getInt(1));
				 obj.setQuestion(rs.getString(2));
				 obj.setOptionA(rs.getString(3));
				 obj.setOptionB(rs.getString(4));
				 obj.setOptionC(rs.getString(5));
				 obj.setOptionD(rs.getString(6));
				 obj.setAns(rs.getString(7).charAt(0));
				 quizQuesList.add(obj);
			}
			 
			}catch(Exception e){
				
			}
		return quizQuesList;
	}
	
	
}


