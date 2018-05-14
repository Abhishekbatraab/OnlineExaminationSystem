package com.bmpl.examviral.quiz.controller.coursecontroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.bmpl.examviral.quiz.model.dao.CourseDAO;
import com.bmpl.examviral.quiz.model.dto.CourseDTO;

/**
 * Servlet implementation class CourseController
 */
@WebServlet("/AddCourse")
public class AddCourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "CourseImages";
	private static final int MEMORY_THRESHOLD 	= 1024 * 1024 * 3; 	// 3MB
	private static final int MAX_FILE_SIZE 		= 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE	= 1024 * 1024 * 50; // 50MB
	CourseDTO coursedto = new CourseDTO();
	CourseDAO coursedao = new CourseDAO();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseController() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if (!ServletFileUpload.isMultipartContent(request)) {
			
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}
		
		HashMap<String,String> value=new HashMap<>();
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		
		
		upload.setFileSizeMax(MAX_FILE_SIZE);
		
		
		upload.setSizeMax(MAX_REQUEST_SIZE);

		
		String uploadPath = getServletContext().getRealPath("")
				 + UPLOAD_DIRECTORY;
		String checkpath = getServletContext().getRealPath("");
		System.out.println(checkpath);
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		

		try {
			
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
			
				for (FileItem item : formItems) {
			
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						
						
					
						File storeFile = new File(filePath);
							
						System.out.println("file path :"+storeFile);
						
						//my code
						
						String folderPath = uploadPath + File.separator;
						
						int index=fileName.lastIndexOf(".");
						String fileN=fileName.substring(0, index);
						String extension=fileName.substring(index,fileName.length());
						
						System.out.println("file name :"+ fileN);
						System.out.println("file extension :"+ extension);
						
						
						
						File storeFileNew=new File(filePath);
						for(int i=1;i<=100000;i++){
						if(storeFileNew.exists()){
							storeFileNew = new File(folderPath+fileN+i+extension);
							continue;
						}
							
							storeFile.renameTo(storeFileNew);
							//coursedto.setImagePath(UPLOAD_DIRECTORY+"/"+fileName);
							coursedto.setImagePath(UPLOAD_DIRECTORY+"/"+storeFileNew.getName());
							break;
						
						}
						
						
						//
						item.write(storeFile);
						
						request.setAttribute("message",
							"Upload has been done successfully!");
					}
					
					if (item.isFormField()) 
                    {
						
                        String name = item.getFieldName();
                        String value2 = item.getString();
                        value.put(name,value2);
                        System.out.println(name+":"+value2);
                    }
				}
				
			}
			//System.out.println("user Name : "+value.get("userName"));
			//System.out.println("phone : "+value.get("phone"));
			
			String title = value.get("coursetitle");
			String details = value.get("coursedetails");
			
			coursedto.setDetails(details);
			coursedto.setTitle(title);
			
		} catch (Exception ex) {
			request.setAttribute("message",
					"There was an error: " + ex.getMessage());
		}
		
		
		try {
			int result = coursedao.addCourse(coursedto);
			System.out.println("Result is"+result);			
			if(result>=1){
				System.out.println("Course Added successfully");
				String status= result+" course added successfully";
				request.setAttribute("message", status);
				response.sendRedirect("courses.jsp?message="+status);				
				System.out.println("CourseDto is"+coursedto.toString());
			}
			else{
				System.out.println("Course Not added");
				String status="course not added!";
				response.sendRedirect("courses.jsp?message="+status);
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}

}
