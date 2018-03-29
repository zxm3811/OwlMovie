package com.mt.vo;


public class Series {

	private int id;
	private String name;
	private String description;
	private int starNumber;
	private String starUid;
	private String movieList;
	private int commentNumber;
	/*public Series(int starNumber,String starUid,String movieList,int commentNumber){
		this.starNumber=starNumber;
		this.starUid=starUid;
		this.movieList=movieList;
		this.commentNumber=commentNumber;
		
	}*/
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
	public String getMovieList() {
		return movieList;
	}
	public void setMovieList(String movieList) {
		this.movieList = movieList;
	}
	public int getCommentNumber() {
		return commentNumber;
	}
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	

}
