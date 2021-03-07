package com.wedding.service.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wedding.service.dao.CrudManager;
import com.wedding.service.dto.HotelDTO;
import com.wedding.service.entity.Company;
import com.wedding.service.entity.Hotel;

@SuppressWarnings( { "unchecked", "serial" })
@Component("hotel")
@Scope("prototype")
public class HotelDispacthAction extends ActionSupport implements ModelDriven {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	private HotelDTO hotelDTO = new HotelDTO();

	public String show() {
		String hotelId = ServletActionContext.getRequest().getParameter(
				"hotelId");
		List<Company> companyList = crudManager.findAll(Company.class);
		ServletActionContext.getRequest().setAttribute("companyList",
				companyList);
		if (hotelId != null) {
			Hotel hotel = (Hotel) crudManager.find(Hotel.class, Integer
					.parseInt(hotelId));
			ServletActionContext.getRequest().setAttribute("hotel", hotel);
			return "hotel";
		} else {
			return ERROR;
		}
	}

	public String modify() {
		Hotel hotel = (Hotel) crudManager.find(Hotel.class, hotelDTO.getId());
		Company company = (Company) crudManager.find(Company.class, hotelDTO
				.getCompanyId());
		hotel.setName(hotelDTO.getName());
		hotel.setAddress(hotelDTO.getAddress());
		hotel.setDescription(hotelDTO.getDescription());
		hotel.setGrade(hotelDTO.getGrade());
		hotel.setOrdered(false);
		hotel.setPhone(hotelDTO.getPhone());
		hotel.setPicture(hotelDTO.getPicture());
		hotel.setPrice(hotelDTO.getPrice());
		if (company != null) {
			hotel.setCompany(company);
		}
		crudManager.modify(hotel);
		return SUCCESS;
	}

	public String add() {
		Hotel hotel = new Hotel();
		hotel.setName(hotelDTO.getName());
		hotel.setAddress(hotelDTO.getAddress());
		hotel.setDescription(hotelDTO.getDescription());
		hotel.setGrade(hotelDTO.getGrade());
		hotel.setOrdered(false);
		hotel.setPhone(hotelDTO.getPhone());
		hotel.setPicture(hotelDTO.getPicture());
		hotel.setPrice(hotelDTO.getPrice());
		Company company = (Company) crudManager.find(Company.class, hotelDTO
				.getCompanyId());
		if (company != null) {
			hotel.setCompany(company);
		}
		crudManager.save(hotel);
		return SUCCESS;
	}

	public String delete() {
		String hotelId = ServletActionContext.getRequest().getParameter(
				"hotelId");
		crudManager.delete(Hotel.class, hotelId);
		return SUCCESS;
	}

	public String showAll() {
		List<Hotel> hotelList = crudManager.findAll(Hotel.class);
		ServletActionContext.getRequest().setAttribute(
				"hotelList", hotelList);
		return "showHotelList";

	}

	public Object getModel() {
		return hotelDTO;
	}
}
