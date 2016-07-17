package com.cet.pojo;

/**
 * Needmarking entity.
 */

public class Needmarking implements java.io.Serializable {

	/**
	 * 
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
	private Double writinggrade;
	private Double listeninggrade;
	private Double readinggrade;
	private Double translategrade;
	private Double totalgrade;

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

	public Double getWritinggrade() {
		return writinggrade;
	}

	public void setWritinggrade(Double writinggrade) {
		this.writinggrade = writinggrade;
	}

	public Double getListeninggrade() {
		return listeninggrade;
	}

	public void setListeninggrade(Double listeninggrade) {
		this.listeninggrade = listeninggrade;
	}

	public Double getReadinggrade() {
		return readinggrade;
	}

	public void setReadinggrade(Double readinggrade) {
		this.readinggrade = readinggrade;
	}

	public Double getTranslategrade() {
		return translategrade;
	}

	public void setTranslategrade(Double translategrade) {
		this.translategrade = translategrade;
	}

	public Double getTotalgrade() {
		return totalgrade;
	}

	public void setTotalgrade(Double totalgrade) {
		this.totalgrade = totalgrade;
	}

}