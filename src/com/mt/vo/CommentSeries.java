package com.mt.vo;
import java.util.Date;

public class CommentSeries {
	private int id;
	private String content;
	private Date time;
	private int starNumber;
	private String starUid;
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
	public String getStarUid() {
		return starUid;
	}
	public void setStarUid(String starUid) {
		this.starUid = starUid;
	}
	
	

}
