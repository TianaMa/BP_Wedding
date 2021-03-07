package com.wedding.service.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wedding.service.dao.CrudManager;
import com.wedding.service.dto.ServerDTO;
import com.wedding.service.entity.Company;
import com.wedding.service.entity.Server;

@SuppressWarnings( { "unchecked", "serial" })
@Component("server")
@Scope("prototype")
public class ServerDispacthAction extends ActionSupport implements ModelDriven {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	private ServerDTO serverDTO = new ServerDTO();

	public String show() {
		String serverId = ServletActionContext.getRequest().getParameter(
				"serverId");
		List<Company> companyList = crudManager.findAll(Company.class);
		ServletActionContext.getRequest().setAttribute("companyList",
				companyList);
		if (serverId != null) {
			Server server = (Server) crudManager.find(Server.class, Integer
					.parseInt(serverId));
			ServletActionContext.getRequest().setAttribute("server", server);
			return "server";
		} else {
			return ERROR;
		}
	}

	public String modify() {
		Server server = (Server) crudManager.find(Server.class, serverDTO
				.getId());
		Company company = (Company) crudManager.find(Company.class, serverDTO
				.getCompanyId());
		if (company != null) {
			server.setCompany(company);
		}
		server.setName(serverDTO.getName());
		server.setDescription(serverDTO.getDescription());
		server.setGrade(serverDTO.getGrade());
		server.setOrdered(false);
		server.setPhone(serverDTO.getPhone());
		server.setPicture(serverDTO.getPicture());
		server.setPosition(serverDTO.getPosition());
		server.setPrice(serverDTO.getPrice());

		crudManager.modify(server);
		return SUCCESS;
	}

	public String add() {
		Server server = new Server();
		Company company = (Company) crudManager.find(Company.class, serverDTO
				.getCompanyId());
		if (company != null) {
			server.setCompany(company);
		}
		server.setName(serverDTO.getName());
		server.setDescription(serverDTO.getDescription());
		server.setGrade(serverDTO.getGrade());
		server.setOrdered(false);
		server.setPhone(serverDTO.getPhone());
		server.setPicture(serverDTO.getPicture());
		server.setPosition(serverDTO.getPosition());
		server.setPrice(serverDTO.getPrice());
		crudManager.save(server);
		return SUCCESS;
	}

	public String delete() {
		String serverId = ServletActionContext.getRequest().getParameter(
				"serverId");
		crudManager.delete(Server.class, serverId);
		return SUCCESS;
	}

	public String showAll() {
		List<Server> serverList = crudManager.findAll(Server.class);
		ServletActionContext.getRequest().setAttribute(
				"serverList", serverList);
		return "showServerList";

	}

	public Object getModel() {
		return serverDTO;
	}
}
