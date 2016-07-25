package com.cet.pojo;

/**
 * Needmarking entity.
 */

public class Needmarking implements java.io.Serializable {

	/**
	 * 评分
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private Examinee examinee;
	private Test test;
	private String writingAnswer;
	private String translateAnswer;
	private String status;
	private String time;
	private float writinggrade;
	private float listeninggrade;
	private float readinggrade;
	private float translategrade;
	private float totalgrade;

	// Constructors
	/** default constructor */
	public Needmarking() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Examinee getExaminee() {
		return this.examinee;
	}

	public void setExaminee(Examinee examinee) {
		this.examinee = examinee;
	}

	public Test getTest() {
		return this.test;
	}

	public void setTest(Test test) {
		this.test = test;
	}

	public String getWritingAnswer() {
		return this.writingAnswer;
	}

	public void setWritingAnswer(String writingAnswer) {
		this.writingAnswer = writingAnswer;
	}

	public String getTranslateAnswer() {
		return this.translateAnswer;
	}

	public void setTranslateAnswer(String translateAnswer) {
		this.translateAnswer = translateAnswer;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public float getWritinggrade() {
		return writinggrade;
	}

	public void setWritinggrade(float writinggrade) {
		this.writinggrade = writinggrade;
	}

	public float getListeninggrade() {
		return listeninggrade;
	}

	public void setListeninggrade(float listeninggrade) {
		this.listeninggrade = listeninggrade;
	}

	public float getReadinggrade() {
		return readinggrade;
	}

	public void setReadinggrade(float readinggrade) {
		this.readinggrade = readinggrade;
	}

	public float getTranslategrade() {
		return translategrade;
	}

	public void setTranslategrade(float translategrade) {
		this.translategrade = translategrade;
	}

	public float getTotalgrade() {
		return totalgrade;
	}

	public void setTotalgrade(float totalgrade) {
		this.totalgrade = totalgrade;
	}

}