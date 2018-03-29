package com.mt.dao.impl;

import java.security.MessageDigest;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.swing.text.DateFormatter;

import Decoder.BASE64Encoder;

import com.mt.dao.IUserDao;
import com.mt.mysql.Mysql;
import com.mt.vo.Movie;
import com.mt.vo.User;

public class UserDaoImpl implements IUserDao {

	private Mysql mysql = null;
	
	public UserDaoImpl(){
		mysql = new Mysql();
		mysql.getConnection();
	}
	
	protected void finalize(){
		mysql.releaseConn();
	}
	
	@Override
	public User findUserById(int id) throws Exception {
		String sql = "select * from user where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		List<Map<String, Object>> list = mysql.findMoreResult(sql, params);
		User user = new User();
		if(list.size() != 0){
			Map<String, Object> item = list.get(0);
			user.setId(id);
			user.setName((String) item.get("name"));
			user.setPassword((String) item.get("password"));
			user.setSex((Integer) item.get("sex"));
			user.setCommentNumber((Integer) item.get("commentNumber"));
			user.setStar((String) item.get("star"));
			user.setEmail((String) item.get("email"));
			user.setStateCode((Integer) item.get("stateCode"));
			user.setArea((String) item.get("area"));
			user.setBirthday((Date) item.get("birthday"));
			System.out.println(user.getName());
			user.setDescription((String) item.get("description"));
		}
		else{
			user = null;
		}
		
		return user;
	}

	@Override
	public boolean doUpdateInfo(User user) throws Exception {
		String sql = "update user set name=?, password=?, stateCode=?, star=?, sex=?, commentNumber=?, area=?, birthday=?, description=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(user.getName());
		params.add(user.getPassword());
		params.add(user.getStateCode());
		params.add(user.getStar());
		params.add(user.getSex());
		params.add(user.getCommentNumber());
		params.add(user.getArea());
		params.add(user.getBirthday());
		params.add(user.getDescription());
		params.add(user.getId());
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}

	@Override
	public boolean doInsertUser(User user) throws Exception {
		String sql = "insert into user (id, name, password, sex, commentNumber, star, email, stateCode, area, birthday, description) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(user.getId());
		params.add(user.getName());
		params.add(user.getPassword());
		params.add(user.getSex());
		params.add(user.getCommentNumber());
		params.add(user.getStar());
		params.add(user.getEmail());
		params.add(user.getStateCode());
		params.add(user.getArea());
		params.add(user.getBirthday());
		params.add(user.getDescription());
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}

	@Override
	public boolean doUserIdentify(User user) throws Exception {
		boolean flag = false;
		String password = user.getPassword();
		int id = user.getId();
		String sql = "select * from user where id=? and password=?";
		List<Object> params = new ArrayList<Object>();
		params.add(id);
		params.add(EncoderByMd5(password));
		List<Map<String, Object>> res = mysql.findMoreResult(sql, params);
		if(res.size() > 0){
			flag = true;
		}
		
		return flag;
	}
	
	public String EncoderByMd5(String str) throws Exception{
		MessageDigest md5=MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
		return newstr;
	}
	@Override
	public boolean doInsertLikeMovie(int movieId, int userId) throws Exception {
		String sql = "select * from user where id=?";
		List<Object> params1 = new ArrayList<Object>();
		params1.add(userId);
		Map<String, Object> item = mysql.findSimpleResult(sql, params1);
		String star = (String) item.get("star");
		
		boolean hasLike = this.doHasLike(movieId, userId);
		if(hasLike){
			String rep = ";"+movieId+";";
			star = star.replace(rep, "");
			System.out.println("已经喜欢了2222"+star+" "+rep);
		}
		else{
			star += ";"+movieId+";";
		}
		
		String sql2 = "update user set star=? where id=?";
		System.out.println(star);
		List<Object> params = new ArrayList<Object>();
		params.add(star);
		params.add(userId);
		System.out.println(sql2+movieId+userId);
		boolean flag = mysql.updateByPreparedStatement(sql2, params);
		
		return flag;
	}

	@Override
	public boolean doHasLike(int movieId, int userId) throws Exception {
		boolean flag = true;
		String sql = "select * from user where id=? and star like ?";
		List<Object> params = new ArrayList<Object>();
		params.add(userId);
		params.add("%"+movieId+"%");
		Map<String, Object> item = mysql.findSimpleResult(sql, params);
		if(item.size() != 0){
			flag = true;
		}
		else{
			flag = false;
		}
		
		return flag;
	}

	@Override
	public List<Movie> findLikeMovie(int userId) throws Exception {
		List<Movie> movies = new ArrayList<Movie>();
		MovieDaoImpl mov = new MovieDaoImpl();
		User user = this.findUserById(userId);
		String star = user.getStar();
		String[] movieList = star.split(";*;");
		for(int i = 1; i < movieList.length; i++){
			Movie movie = mov.findMovieById(Integer.parseInt(movieList[i]));
			movies.add(movie);
		}
		
		return movies;
	}
	
	public int findReviewNumberByUserId(int userid) throws Exception{
		String sql = "select * from filmreview where uid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(userid);
		List<Map<String, Object>> map = mysql.findMoreResult(sql, params);
		return map.size();
	}
	
	public int findMovieListNumberByUserId(int userid) throws Exception{
		String sql = "select * from movielist where uid=?";
		List<Object> params = new ArrayList<Object>();
		params.add(userid);
		List<Map<String, Object>> map = mysql.findMoreResult(sql, params);
		
		return map.size();
	}
	
	public int findLikeMovieNumberByUserId(int userid) throws Exception{
		User user = new User();
		UserDaoImpl use = new UserDaoImpl();
		user = use.findUserById(userid);
		String star = user.getStar();
		String[] tmp = star.split(";*;");
		
		return (tmp.length-1) < 0 ? 0 :tmp.length-1;
	}

	public List<String> findAllStars() throws Exception{
		String sql = "select * from user where 1";
		List<Map<String, Object>> items = mysql.findMoreResult(sql, null);
		List<String> stars = new ArrayList<String>();
		if(items.size() != 0){
			int num = items.size();
			for(int i = 0; i < num; i++){
				Map<String, Object> item = items.get(i);
				String str = (String) item.get("star");
				stars.add(str);
			}
		}
		
		return stars;
	}
	
	public boolean doDeleteUserById(String userid) throws Exception {
		String sql = "delete from user where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(userid);
		boolean flag = false;
		flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}
	
	public List<User> findUserOrderById() throws Exception {
		List<User> ret = new ArrayList<User>();
		String sql = "select * from user where 1 order by id";
		List<Map<String, Object>> items = mysql.findMoreResult(sql, null);
		int num = items.size();
		if(num > 0){
			for(int i = 0; i < num; i++){
				User user = new User();
				Map<String, Object> item = items.get(i);
				user.setId((Integer) item.get("id"));
				user.setName((String) item.get("name"));
				user.setPassword((String) item.get("password"));
				user.setSex((Integer) item.get("sex"));
				user.setCommentNumber((Integer) item.get("commentNumber"));
				user.setStar((String) item.get("star"));
				user.setEmail((String) item.get("email"));
				user.setStateCode((Integer) item.get("stateCode"));
				user.setArea((String) item.get("area"));
				user.setBirthday((Date) item.get("birthday"));
				user.setDescription((String) item.get("description"));
				ret.add(user);
			}
		}
		return ret;
	}
	
}
