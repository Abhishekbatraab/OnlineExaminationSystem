package com.bmpl.examviral.quiz.controller.testcontrollers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.CourseDAO;

/**
 * Servlet implementation class ViewTestController
 */
@WebServlet("/AddTest")
public class AddTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseDAO coursedao = new CourseDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
    	
    }

}
