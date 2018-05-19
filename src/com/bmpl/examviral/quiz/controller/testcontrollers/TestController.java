package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestController
 */
@WebServlet("/Test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	int rows=0;
	String optionArray[] = new String[5];
       
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
		rows = Integer.parseInt(request.getParameter("noofquestions"));
		System.out.println("No of questions are "+rows);
		for(int i=0;i<rows;i++){
			optionArray[i] = (String)request.getParameter("options"+i);
			System.out.println("Options of Question "+(i+1)+" is "+optionArray[i]);
		}
		
	}

}
