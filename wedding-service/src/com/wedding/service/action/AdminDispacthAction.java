package com.wedding.service.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wedding.service.dao.CrudManager;
import com.wedding.service.dto.AdminDTO;
import com.wedding.service.entity.Admin;

@SuppressWarnings( { "unchecked", "serial" })
@Component("admin")
@Scope("prototype")
public class AdminDispacthAction extends ActionSupport implements ModelDriven {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	private AdminDTO adminDTO = new AdminDTO();

	public String login() {
		String hql = "from Admin as a where a.name=:name and a.password=:password";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", adminDTO.getName());
		map.put("password", adminDTO.getPassword());
		List<Admin> admins = crudManager.executeQuery(hql, map);
		if (admins.size() > 0) {
			ServletActionContext.getRequest().getSession().setAttribute(
					"admin", admins.get(admins.size() - 1));
			List<Admin> adminList = crudManager.findAll(Admin.class);
			List<Admin> toList = new ArrayList<Admin>();

			for (Admin a : adminList) {
				if (a.getId() == admins.get(admins.size() - 1).getId()) {
					toList.add(a);
				}
			}
			adminList.removeAll(toList);

			ServletActionContext.getRequest().getSession().setAttribute(
					"adminList", adminList);
			return SUCCESS;
		} else {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"用户名或密码有误！");
			return ERROR;
		}
	}

	public String show() {
		int adminId = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("adminId"));
		Admin admin = (Admin) crudManager.find(Admin.class, adminId);
		ServletActionContext.getRequest().setAttribute("admins", admin);
		return "admin";
	}

	public String modify() {
		Admin admin = (Admin) crudManager.find(Admin.class, adminDTO.getId());
		admin.setName(adminDTO.getName());
		admin.setPassword(adminDTO.getPassword());
		crudManager.modify(admin);
		return "adminAll";
	}

	public String add() {
		Admin admin = new Admin();
		admin.setName(adminDTO.getName());
		admin.setPassword(adminDTO.getPassword());
		crudManager.save(admin);
		return "adminAll";
	}

	public String delete() {
		String adminId = ServletActionContext.getRequest().getParameter(
				"adminId");
		crudManager.delete(Admin.class, adminId);
		return "adminAll";
	}

	public String showAll() {
		List<Admin> adminList = crudManager.findAll(Admin.class);
		ServletActionContext.getRequest().getSession().setAttribute(
				"adminList", adminList);
		return "showAdminList";

	}

	public String exit() {
		ServletActionContext.getRequest().getSession().removeAttribute("admin");
		return ERROR;
	}

	public Object getModel() {
		return adminDTO;
	}
}
