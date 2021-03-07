package com.wedding.service.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Hotel {
	private int id;
	private String name;
	private String phone;
	private String address;
	private List<Date> scheduled = new ArrayList<Date>();
	private double price;
	private String description;
	private String picture;
	private int grade;
	private Company company;
	private List<Order> order = new ArrayList<Order>();
	private boolean ordered;
	
	public boolean isOrdered() {
		return ordered;
	}

	public void setOrdered(boolean ordered) {
		this.ordered = ordered;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Date> getScheduled() {
		return scheduled;
	}

	public void setScheduled(List<Date> scheduled) {
		this.scheduled = scheduled;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

}
