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
import com.wedding.service.dao.CrudManager;
import com.wedding.service.entity.Company;
import com.wedding.service.entity.Hotel;
import com.wedding.service.entity.Message;
import com.wedding.service.entity.Server;

@SuppressWarnings( { "unchecked", "serial" })
@Component("pageDisplay")
@Scope("prototype")
public class PageDisplayDispatchAction extends ActionSupport {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	public String showIndex() {
		List<Hotel> hotHotels = crudManager.findSub(Hotel.class, 10);
		List<Company> hotCompanys = crudManager.findSub(Company.class, 10);
		List<Message> messages = crudManager.findAll(Message.class);
		List<Hotel> subHotels = new ArrayList<Hotel>();
		if (hotHotels.size() > 3) {
			subHotels = hotHotels.subList(0, 4);
		}
		List<Company> subCompanys = new ArrayList<Company>();
		if (hotCompanys.size() > 3) {
			subCompanys = hotCompanys.subList(0, 4);
		}
		if (messages.size() > 9) {
			messages = messages.subList(0, 10);
		}
		ServletActionContext.getRequest().setAttribute("messages", messages);
		ServletActionContext.getRequest().setAttribute("hotHotels", hotHotels);
		ServletActionContext.getRequest().setAttribute("subHotels", subHotels);
		ServletActionContext.getRequest().setAttribute("hotCompanys",
				hotCompanys);
		ServletActionContext.getRequest().setAttribute("subCompanys",
				subCompanys);
		return "index";
	}

	public String showMessage() {
		String type = ServletActionContext.getRequest().getParameter("type");
		List<Message> messages = new ArrayList<Message>();
		if (type != null) {
			if (type.equals("TIE")) {
				messages = crudManager.findAll(Message.class);
			} else {
				String hql = "from Message m where m.type = :type";
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("type", type);
				messages = crudManager.executeQuery(hql, map);
			}
			ServletActionContext.getRequest().setAttribute("type", type);
		} else {
			ServletActionContext.getRequest().setAttribute("type", "ALL");
			messages = crudManager.findAll(Message.class);
		}
		ServletActionContext.getRequest().setAttribute("messages", messages);
		return "messages";
	}

	public String showServer() {
		String position = ServletActionContext.getRequest().getParameter(
				"position");
		List<Server> servers = new ArrayList<Server>();
		if (position != null) {
			String hql = "from Server s where s.position = :position and s.ordered=false";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("position", position);
			servers = crudManager.executeQuery(hql, map);
			ServletActionContext.getRequest()
					.setAttribute("position", position);
		} else {
			ServletActionContext.getRequest().setAttribute("position", "ALL");
			servers = crudManager.findSub(Server.class, 20);
			List<Server> toList = new ArrayList<Server>();
			for (Server s : servers) {
				if (s.isOrdered()) {
					toList.add(s);
				}
			}
			servers.remove(toList);
		}
		ServletActionContext.getRequest().setAttribute("servers", servers);
		return "servers";
	}

	public String showSingleServer() {
		String serverId = ServletActionContext.getRequest().getParameter(
				"serverId");
		Server server = (Server) crudManager.find(Server.class, Integer
				.parseInt(serverId));
		ServletActionContext.getRequest().setAttribute("server", server);
		return "server";
	}

	public String showSingleHotel() {
		String hotelId = ServletActionContext.getRequest().getParameter(
				"hotelId");
		Hotel hotel = (Hotel) crudManager.find(Hotel.class, Integer
				.parseInt(hotelId));
		ServletActionContext.getRequest().setAttribute("hotel", hotel);
		return "hotel";
	}

	public String showSingleCompany() {
		String companyId = ServletActionContext.getRequest().getParameter(
				"companyId");
		Company company = (Company) crudManager.find(Company.class, Integer
				.parseInt(companyId));
		String hhql = "from Hotel h where h.company.id=:id";
		String shql = "from Server s where s.company.id=:id";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", Integer.parseInt(companyId));
		List<Hotel> hotels = crudManager.executeQuery(hhql, map);
		List<Server> servers = crudManager.executeQuery(shql, map);
		ServletActionContext.getRequest().setAttribute("company", company);
		ServletActionContext.getRequest().setAttribute("hotels", hotels);
		ServletActionContext.getRequest().setAttribute("servers", servers);
		return "company";
	}

	public String showHotel() {
		String grade = ServletActionContext.getRequest().getParameter("grade");
		List<Hotel> hotels = new ArrayList<Hotel>();
		if (grade != null) {
			String hql = "from Hotel h where h.grade between :sta and :end";
			Map<String, Object> map = new HashMap<String, Object>();
			if ("HIGHT".equalsIgnoreCase(grade)) {
				map.put("sta", 4);
				map.put("end", 5);
				ServletActionContext.getRequest()
						.setAttribute("grade", "HIGHT");
			} else if ("MIDDLE".equalsIgnoreCase(grade)) {
				map.put("sta", 2);
				map.put("end", 3);
				ServletActionContext.getRequest().setAttribute("grade",
						"MIDDLE");
			} else {
				map.put("sta", 0);
				map.put("end", 1);
				ServletActionContext.getRequest().setAttribute("grade",
						"COMMON");
			}
			hotels = crudManager.executeQuery(hql, map);
		} else {
			ServletActionContext.getRequest().setAttribute("grade", "ALL");
			hotels = crudManager.findSub(Hotel.class, 20);
		}
		ServletActionContext.getRequest().setAttribute("hotels", hotels);
		return "hotels";
	}

	public String showCompany() {
		String type = ServletActionContext.getRequest().getParameter("type");
		List<Company> companys = new ArrayList<Company>();
		if (type != null) {
			String hql = "from Company c where c.grade between :sta and :end";
			Map<String, Object> map = new HashMap<String, Object>();
			if ("CHINA".equalsIgnoreCase(type)) {
				map.put("sta", 3);
				map.put("end", 5);
				ServletActionContext.getRequest().setAttribute("type", "CHINA");
			} else if ("CREATIVE".equalsIgnoreCase(type)) {
				map.put("sta", 1);
				map.put("end", 4);
				ServletActionContext.getRequest().setAttribute("type",
						"CREATIVE");
			} else if ("FOREIGN".equalsIgnoreCase(type)) {
				map.put("sta", 2);
				map.put("end", 5);
				ServletActionContext.getRequest().setAttribute("type",
						"FOREIGN");
			} else {
				map.put("sta", 0);
				map.put("end", 1);
				ServletActionContext.getRequest().setAttribute("type", "MINI");
			}
			companys = crudManager.executeQuery(hql, map);
		} else {
			ServletActionContext.getRequest().setAttribute("type", "ALL");
			companys = crudManager.findSub(Company.class, 20);
		}
		ServletActionContext.getRequest().setAttribute("companys", companys);
		return "companys";
	}

}
