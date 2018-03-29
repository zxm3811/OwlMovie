package com.mt.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mt.dao.IMovieListDao;
import com.mt.mysql.Mysql;
import com.mt.vo.Comment;
import com.mt.vo.Movie;
import com.mt.vo.MovieList;
import com.mt.vo.User;

public class MovieListDaoImpl implements IMovieListDao {
	Mysql mysql = null;

	public MovieListDaoImpl() {
		mysql = new Mysql();
		mysql.getConnection();
	}

	protected void finalize() {
		mysql.releaseConn();
	}
	@Override
	public MovieList findMovieListByMovieListId(int movieListId) throws Exception {
		MovieList movieList = null;
		List<Object> params = new ArrayList<Object>();
		Map<String, Object> map = null;
		String sql = "select * from movielist where id = ?";
		params.add(movieListId);
		map = mysql.findSimpleResult(sql, params);
		if(map.size() != 0) {
			movieList = new MovieList();
			movieList.setId((Integer)map.get("id"));
			movieList.setName((String) map.get("name"));
			movieList.setDescription((String) map.get("description"));
			movieList.setCreateTime((Date) map.get("createTime"));
			movieList.setUid((Integer) map.get("uid"));
			movieList.setStarNumber((Integer) map.get("starNumber"));
			movieList.setStarUid((String) map.get("starUid"));
			movieList.setMovieList((String) map.get("movieList"));
			movieList.setCommentNumber((Integer) map.get("commentNumber"));
		}
		return movieList;
	}

	@Override
	public List<MovieList> findMovieListByUserId(int userId) throws Exception {
		// TODO Auto-generated method stub
		List<MovieList> rs = new ArrayList<MovieList>();
		List<Object>params = new ArrayList<Object>();
		String sql = "select * from movielist where uid = ?";
		params.add(userId);
		List<Map<String,Object>> list =mysql.findMoreResult(sql, params);
		Map<String,Object> map = null;
		for (int i=0 ;i<list.size();i++){
			map = list.get(i);
			MovieList movieList = new MovieList();
			movieList.setId((Integer) map.get("id"));
			movieList.setName((String) map.get("name"));
			movieList.setDescription((String) map.get("description"));
			movieList.setMovieList((String) map.get("movieList"));
			movieList.setStarUid((String) map.get("starUid"));
			movieList.setCreateTime((Date) map.get("createTime"));
			movieList.setUid((Integer) map.get("uid"));
			movieList.setStarNumber((Integer) map.get("starNumber"));
			movieList.setCommentNumber((Integer) map.get("commentNumber"));
			rs.add(movieList);
		}
		
		return rs;
	}

	@Override
	public List<MovieList> findAllMovieList() throws Exception {
		List<MovieList> rs = new ArrayList<MovieList>();
		Map<String,Object> map = null;
		String sql ="select * from movielist order by starNumber DESC"; 
		List<Map<String,Object>> list = mysql.findMoreResult(sql, null);
		for(int i=0; i<list.size();i++){
			map=list.get(i);
			MovieList movieList = new MovieList();
			movieList.setId((Integer) map.get("id"));
			movieList.setName((String) map.get("name"));
			movieList.setDescription((String) map.get("description"));
			movieList.setMovieList((String) map.get("movieList"));
			movieList.setStarUid((String) map.get("starUid"));
			movieList.setCreateTime((Date) map.get("createTime"));
			movieList.setUid((Integer) map.get("uid"));
			movieList.setStarNumber((Integer) map.get("starNumber"));
			movieList.setCommentNumber((Integer) map.get("commentNumber"));
			rs.add(movieList);
		}
		return rs;
	}
	
	public List<MovieList> findAllMovieListOrderById() throws Exception {
		List<MovieList> rs = new ArrayList<MovieList>();
		Map<String,Object> map = null;
		String sql ="select * from movielist order by id"; 
		List<Map<String,Object>> list = mysql.findMoreResult(sql, null);
		for(int i=0; i<list.size();i++){
			map=list.get(i);
			MovieList movieList = new MovieList();
			movieList.setId((Integer) map.get("id"));
			movieList.setName((String) map.get("name"));
			movieList.setDescription((String) map.get("description"));
			movieList.setMovieList((String) map.get("movieList"));
			movieList.setStarUid((String) map.get("starUid"));
			movieList.setCreateTime((Date) map.get("createTime"));
			movieList.setUid((Integer) map.get("uid"));
			movieList.setStarNumber((Integer) map.get("starNumber"));
			movieList.setCommentNumber((Integer) map.get("commentNumber"));
			rs.add(movieList);
		}
		return rs;
	}

	public List<String> findAllMovieListMovies() throws Exception{
		List<MovieList> movieLists = new ArrayList<MovieList>();
		List<String> ret = new ArrayList<String>();
		movieLists = this.findAllMovieList();
		int num = movieLists.size();
		for(int i= 0; i < num; i++){
			ret.add(movieLists.get(i).getMovieList());
		}
		
		return ret;
	}
	
	@Override
	public List<MovieList> findMovieListByAll(String keyword) throws Exception {
		List<MovieList> rs = new ArrayList<MovieList>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String,Object>> list = null;
		Map<String,Object>map = null;
		String sql ="select * from movielist where id like ? or name like ? or description like ? or createTime like binary ? or uid like ? or starNumber like ? or starUid like ? or movieList like ? or commentNumber like ? order by starNumber DESC"; 
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");	
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");

		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			MovieList movieList = new MovieList();
			map = list.get(i);
			movieList.setId((Integer) map.get("id"));
			movieList.setName((String) map.get("name"));
			movieList.setDescription((String) map.get("description"));
			movieList.setCreateTime((Date) map.get("createTime"));
			movieList.setUid((Integer) map.get("uid"));
			movieList.setStarNumber((Integer) map.get("starNumber"));
			movieList.setStarUid((String) map.get("starUid"));
			movieList.setMovieList((String) map.get("movieList"));
			movieList.setCommentNumber((Integer) map.get("commentNumber"));
			rs.add(movieList);
		}
		return rs;
	}
	
	@Override
	public boolean hasLikeMovieList(int userId, int movieListId) throws Exception {
		boolean flag = false;
		String sql = "select * from movielist where id=? and starUid like ?";
		List<Object> params = new ArrayList<Object>();
		params.add(movieListId);
		params.add("%"+userId+"%");
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
	public boolean doInsertMovieList(MovieList movieList) throws Exception {
		String sql = "insert into movielist (id, name,description, createTime, uid, starNumber, starUid, movieList,commentNumber) values (NULL, ?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(movieList.getName());
		params.add(movieList.getDescription());
		params.add(movieList.getCreateTime());
		params.add(movieList.getUid());
		params.add(movieList.getStarNumber());
		params.add(movieList.getStarUid());
		params.add(movieList.getMovieList());
		params.add(movieList.getCommentNumber());
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		return flag;
	}

	@Override
	public boolean doDeleteMovieList(String movieListId) throws Exception {
		String sql ="delete from movielist where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(movieListId);
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		return flag;
	}

	@Override
	public boolean doLikeMovieList(int userId, int movieListId) throws Exception {
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from movielist where id = ?";
		params.add(movieListId);
		Map<String, Object> item = mysql.findSimpleResult(sql, params);

		if(item.size() != 0) {
			String starUid = (String) item.get("starUid");
			int starNumber = (Integer) item.get("starNumber");
        
		
			boolean hasLike = this.hasLikeMovieList(userId, movieListId);
			if(hasLike){
				String rep = ";"+userId+";";
				starUid = starUid.replace(rep, "");
				starNumber--;
				System.out.println("取消赞");
			}
			else{
				starUid += ";"+userId+";";
				starNumber++;
				System.out.println("赞成功");
			}
		
			String sql2 = "update movielist set starUid=?,starNumber=? where id = ?";
			List<Object> params2 = new ArrayList<Object>();
			params2.add(starUid);
			params2.add(starNumber);
			params2.add(movieListId);
			flag = mysql.updateByPreparedStatement(sql2, params2);
		}
		
		return flag;
		
	}
	
	public boolean doInsertMovieToMovieList(int movieId, int movieListId) throws Exception{
		MovieList ml = new MovieList();
		MovieListDaoImpl mo = new MovieListDaoImpl();
		ml = mo.findMovieListByMovieListId(movieListId);
		String movielist = ml.getMovieList();
		movielist += ";"+movieId+";";
		String sql = "update set movieList=? where movieListId=?";
		List<Object> params = new ArrayList<Object>();
		params.add(movielist);
		params.add(movieListId);
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		return flag;
	}
	
	public List<MovieList> findLikeMovieListByUserId(int userid) throws Exception{
		List<MovieList> ms = new ArrayList<MovieList>();
		String sql = "select * from movielist where starUid like ?";
		List<Object> params = new ArrayList<Object>();
		params.add("%;"+userid+";%");
		List<Map<String, Object>> ls = mysql.findMoreResult(sql, params);
		int num = ls.size();
		System.out.println(num);
		for(int i = 0; i < num; i++){
			MovieList m = new MovieList();
			m.setCommentNumber((Integer) ls.get(i).get("commentNumber"));
			m.setCreateTime((Date) ls.get(i).get("createTime"));
			m.setDescription((String) ls.get(i).get("description"));
			m.setMovieList((String) ls.get(i).get("movieList"));
			m.setId((Integer) ls.get(i).get("id"));
			m.setName((String) ls.get(i).get("name"));
			m.setStarNumber((Integer) ls.get(i).get("starNumber"));
			ms.add(m);
		}
		
		return ms;
	}
	
	public String findMovieListCoverByMovieListId(int movieListId) throws Exception{
		MovieList movieList = new MovieList();
		movieList = this.findMovieListByMovieListId(movieListId);
		String movies = movieList.getMovieList();
		String [] movie = movies.split(";*;");
		Movie m = new Movie();
		MovieDaoImpl mov = new MovieDaoImpl();
		m = mov.findMovieById(Integer.parseInt(movie[1]));
		return m.getCover();
	}
}
