package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bmpl.examviral.quiz.commonutils.Result;
import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dao.ResultDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;
import com.bmpl.examviral.quiz.model.dto.ResultDTO;
import com.bmpl.examviral.quiz.model.dto.TestDTO;
import com.bmpl.examviral.quiz.model.dto.UserDTO;

/**
 * Servlet implementation class TestController
 */
@WebServlet("/Test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int rows=0;
	/*String optionArray[] = new String[4];
	String quearr[] = new String[6];*/
	QuestionDAO quesdao = new QuestionDAO();
	QuestionDTO quesdto = new QuestionDTO();
	ResultDTO resultdto = new ResultDTO();
	ResultDAO resultdao = new ResultDAO();
	int dbresult=0;
	
	/*int correctAnsCounter=0;
	int incorrectAnsCounter=0;*/
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int correctAnsCounter=0;
		int incorrectAnsCounter=0;
		HttpSession session = request.getSession();
		TestDTO testdto = (TestDTO)session.getAttribute("testDetails");
		UserDTO userdto = (UserDTO)session.getAttribute("userdetails");
		int totalMarks = testdto.getTotalMarks();
		System.out.println("Total Marks "+totalMarks);
		String testName = request.getParameter("testName");
		String arr = (String)request.getAttribute("arr");
		System.out.println("String in controller"+arr);
		System.out.println("Test name is "+testName);
		rows = Integer.parseInt(request.getParameter("noofquestions"));
		Result result = new Result(rows, totalMarks);
		String optionArray[] = new String[rows];
		String quearr[] = new String[rows];
		System.out.println("No of questions are "+rows);
		for(int i=0;i<rows;i++){
			
			quearr= request.getParameterValues("que"+i);
			optionArray[i] = (String)request.getParameter("options"+i);
			String userSelectedOption = optionArray[i];
			if(userSelectedOption==null){
				System.out.println("Getting Null Value");				
			}else{	
				System.out.println("Option selected by user of Question "+(i+1)+" is "+userSelectedOption);
				for(String s: quearr){
					System.out.println("question "+ s);
					QuestionDTO quesdto = quesdao.getDataComp(s, testName);
					String correctAns = quesdto.getCorrectAnswer();
					System.out.println("Correct Ans is "+correctAns);
					int cmp = correctAns.compareTo(userSelectedOption);
					if(cmp == 0){
						correctAnsCounter++;
						System.out.println("Answer is correct");
					}else{
						incorrectAnsCounter++;
						System.out.println("Answer is not correct");
					}
				}
			}
		}
		result.countCorrectAns(correctAnsCounter);
		float percentage = result.calculatePercentage();
		System.out.println("User Get "+percentage+" percentage");
		System.out.println("No of correct answer is "+correctAnsCounter);
		System.out.println("No of incorrect answer is "+incorrectAnsCounter);
		resultdto.setUsername(userdto.getUsername());
		resultdto.setMarks(percentage);
		resultdto.setEmail(userdto.getEmail());
		resultdto.setTestName(testName);
		 try {
			dbresult = resultdao.insertResultData(resultdto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("percentage", percentage);
		request.setAttribute("correctAnswers", correctAnsCounter);
		request.setAttribute("incorrectAnswers", incorrectAnsCounter);
		request.setAttribute("testName", testName);
		request.setAttribute("userdetails", userdto);
		request.setAttribute("noofques", rows);
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		rd.forward(request, response);
	}

}
