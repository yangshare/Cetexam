package com.cet.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * BaseListening entity.
 */

public class BaseListening implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Integer id;
	private String listeningname;
	private String materialurl;
	private Float difficulty;
	private Float access;
	private Integer total;
	private Set<SeedListening> seedListenings = new HashSet<SeedListening>(0);

	// Constructors
	/** default constructor */
	public BaseListening() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getListeningname() {
		return this.listeningname;
	}

	public void setListeningname(String listeningname) {
		this.listeningname = listeningname;
	}

	public String getMaterialurl() {
		return this.materialurl;
	}

	public void setMaterialurl(String materialurl) {
		this.materialurl = materialurl;
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

	public Set<SeedListening> getSeedListenings() {
		return this.seedListenings;
	}

	public void setSeedListenings(Set<SeedListening> seedListenings) {
		this.seedListenings = seedListenings;
	}

}