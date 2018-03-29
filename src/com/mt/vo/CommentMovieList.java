package com.mt.vo;

import java.util.Date;

public class CommentMovieList {
	private int id=0;
	private String content=null;
	private Date time;
	private int starNumber=0;
	private String starUId=null;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getStarNumber() {
		return starNumber;
	}
	public void setStarNumber(int starNumber) {
		this.starNumber = starNumber;
	}
	public String getStarUId() {
		return starUId;
	}
	public void setStarUId(String starUId) {
		this.starUId = starUId;
	}
	
}
