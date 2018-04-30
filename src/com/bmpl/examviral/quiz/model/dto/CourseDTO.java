package com.bmpl.examviral.quiz.model.dto;

public class CourseDTO {
	private int courseId;
	private String imagePath;
	private String title;
	private String details;
	private String register_date;
	
	@Override
	public String toString() {
		return "CourseDTO [courseId=" + courseId + ", imagePath=" + imagePath + ", title=" + title + ", details=" + details
				+ ", register_date=" + register_date + "]";
	}
	public int getcourseId() {
		return courseId;
	}
	public void setcourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	
	
	
}
