package com.cet.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * BaseCarereading entity.
 */

public class BaseCarereading implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String essay;
	private Float difficulty;
	private Float access;
	private Integer total;
	private Set<SeedCarereading> seedCarereadings = new HashSet<SeedCarereading>(
			0);

	// Constructors
	/** default constructor */
	public BaseCarereading() {
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

	public Set<SeedCarereading> getSeedCarereadings() {
		return this.seedCarereadings;
	}

	public void setSeedCarereadings(Set<SeedCarereading> seedCarereadings) {
		this.seedCarereadings = seedCarereadings;
	}
}