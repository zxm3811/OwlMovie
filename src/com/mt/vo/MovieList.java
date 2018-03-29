package com.mt.vo;

import java.util.Date;

public class MovieList {
	private int id;
	private String name;
	private String description;
	private Date createTime;
	private int uid;
	private int starNumber;
	private String starUid;
	private String movieList;
	private int commentNumber;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMovieList() {
		return movieList;
	}
	public void setMovieList(String movieList) {
		this.movieList = movieList;
	}
	public String getStarUid() {
		return starUid;
	}
	public void setStarUid(String starUid) {
		this.starUid = starUid;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getStarNumber() {
		return starNumber;
	}
	public void setStarNumber(int starNumber) {
		this.starNumber = starNumber;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}

}
