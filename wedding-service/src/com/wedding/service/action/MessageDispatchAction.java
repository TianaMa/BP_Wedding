package com.wedding.service.action;

import java.util.ArrayList;
import java.util.Date;
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
import com.wedding.service.dto.MessageDTO;
import com.wedding.service.entity.Customer;
import com.wedding.service.entity.Message;

@SuppressWarnings( { "unchecked", "serial" })
@Component("pageDisplay")
@Scope("prototype")
public class MessageDispatchAction extends ActionSupport implements ModelDriven {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	MessageDTO messageDTO = new MessageDTO();

	public Object getModel() {
		return messageDTO;
	}

	public String leave() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		if (customer == null) {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"You must login firstly!");
			return "to_login";
		}
		Message message = new Message();
		message.setType(messageDTO.getType());
		message.setSubject(messageDTO.getSubject());
		message.setCreateTime(new Date());
		message.setDescription(messageDTO.getDescription());
		message.setReleaser(customer.getName());
		crudManager.save(message);
		return "show";
	}

	public String reply() {
		Message message = (Message) crudManager.find(Message.class, messageDTO
				.getId());
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		if (customer == null) {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"You must login firstly!");
			return "to_login";
		} else {
			Map<String, String> map = message.getReply();
			map.put(messageDTO.getReply(), customer.getName());
			message.setReply(map);
			crudManager.modify(message);
			customer.setMessage(message);
			crudManager.modify(customer);
			Message mess = (Message) crudManager.find(Message.class, messageDTO
					.getId());
			ServletActionContext.getRequest().setAttribute("message", mess);
			return "message";
		}
	}

	public String show() {
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

	public String unfold() {
		int id = Integer.valueOf(ServletActionContext.getRequest()
				.getParameter("id"));
		Message message = (Message) crudManager.find(Message.class, id);
		ServletActionContext.getRequest().setAttribute("message", message);
		return "message";
	}

}
