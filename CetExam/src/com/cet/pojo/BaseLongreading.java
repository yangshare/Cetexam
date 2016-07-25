package com.cet.pojo;

/**
 * BaseLongreading entity.
 */

public class BaseLongreading implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String essay;
	private String options;
	private String answer;
	private Float difficulty;
	private Float access;
	private Integer total;

	// Constructors
	/** default constructor */
	public BaseLongreading() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEssay() {
		return this.essay;
	}

	public void setEssay(String essay) {
		this.essay = essay;
	}

	public String getOptions() {
		return this.options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Float getDifficulty() {
		return this.difficulty;
	}

	public void setDifficulty(Float difficulty) {
		this.difficulty = difficulty;
	}

	public Float getAccess() {
		return this.access;
	}

	public void setAccess(Float access) {
		this.access = access;
	}

	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

}