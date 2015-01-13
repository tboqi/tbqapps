package com.cc.cw.web;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.math.NumberUtils;

import com.cc.cw.domain.ControlRole;
import com.cc.cw.domain.ControlUser;
import com.cc.cw.service.ControlRoleService;
import com.cc.cw.service.ControlUserService;

@SuppressWarnings("serial")
public class CUserAction extends CMyAction {

	private String flag;

	private List<ControlUser> list;

	private ControlUserService cuserService;

	private int cp;

	private Page page;

	private String account;

	private String password;

	private String password2;

	private int id;

	private ControlRoleService croleService;
	
	private List<ControlRole> roleList;
	
	private int[] roleIds;

	@Override
	public String doExecute() {
		if (flag != null && flag.equalsIgnoreCase("input")) {
			flag = "add";
			return INPUT;
		}
		if (flag != null && flag.equalsIgnoreCase("add")) {
			if (checkForm())
				return INPUT;
			ControlUser cuser = new ControlUser();
			if (cuserService.getUserByAccount(account) != null) {
				setMessage("帐号重复");
				return INPUT;
			}
			cuser.setAccount(account);
			cuser.setCreateTime(new Date());
			cuser.setLevel(0);
			cuser.setPassword(password);
			cuserService.save(cuser);
			return SUCCESS;
		}
		if (flag != null && flag.equalsIgnoreCase("edit")) {
			ControlUser cuser = cuserService.getById(id);
			account = cuser.getAccount();
			flag = "doEdit";
			return EDIT;
		}
		if (flag != null && flag.equalsIgnoreCase("doEdit")) {
			if (checkForm())
				return INPUT;
			ControlUser cuser = cuserService.getById(id);
			cuser.setAccount(account);
			cuser.setPassword(password);
			cuserService.save(cuser);
			return SUCCESS;
		}
		if (flag != null && flag.equalsIgnoreCase("delete")) {
			cuserService.delete(id);
			return SUCCESS;
		}
		if (flag != null && flag.equalsIgnoreCase("role")) {
			flag = "doRole";
			roleList = croleService.getRoleList();
			String idsStr = cuserService.getById(id).getRole();
			String[] idsStrArray = idsStr.split(",");
			roleIds = new int[idsStrArray.length];
			for (int i = 0; i < idsStrArray.length; i++) {
				roleIds[i] = NumberUtils.toInt(idsStrArray[i]);
			}
			return "role";
		}
		if (flag != null && flag.equalsIgnoreCase("doRole")) {
			if(roleIds.length >= 1){
				String ids = "";
				for (int i = 0; i < roleIds.length; i++) {
					ids += roleIds[i] + ",";
				}
				ids = ids.substring(0, ids.length() - 1);
				ControlUser user = cuserService.getById(id);
				user.setRole(ids);
				cuserService.save(user);
			}
			return SUCCESS;
		}

		if (cp <= 1)
			cp = 1;
		int rowCount = cuserService.getUserCount();
		int rowPerPage = 15;
		page = new Page(cp, rowCount, rowPerPage);
		list = cuserService.getUserList((cp - 1) * rowPerPage, rowPerPage);
		if (list != null && list.size() >= 1) {
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				ControlUser user = (ControlUser) iter.next();
				if (user.getLevel() == 1)
					user.setRole("全部权限");
				else {
					if (user.getRole() == null
							|| user.getRole().trim().length() < 1)
						user.setRole("没有权限");
					else {
						List<ControlRole> roles = croleService
								.getRoleList(user);
						if (roles == null || roles.size() < 1)
							user.setRole("没有权限");
						else {
							String rs = "";
							for (int i = 0; i < roles.size(); i++) {
								rs += roles.get(i).getName() + " ";
							}
							user.setRole(rs.substring(0, rs.length() - 1));
						}

					}
				}
			}
		}
		return LIST;
	}

	private boolean checkForm() {
		if (account == null || account.trim().equals("")) {
			setMessage("帐号不能为空");
			return false;
		}
		if (password == null || password.equals("")) {
			setMessage("密码不能为空");
			return false;
		}
		if (password2 == null || password2.equals("")) {
			setMessage("确认密码不能为空");
			return false;
		}
		if (password2.equals(password)) {
			setMessage("两次输入的密码必须相等");
			return false;
		}
		return false;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public List<ControlUser> getList() {
		return list;
	}

	public void setList(List<ControlUser> list) {
		this.list = list;
	}

	public ControlUserService getCuserService() {
		return cuserService;
	}

	public void setCuserService(ControlUserService cuserService) {
		this.cuserService = cuserService;
	}

	public int getCp() {
		return cp;
	}

	public void setCp(int cp) {
		this.cp = cp;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ControlRoleService getCroleService() {
		return croleService;
	}

	public void setCroleService(ControlRoleService croleService) {
		this.croleService = croleService;
	}

	public List<ControlRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<ControlRole> roleList) {
		this.roleList = roleList;
	}

	public int[] getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(int[] roleIds) {
		this.roleIds = roleIds;
	}

}
