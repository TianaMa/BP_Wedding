package com.wedding.service.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.wedding.service.dao.CrudManager;
import com.wedding.service.dto.CustomerDTO;
import com.wedding.service.entity.Company;
import com.wedding.service.entity.Customer;
import com.wedding.service.entity.Hotel;
import com.wedding.service.entity.Message;
import com.wedding.service.entity.Order;
import com.wedding.service.entity.Server;
import com.wedding.service.entity.ShoppingCart;

@SuppressWarnings( { "unchecked", "serial" })
@Component("pageDisplay")
@Scope("prototype")
public class CustomerDispatchAction extends ActionSupport implements
		ModelDriven {

	private CrudManager crudManager;

	@Resource(name = "crudManager")
	public void setCrudManager(CrudManager crudManager) {
		this.crudManager = crudManager;
	}

	CustomerDTO customerDto = new CustomerDTO();

	public Object getModel() {
		return customerDto;
	}

	public String register() {
		String hql = "from Customer customer where customer.name=:name";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", customerDto.getName());
		List<Customer> register = crudManager.executeQuery(hql, map);
		if (register.size() > 0) {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"The username has been used, please register again!");
			return "register_error";
		} else {
			Customer customer = new Customer();
			customer.setAddress(customerDto.getAddress());
			customer.setName(customerDto.getName());
			customer.setPassword(customerDto.getPassword());
			customer.setPhone(customerDto.getPhone());
			customer.setEmail(customerDto.getEmail());
			ShoppingCart cart = new ShoppingCart();
			customer.setCart(cart);
			crudManager.save(customer);
			ServletActionContext.getRequest().setAttribute(ERROR,
					"You have registered successfully!");
			return "register_success";
		}
	}

	public String login() {
		String hql = "from Customer customer where customer.name=:name and customer.password =:password";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", customerDto.getName());
		map.put("password", customerDto.getPassword());
		List<Customer> login = crudManager.executeQuery(hql, map);
		if (login.size() > 0) {
			ServletActionContext.getRequest().getSession().setAttribute(
					"customer", login.get(login.size() - 1));
			ServletActionContext.getRequest().getSession().setAttribute(
					"shoppingCart", login.get(login.size() - 1).getCart());
			return "login_success";
		} else {
			ServletActionContext
					.getRequest()
					.setAttribute(ERROR,
							"The name or password is incorrect, please entry them again!");
			return "login_error";
		}
	}

	public String adapter() {
		String flag = ServletActionContext.getRequest().getParameter("flag");
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		if (customer == null) {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"You must login firstly!");
			return "to_login";
		} else {
			if ("modify".equalsIgnoreCase(flag)) {
				return "to_modify";
			} else if ("order".equalsIgnoreCase(flag)) {
				return "to_order";
			} else if ("myorder".equalsIgnoreCase(flag)) {
				return "to_myorder";
			} else if ("shoppingcart".equalsIgnoreCase(flag)) {
				return "to_shoppingcart";
			} else {
				return "login_success";
			}
		}
	}

	public String modify() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		customer.setAddress(customerDto.getAddress());
		customer.setPassword(customerDto.getPassword());
		customer.setPhone(customerDto.getPhone());
		customer.setEmail(customerDto.getEmail());
		crudManager.modify(customer);
		ServletActionContext.getRequest().setAttribute(ERROR,
				"You have updated your infomaction successfully!");
		return "modify_success";
	}

	public String order() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		ShoppingCart cart = (ShoppingCart) crudManager.find(ShoppingCart.class,
				customer.getCart().getId());
		Set<Server> servers = cart.getServer();
		Set<Company> companys = cart.getCompany();
		Set<Hotel> hotels = cart.getHotel();

		if (companys != null && companys.size() > 1) {
			ServletActionContext.getRequest().getSession().setAttribute(ERROR,
					"You can only chose one Company");
			return "to_shoppingcart";
		} else if (hotels != null && hotels.size() > 1) {
			ServletActionContext.getRequest().getSession().setAttribute(ERROR,
					"You can only chose one Hotel");
			return "to_shoppingcart";
		} else if ((companys == null || companys.size() == 0)
				&& (hotels == null || hotels.size() == 0)
				&& (servers == null || servers.size() == 0)) {
			ServletActionContext.getRequest().getSession().setAttribute(ERROR,
					"You must chose one or more goods");
			return "to_shoppingcart";
		} else {
			double total = 0.0;
			Order order = new Order();
			Iterator<Company> company = companys.iterator();
			Iterator<Server> server = servers.iterator();
			Iterator<Hotel> hotel = hotels.iterator();

			while (hotel.hasNext()) {
				if (company.hasNext()
						&& hotel.next().getCompany().getId() != company.next()
								.getId()) {
				} else {
					Hotel hot = hotel.next();
					for (Order o : customer.getOrder()) {
						if (o != null && hot != null
								&& o.getHotel().getId() == hot.getId()) {
							ServletActionContext
									.getRequest()
									.getSession()
									.setAttribute(ERROR, "The hotel is ordered");
							return "to_shoppingcart";
						}
					}
					order.setHotel(hot);
					total += hot.getPrice();
					hot.getOrder().add(order);
					hot.getScheduled().add(new Date());
					hot.setOrdered(true);
					crudManager.save(hot);
				}
			}

			while (company.hasNext()) {
				Company comp = company.next();
				order.setCompany(comp);
				total += comp.getPrice();
				comp.getOrder().add(order);
				comp.setOrdered(true);
				crudManager.save(comp);
			}
			while (server.hasNext()) {
				if (company.hasNext()
						&& server.next().getCompany().getId() == company.next()
								.getId()) {
					ServletActionContext.getRequest().getSession()
							.setAttribute(ERROR, "Some goods are ordered");
					return "to_shoppingcart";
				} else {
					Server serv = server.next();
					serv.getOrder().add(order);
					serv.setOrdered(true);
					order.getServer().add(serv);
					total += serv.getPrice();
					crudManager.save(serv);
				}
			}
			customer.getOrder().add(order);
			order.setTime(new Date());
			order.setNumber(UUID.randomUUID().toString());
			order.setCustomer(customer);
			order.setTotal(total);

			cart.setCompany(new HashSet<Company>());
			cart.setServer(new HashSet<Server>());
			cart.setTime(new Date());
			cart.setHotel(new HashSet<Hotel>());
			crudManager.modify(cart);

			crudManager.save(customer);

			crudManager.save(order);
		}
		return "to_myorder";
	}

	public String shoppingCart() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		if (customer == null) {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"You must login firstly!");
			return "to_login";
		} else {
			String companyId = ServletActionContext.getRequest().getParameter(
			"companyId");
			
			String hotelId = ServletActionContext.getRequest().getParameter(
					"hotelId");
			String serverId = ServletActionContext.getRequest().getParameter(
					"serverId");
			ShoppingCart shoppingCart = customer.getCart();
			if (companyId != null) {
				Company company = (Company) crudManager.find(Company.class,
						Integer.parseInt(companyId));
				shoppingCart.getCompany().add(company);
			}
			if (hotelId != null) {
				Hotel hotel = (Hotel) crudManager.find(Hotel.class, Integer
						.parseInt(hotelId));
			    shoppingCart.getHotel().add(hotel);
			}
			if (serverId != null) {
				Server server = (Server) crudManager.find(Server.class, Integer
						.parseInt(serverId));
				shoppingCart.getServer().add(server);
			}
			shoppingCart.setCustomer(customer);
			crudManager.modify(shoppingCart);
			return "to_shoppingcart";
		}
	}

	public String cancel() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		if (customer == null) {
			ServletActionContext.getRequest().setAttribute(ERROR,
					"You must login firstly!");
			return "to_login";
		} else {
			String companyId = ServletActionContext.getRequest().getParameter(
					"companyId");
			String hotelId = ServletActionContext.getRequest().getParameter(
					"hotelId");
			String serverId = ServletActionContext.getRequest().getParameter(
					"serverId");
			ShoppingCart shoppingCart = customer.getCart();
			if (companyId != null) {
				Set<Company> companys = new HashSet<Company>();
				for (Company company : shoppingCart.getCompany()) {
					if (company.getId() != Integer.parseInt(companyId)) {
						companys.add(company);
					}
				}
				shoppingCart.setCompany(new HashSet<Company>());
				shoppingCart.getCompany().addAll(companys);
			}
			if (hotelId != null) {
				Set<Hotel> hotels = new HashSet<Hotel>();
				for (Hotel hotel : shoppingCart.getHotel()) {
					if (hotel.getId() != Integer.parseInt(hotelId)) {
						hotels.add(hotel);
					}
				}
				shoppingCart.setHotel(new HashSet<Hotel>());
				shoppingCart.getHotel().addAll(hotels);
			}
			if (serverId != null) {
				Set<Server> servers = new HashSet<Server>();
				for (Server server : shoppingCart.getServer()) {
					if (server.getId() != Integer.parseInt(serverId)) {
						servers.add(server);
					}
				}
				shoppingCart.setServer(new HashSet<Server>());
				shoppingCart.getServer().addAll(servers);
			}
			shoppingCart.setCustomer(customer);
			crudManager.modify(shoppingCart);
			return "to_shoppingcart";
		}
	}

	public String showOrder() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		List<Order> orderList = crudManager.findAll(Order.class);
		List<Order> toList = new ArrayList<Order>();
		for (Order o : orderList) {
			if (o.getCustomer().getId() == customer.getId()) {
				toList.add(o);
			}
		}
		ServletActionContext.getRequest().setAttribute("orders", toList);
		return "order";
	}

	public String showCart() {
		Customer customer = (Customer) ServletActionContext.getRequest()
				.getSession().getAttribute("customer");
		customer = (Customer) crudManager
				.find(Customer.class, customer.getId());
		ShoppingCart shoppingCart = customer.getCart();
		ServletActionContext.getRequest().getSession().setAttribute("customer",
				customer);
		ServletActionContext.getRequest().getSession().setAttribute(
				"shoppingCart", shoppingCart);
		return "shoppingCart";
	}

	public String showIndex() {
		List<Hotel> hotHotels = crudManager.findSub(Hotel.class, 10);
		List<Company> hotCompanys = crudManager.findSub(Company.class, 10);
		List<Hotel> subHotels = new ArrayList<Hotel>();
		if (hotHotels.size() > 3) {
			subHotels = hotHotels.subList(0, 4);
		}
		List<Company> subCompanys = new ArrayList<Company>();
		if (hotCompanys.size() > 3) {
			subCompanys = hotCompanys.subList(0, 4);
		}
		List<Message> messages = crudManager.findAll(Message.class);
		ServletActionContext.getRequest().setAttribute("messages", messages);
		ServletActionContext.getRequest().setAttribute("hotHotels", hotHotels);
		ServletActionContext.getRequest().setAttribute("subHotels", subHotels);
		ServletActionContext.getRequest().setAttribute("hotCompanys",
				hotCompanys);
		ServletActionContext.getRequest().setAttribute("subCompanys",
				subCompanys);
		return SUCCESS;
	}

	public String exit() {
		ServletActionContext.getRequest().getSession().removeAttribute(
				"customer");
		ServletActionContext.getRequest().getSession().removeAttribute(
				"shoppingCart");
		return "exit_success";
	}

}
