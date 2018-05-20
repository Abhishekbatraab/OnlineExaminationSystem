package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.QuestionDAO;
import com.bmpl.examviral.quiz.model.dto.QuestionDTO;

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
		String testName = request.getParameter("testName");
		String arr = (String)request.getAttribute("arr");
		System.out.println("String in controller"+arr);
		System.out.println("Test name is "+testName);
		rows = Integer.parseInt(request.getParameter("noofquestions"));
		String optionArray[] = new String[rows];
		String quearr[] = new String[rows];
		System.out.println("No of questions are "+rows);
		for(int i=0;i<rows;i++){
			quearr= request.getParameterValues("que"+i);
			optionArray[i] = (String)request.getParameter("options"+i);
			System.out.println("Option selected by user of Question "+(i+1)+" is "+optionArray[i]);
			for(String s: quearr){
				System.out.println("question "+ s);
				QuestionDTO quesdto = quesdao.getDataComp(s, testName);
				String correctAns = quesdto.getCorrectAnswer();
				System.out.println("Correct Ans is "+correctAns);
				int cmp = correctAns.compareTo(optionArray[i]);
				if(cmp == 0){
					System.out.println("Answer is correct");
				}else{
					System.out.println("Answer is not correct");
				}
				
			}
		}
		
	}

}
