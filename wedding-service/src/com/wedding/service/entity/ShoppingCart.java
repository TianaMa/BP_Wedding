package com.wedding.service.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class ShoppingCart {
	private int id;
	private Date time;
	private Customer customer;
	private Set<Server> server = new HashSet<Server>();
	private Set<Company> company = new HashSet<Company>();
	private Set<Hotel> hotel = new HashSet<Hotel>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Set<Server> getServer() {
		return server;
	}

	public void setServer(Set<Server> server) {
		this.server = server;
	}

	public Set<Company> getCompany() {
		return company;
	}

	public void setCompany(Set<Company> company) {
		this.company = company;
	}

	public Set<Hotel> getHotel() {
		return hotel;
	}

	public void setHotel(Set<Hotel> hotel) {
		this.hotel = hotel;
	}

}
