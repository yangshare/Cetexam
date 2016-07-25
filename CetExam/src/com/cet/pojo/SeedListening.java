package com.cet.pojo;

/**
 * SeedListening entity.
 */

public class SeedListening implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String options;
	private String answer;
	private BaseListening baseListening;

	// Constructors
	/** default constructor */
	public SeedListening() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BaseListening getBaseListening() {
		return this.baseListening;
	}

	public void setBaseListening(BaseListening baseListening) {
		this.baseListening = baseListening;
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