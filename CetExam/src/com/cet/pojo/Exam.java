package com.cet.pojo;

/**
 * Exam entity.
 */

public class Exam implements java.io.Serializable {

	/**
	 * 考试
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String examname;
	private String time;
	private String beginno;
	private String endno;
	private String teacher;
	private String position;
	private float difficulty;
	private Test test;

	// Constructors
	/** default constructor */
	public Exam() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Test getTest() {
		return this.test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public String getExamname() {
		return this.examname;
	}

	public void setExamname(String examname) {
		this.examname = examname;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTeacher() {
		return this.teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
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

	public void setDifficulty(float difficulty) {
		this.difficulty = difficulty;
	}

	public float getDifficulty() {
		return difficulty;
	}
}