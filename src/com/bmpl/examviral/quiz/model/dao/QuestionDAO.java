package com.bmpl.examviral.quiz.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Statement;
import java.util.ArrayList;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;


public class QuestionDAO{
	
	Connection con=null;
	PreparedStatement ps = null;
	ResultSet rs=null;
	int noofrows=0;
	int result =0 ;
	ArrayList<QuestionDTO> quizQuesList = new ArrayList<QuestionDTO>();
	QuestionDTO quesdto = new QuestionDTO();
	
	/*public ArrayList<QuestionDTO> getTestData(String testName){
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
				 obj.setCorrectAnswer(rs.getString(7));
				 quizQuesList.add(obj);
			}
			 
			}catch(Exception e){
				
			}
		return quizQuesList;
	}*/
	
	/*
	 * Fetching All questions
	 */
	public ArrayList<QuestionDTO> getQuestions(){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select * from questions";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				QuestionDTO quesdto = new QuestionDTO();
				quesdto.setQuesNo(rs.getInt(1));
				quesdto.setQuestion(rs.getString(2));
				quesdto.setTestName(rs.getString(3));
				quesdto.setOptionA(rs.getString(4));
				quesdto.setOptionB(rs.getString(5));
				quesdto.setOptionC(rs.getString(6));
				quesdto.setOptionD(rs.getString(7));
				quesdto.setCorrectAnswer(rs.getString(8));
				quizQuesList.add(quesdto);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return quizQuesList;
	}
	
	/*
	 * Fetching questions of a particular test name
	 */
	public ArrayList<QuestionDTO> getQuestions(String testName){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select * from questions where testName = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, testName);
			rs = ps.executeQuery();
			while(rs.next()){
				QuestionDTO quesdto = new QuestionDTO();
				quesdto.setQuesNo(rs.getInt(1));
				quesdto.setQuestion(rs.getString(2));
				quesdto.setTestName(rs.getString(3));
				quesdto.setOptionA(rs.getString(4));
				quesdto.setOptionB(rs.getString(5));
				quesdto.setOptionC(rs.getString(6));
				quesdto.setOptionD(rs.getString(7));
				quesdto.setCorrectAnswer(rs.getString(8));
				quizQuesList.add(quesdto);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return quizQuesList;
	}
	public int addQuestions(QuestionDTO quesdto, String testname){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "insert into questions(testName, question, optionA, optionB, optionC, optionD, correctAnswer) values(?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, testname);
			ps.setString(2, quesdto.getQuestion());
			ps.setString(3, quesdto.getOptionA());
			ps.setString(4, quesdto.getOptionB());
			ps.setString(5, quesdto.getOptionC());
			ps.setString(6, quesdto.getOptionD());
			ps.setString(7, quesdto.getCorrectAnswer());
			noofrows = ps.executeUpdate();
			return noofrows;
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return noofrows;
	}
	
	/*
	 * Fetching specific question record
	 */
	public QuestionDTO getSpecificQuestion(QuestionDTO quesdto){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select * from questions where questionNo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, quesdto.getQuesNo());
			rs = ps.executeQuery();
			while(rs.next()){
				quesdto.setQuestion(rs.getString(2));
				quesdto.setTestName(rs.getString(3));
				quesdto.setOptionA(rs.getString(4));
				quesdto.setOptionB(rs.getString(5));
				quesdto.setOptionC(rs.getString(6));
				quesdto.setOptionD(rs.getString(7));
				quesdto.setCorrectAnswer(rs.getString(8));
				return quesdto;
			}	
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Specific question record is "+quesdto.toString());
		return quesdto;
	}
	/*
	 * Updating a specific record
	 */
	public int updateSpecificQuestion(QuestionDTO quesdto){
		
		try {
			con = ConnectionDAO.getConnection();
			String sql = "update questions set question = ?, optionA = ?, optionB = ?, optionC = ?, optionD = ?, correctAnswer = ? where questionNo = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, quesdto.getQuestion());
			ps.setString(2, quesdto.getOptionA());
			ps.setString(3, quesdto.getOptionB());
			ps.setString(4, quesdto.getOptionC());
			ps.setString(5, quesdto.getOptionD());
			ps.setString(6, quesdto.getCorrectAnswer());
			ps.setInt(7, quesdto.getQuesNo());
			result = ps.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int deleteSpecificQuestion(int quesNo){
		
		try {
			con = ConnectionDAO.getConnection();
			String sql = "delete from questions where questionNo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, quesNo);
			int result = ps.executeUpdate();
			return result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
	
	public int deleteSpecificQuestion(String testName){
			
			try {
				con = ConnectionDAO.getConnection();
				String sql = "delete from questions where testName = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, testName);
				int result = ps.executeUpdate();
				return result;
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
	}
	
	public QuestionDTO getDataComp(String quesName, String testName){
		try {
			con = ConnectionDAO.getConnection();
			String sql = "select correctAnswer from questions where question = ? and testName = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, quesName);
			ps.setString(2, testName);
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println("correct answer from db is "+rs.getString(1));
				quesdto.setCorrectAnswer(rs.getString(1));
				return quesdto;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return quesdto;
	}
	}
	
