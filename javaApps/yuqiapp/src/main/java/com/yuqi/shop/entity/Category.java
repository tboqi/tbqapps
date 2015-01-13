package com.yuqi.shop.entity;

import static javax.persistence.GenerationType.IDENTITY;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name = "shop_category")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Category implements java.io.Serializable {
	private static final long serialVersionUID = -3980008390029913063L;
	private Long id;
	private String name;
	private Category category;
	private List<Category> categories = new ArrayList<Category>();
	private Set<Item> items = new HashSet<Item>(0);

	public Category() {
	}
	
	public Category(Long id) {
		setId(id);
	}

	public Category(String name) {
		this.name = name;
	}

	public Category(Long id, String name, Category category) {
		this.id = id;
		this.name = name;
		this.category = category;
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToOne
	@JoinColumn(name = "pid")
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@OneToMany(mappedBy = "category")
	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public void setItems(Set<Item> items) {
		this.items = items;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	public Set<Item> getItems() {
		return items;
	}
}
