package com.wedding.service.dto;

import java.util.Date;


public class CustomerDTO{

	private int id;
	private String name;
	private String password;
	private String phone;
	private String address;
	private String email;
	private Date wedding;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public Date getWedding() {
		return wedding;
	}
	public void setWedding(Date wedding) {
		this.wedding = wedding;
	}
}
