package com.bmpl.examviral.quiz.controller.coursecontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bmpl.examviral.quiz.model.dao.CourseDAO;

/**
 * Servlet implementation class DeleteCourseController
 */
@WebServlet("/DeleteCourse")
public class DeleteCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseDAO coursedao = new CourseDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCourseController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		int result = coursedao.deleteCourse(courseId);
		if(result>=1){
			String message = result+" course deleted";
			response.sendRedirect("courses.jsp?message="+message);
		}
	}

}
