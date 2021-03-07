package com.wedding.service.entity;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Message {
	private int id;
	private String releaser;
	private Date createTime;
	private String subject;
	private String type;
	private String description;
	private Map<String, String> reply = new HashMap<String, String>();

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Map<String, String> getReply() {
		return reply;
	}

	public void setReply(Map<String, String> reply) {
		this.reply = reply;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getReleaser() {
		return releaser;
	}

	public void setReleaser(String releaser) {
		this.releaser = releaser;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
