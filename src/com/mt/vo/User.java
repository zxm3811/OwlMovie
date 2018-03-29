package com.mt.vo;

import java.util.Date;

public class User {
	
	private int id;
	private String name;
	private String password;
	private int sex;
	private int commentNumber;
	private String star;
	private String email;
	private int stateCode;
	private String area;
	private Date birthday;
	private String description;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public User(){
		this.setCommentNumber(0);
		this.setStateCode(0);
		this.setSex(1);
		this.setStar(null);
		this.setBirthday(new Date());
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
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStateCode(){
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public String getArea(){
		return area;
	}
	public void setArea(String area){
		this.area = area;
	}
}
