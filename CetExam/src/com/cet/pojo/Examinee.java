package com.cet.pojo;

/**
 * Examinee entity.
 */

public class Examinee implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private String candidate;//学号
	private String name;
	private String password;
	private String sex;
	private String school;
	private String image;
	private String email;

	// Constructors
	/** default constructor */
	public Examinee() {
	}

	// Property accessors
	public String getCandidate() {
		return this.candidate;
	}

	public void setCandidate(String candidate) {
		this.candidate = candidate;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getSchool() {
		return this.school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}
}