package com.yuqi.shop.web.security;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springside.modules.orm.Page;
import org.springside.modules.security.springsecurity.SpringSecurityUtils;

import com.yuqi.base.service.security.SecurityEntityManager;
import com.yuqi.base.web.CrudActionSupport;
import com.yuqi.shop.entity.Category;
import com.yuqi.shop.entity.Item;
import com.yuqi.shop.service.security.CategoryManager;
import com.yuqi.shop.service.security.ItemManager;

/**
 * 角色管理Action.
 * 
 * 演示不分页的简单管理界面.
 * 
 * @author 唐伯琦
 */
@Namespace("/security")
@Results( { @Result(name = CrudActionSupport.RELOAD, location = "item.action", type = "redirect") })
public class ItemAction extends CrudActionSupport<Item> {
	private static final int BUFFER_SIZE = 16 * 1024;
	private static final long serialVersionUID = 1L;

	@Autowired
	private ItemManager itemManager;
	@Autowired
	private CategoryManager categoryManager;
	@Autowired
	private SecurityEntityManager securityEntityManager;

	//-- 页面属性 --//
	private Long id;
	private Item entity;
	private Page<Item> page;
	private File pic;
	private String picFileName;
	private String newPicFileName;
	private String picContentType;

	private List<Category> categories;

	//-- ModelDriven 与 Preparable函数 --//
	public Item getModel() {
		return entity;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	protected void prepareModel() throws Exception {
		if (id != null) {
			entity = itemManager.get(id);
		} else {
			entity = new Item();
		}
	}

	private static void copy(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//-- CRUD Action 函数 --//
	@Override
	public String list() throws Exception {
		this.page = itemManager.page(1, 20);
		return SUCCESS;
	}

	@Override
	public String input() throws Exception {
		categories = categoryManager.getAllCategoryWithSub();
		return INPUT;
	}

	@Override
	public String save() throws Exception {
		if (id == null) {
			entity.setCreateTime(new Date());
			entity.setUser(securityEntityManager
					.findUserByLoginName(SpringSecurityUtils
							.getCurrentUserName()));
		}
		newPicFileName = "";
		if (StringUtils.isNotBlank(picFileName)) {
			newPicFileName = new Date().getTime() + getExtention(picFileName);
			File imageFile = new File(ServletActionContext.getServletContext()
					.getRealPath("/UploadImages")
					+ "/" + newPicFileName);
			copy(pic, imageFile);
		}
		entity.setImg(newPicFileName);
		itemManager.save(entity);
		addActionMessage("保存成功");
		return RELOAD;
	}

	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	@Override
	public String delete() throws Exception {
		itemManager.delete(id);
		addActionMessage("删除成功");
		return RELOAD;
	}

	public void setPage(Page<Item> page) {
		this.page = page;
	}

	public Page<Item> getPage() {
		return page;
	}

	public void setCategoryManager(CategoryManager categoryManager) {
		this.categoryManager = categoryManager;
	}

	public CategoryManager getCategoryManager() {
		return categoryManager;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public SecurityEntityManager getSecurityEntityManager() {
		return securityEntityManager;
	}

	public void setSecurityEntityManager(
			SecurityEntityManager securityEntityManager) {
		this.securityEntityManager = securityEntityManager;
	}

	public File getPic() {
		return pic;
	}

	public void setPic(File pic) {
		this.pic = pic;
	}

	public String getPicFileName() {
		return picFileName;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}

	public String getPicContentType() {
		return picContentType;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public void setNewPicFileName(String newPicFileName) {
		this.newPicFileName = newPicFileName;
	}

	public String getNewPicFileName() {
		return newPicFileName;
	}
}