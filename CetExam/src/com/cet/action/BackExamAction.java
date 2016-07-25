package com.cet.action;

import javax.annotation.Resource;

import com.cet.pojo.Exam;
import com.cet.pojo.Test;
import com.cet.service.ObjectService;
import com.cet.tool.AutoGATest;
import com.opensymphony.xwork2.ActionSupport;

public class BackExamAction extends ActionSupport {

	/**
	 * 考试场次
	 */
	private static final long serialVersionUID = 1L;

	@Resource
	private ObjectService objectService;

	// field
	private Integer id;
	private String examname;
	private String time;
	private String beginno;
	private String endno;
	private String teacher;
	private String position;
	private Test test;// 生成的试卷
	private float difficulty;

	private String message;// 用于JSP页面显示提示信息

	/**
	 * 功能：添加一堂考试（并自动生成了一套试题）
	 * 
	 * @return
	 */
	public String insert() {

		Exam exam = new Exam();
		id = objectService.getMaxID("Exam") + 1;
		exam.setId(id);
		exam.setExamname(examname);
		exam.setTime(time);
		exam.setBeginno(beginno);
		exam.setEndno(endno);
		exam.setTeacher(teacher);
		exam.setPosition(position);

		test = new AutoGATest().getGATest(objectService, difficulty, 0.8, 0.1,
				5, 80, true);// 遗传算法自动组卷并返回试卷
		if (test == null) {// 题型数量已经不够用了，无法生成新的不重复的试卷
			message = "<script>alert('Error,题库相关难度的题型不足或者题型数量已经不够用，无法生成新的不重复的试卷');</script>";
			return ERROR;
		}
		test.setId(objectService.getMaxID("Test") + 1);
		test.setName(examname);
		objectService.save(test);

		exam.setDifficulty(test.getDifficulty());
		exam.setTest(test);
		objectService.save(exam);
		try {
		} catch (Exception e) {
			message = "<script>alert('Error,添加考试失败');</script>";
		}

		return SUCCESS;
	}

	// Property accessors
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getExamname() {
		return examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public String getBeginno() {
		return beginno;
	}

	public void setBeginno(String beginno) {
		this.beginno = beginno;
	}

	public String getEndno() {
		return endno;
	}

	public void setEndno(String endno) {
		this.endno = endno;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public Test getTest() {
		return test;
	}

	public void setDifficulty(float difficulty) {
		this.difficulty = difficulty;
	}

	public float getDifficulty() {
		return difficulty;
	}
}
