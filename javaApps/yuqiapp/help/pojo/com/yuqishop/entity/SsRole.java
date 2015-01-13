package com.yuqishop.entity;

// Generated 2010-3-10 22:55:33 by Hibernate Tools 3.2.4.GA

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * SsRole generated by hbm2java
 */
@Entity
@Table(name = "ss_role", catalog = "yuqiapp_java", uniqueConstraints = @UniqueConstraint(columnNames = "name"))
public class SsRole implements java.io.Serializable {

	private Long id;
	private String name;

	public SsRole() {
	}

	public SsRole(String name) {
		this.name = name;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "name", unique = true, nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
