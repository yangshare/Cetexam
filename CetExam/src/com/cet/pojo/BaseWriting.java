package com.cet.pojo;

/**
 * BaseWriting entity.
 */

public class BaseWriting implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String title;
	private String imgurl;
	private Float difficulty;
	private Float access;
	private Integer total;

	// Constructors
	/** default constructor */
	public BaseWriting() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgurl() {
		return this.imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
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