package com.yuqi.shop.web.security;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.yuqi.base.web.CrudActionSupport;
import com.yuqi.shop.entity.Category;
import com.yuqi.shop.service.security.CategoryManager;

/**
 * 角色管理Action.
 * 
 * 演示不分页的简单管理界面.
 * 
 * @author calvin
 */
@Namespace("/security")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "category.action", type = "redirect") })
public class CategoryAction extends CrudActionSupport<Category> {

	private static final long serialVersionUID = 1L;

	@Autowired
	private CategoryManager categoryManager;

	//-- 页面属性 --//
	private Long id;
	private Category entity;
	private List<Category> allCategoryList;// 角色列表

	//-- ModelDriven 与 Preparable函数 --//
	public Category getModel() {
		return entity;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = categoryManager.getCategory(id);
		} else {
			entity = new Category();
		}
	}

	//-- CRUD Action 函数 --//
	@Override
	public String list() throws Exception {
		setAllCategoryList(categoryManager.getAllCategoryWithSub());
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		allCategoryList = categoryManager.getAllCategoryWithSub();
		return INPUT;
	}

	@Override
	public String save() throws Exception {
		// int pid = entity.getCategory().getId().intValue();
		// if (pid == 0) {
		// entity.setCategory(null);
		// } else {
		// entity.setCategory(categoryManager.getCategory(new Long(pid)));
		// }
		// if(id == null) {
		// categoryManager.saveCategory(entity);
		// } else {
		// Category cate = categoryManager.getCategory(id);
		// cate.setCategory(entity.getCategory());
		// cate.setName(entity.getName());
		// categoryManager.saveCategory(cate);
		// }
		if (entity.getCategory().getId().intValue() == 0) {
			entity.setCategory(null);
		}
		categoryManager.saveCategory(entity);
		addActionMessage("保存角色成功");
		return RELOAD;
	}

	@Override
	public String delete() throws Exception {
		categoryManager.deleteCategory(id);
		addActionMessage("删除角色成功");
		return RELOAD;
	}

	public void setAllCategoryList(List<Category> allCategoryList) {
		this.allCategoryList = allCategoryList;
	}

	public List<Category> getAllCategoryList() {
		return allCategoryList;
	}
}