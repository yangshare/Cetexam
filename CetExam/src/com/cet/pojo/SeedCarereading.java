package com.cet.pojo;

/**
 * SeedCarereading entity. @author MyEclipse Persistence Tools
 */

public class SeedCarereading implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String question;
	private String options;
	private String answer;
	private BaseCarereading baseCarereading;

	// Constructors
	/** default constructor */
	public SeedCarereading() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BaseCarereading getBaseCarereading() {
		return this.baseCarereading;
	}

	public void setBaseCarereading(BaseCarereading baseCarereading) {
		this.baseCarereading = baseCarereading;
	}

	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}


	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	/**
	 * @param options the options to set
	 */
	public void setOptions(String options) {
		this.options = options;
	}

	/**
	 * @return the options
	 */
	public String getOptions() {
		return options;
	}

}