package com.bmpl.examviral.quiz.commonutils;

public class Result {
	private float eachmarks=0;
	private int noofques;
	private int totalMarks;
	private float marksObtained=0;
	private int correctAnsCounter = 0;
	
	public Result(int noofques, int totalMarks){
		this.noofques = noofques;
		this.totalMarks = totalMarks;
	}
	public void countCorrectAns(int correctAnsCounter){
		this.correctAnsCounter=  correctAnsCounter;
	}
	public float calculateEachMarks(){
		eachmarks = totalMarks/noofques;
		return eachmarks;
	}
	
	public float calculateMarksObtained(){
		eachmarks = calculateEachMarks();
		marksObtained = eachmarks * correctAnsCounter;
		return marksObtained;
	}
	
	public float calculatePercentage(){
		marksObtained = calculateMarksObtained();
		float percentage = (marksObtained/totalMarks)*100;
		return percentage;
	}
	
	
}
