package com.wedding.service.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wedding.service.dao.CrudManager;
import com.wedding.service.dto.CompanyDTO;
import com.wedding.service.entity.Company;
import com.wedding.service.entity.Hotel;
import com.wedding.service.entity.Server;

@SuppressWarnings( { "unchecked", "serial" })
@Component("company")
@Scope("prototype")
public class CompanyDispacthAction extends ActionSupport implements ModelDriven {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	private CompanyDTO companyDTO = new CompanyDTO();

	public String show() {
		int companyId = Integer.parseInt(ServletActionContext.getRequest()
				.getParameter("companyId"));
		Company company = (Company) crudManager.find(Company.class, companyId);
		ServletActionContext.getRequest().setAttribute("company", company);
		return "company";
	}

	public String modify() {
		Company company = (Company) crudManager.find(Company.class, companyDTO
				.getId());
		company.setName(companyDTO.getName());
		company.setAddress(companyDTO.getAddress());
		company.setDescription(companyDTO.getDescription());
		company.setGrade(companyDTO.getGrade());
		company.setOrdered(false);
		company.setPhone(companyDTO.getPhone());
		company.setPrice(companyDTO.getPrice());
		company.setPicture(companyDTO.getPicture());
		crudManager.modify(company);
		return SUCCESS;
	}

	public String add() {
		Company company = new Company();
		company.setName(companyDTO.getName());
		company.setAddress(companyDTO.getAddress());
		company.setDescription(companyDTO.getDescription());
		company.setGrade(companyDTO.getGrade());
		company.setOrdered(false);
		company.setPhone(companyDTO.getPhone());
		company.setPrice(companyDTO.getPrice());
		company.setPicture(companyDTO.getPicture());
		crudManager.save(company);
		return SUCCESS;
	}

	public String delete() {
		String companyId = ServletActionContext.getRequest().getParameter(
				"companyId");
		List<Server> servers = crudManager.findAll(Server.class);
		for (Server s : servers) {
			if (s.getCompany() != null
					&& s.getCompany().getId() == Integer.parseInt(companyId)) {
				s.setCompany(null);
				crudManager.modify(s);
			}
		}
		List<Hotel> hotels = crudManager.findAll(Hotel.class);
		for (Hotel h : hotels) {
			if (h.getCompany() != null
					&& h.getCompany().getId() == Integer.parseInt(companyId)) {
				h.setCompany(null);
				crudManager.modify(h);
			}
		}
		crudManager.delete(Company.class, companyId);
		return SUCCESS;
	}

	public String showAll() {
		List<Company> companyList = crudManager.findAll(Company.class);
		ServletActionContext.getRequest().setAttribute("companyList",
				companyList);
		return "showCompanyList";

	}

	public Object getModel() {
		return companyDTO;
	}
}
