package com.mt.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mt.dao.IFilmReviewDao;
import com.mt.mysql.Mysql;
import com.mt.vo.FilmReview;

public class FilmReviewDaoImpl implements IFilmReviewDao {

	Mysql mysql = null;
	
	public FilmReviewDaoImpl() {
		mysql = new Mysql();
		mysql.getConnection();
	}

	protected void finalize(){
		mysql.releaseConn();
	}
	
	@Override
	public List<FilmReview> findByAll(String keyword) throws Exception {
		List<FilmReview> rs = new ArrayList<FilmReview>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from filmreview where id like ? or uid like ? or title like ? or content like ?  or starNumber like ? or mid like ? or mname like ? or date like binary ? order by starNumber DESC";
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		mysql.getConnection();
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			FilmReview filmReview = new FilmReview();
        	map = list.get(i);
        	filmReview.setId((Integer)map.get("id"));
        	filmReview.setUid((Integer)map.get("uid"));
        	filmReview.setTitle((String)map.get("title"));
        	filmReview.setContent((String)map.get("content"));
        	filmReview.setStarNumber((Integer)map.get("starNumber"));
        	filmReview.setMid((Integer)map.get("mid"));
        	filmReview.setMname((String)map.get("mname"));
        	filmReview.setDate((Date)map.get("date"));
        	rs.add(filmReview);
		}
		mysql.releaseConn();
		
		return rs;
	}
	
	public List<FilmReview> findAllOrderById() throws Exception {
		List<FilmReview> rs = new ArrayList<FilmReview>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from filmreview where 1 order by id";
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			FilmReview filmReview = new FilmReview();
        	map = list.get(i);
        	filmReview.setId((Integer)map.get("id"));
        	filmReview.setUid((Integer)map.get("uid"));
        	filmReview.setTitle((String)map.get("title"));
        	filmReview.setContent((String)map.get("content"));
        	filmReview.setStarNumber((Integer)map.get("starNumber"));
        	filmReview.setMid((Integer)map.get("mid"));
        	filmReview.setMname((String)map.get("mname"));
        	filmReview.setDate((Date)map.get("date"));
        	rs.add(filmReview);
		}
		
		return rs;
	}

	@Override
	public boolean doInsertFilmReview(FilmReview filmReview) throws Exception {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "insert into filmreview (id,uid,title,content,starNumber,mid,mname,date) values (?,?,?,?,?,?,?,?)";
		params.add(filmReview.getId());
		params.add(filmReview.getUid());
		params.add(filmReview.getTitle());
		params.add(filmReview.getContent());
		params.add(filmReview.getStarNumber());
		params.add(filmReview.getMid());
		params.add(filmReview.getMname());
		params.add(filmReview.getDate());
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();

		return flag;
	}

	@Override
	public boolean doDeleteFilmReview(int id) throws Exception {
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "delete from filmreview where id = ?";
		params.add(id);
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();
		
		return flag;
	}
	
	public boolean doDeleteFilmReview(String id) throws Exception {
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "delete from filmreview where id = ?";
		params.add(id);
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();
		
		return flag;
	}

	@Override
	public List<FilmReview> findByMid(int mid) throws Exception {
		List<FilmReview> rs = new ArrayList<FilmReview>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from filmreview where mid = ? order by starNumber DESC";
		params.add(mid);
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			FilmReview filmReview = new FilmReview();
        	map = list.get(i);
        	filmReview.setId((Integer)map.get("id"));
        	filmReview.setUid((Integer)map.get("uid"));
        	filmReview.setTitle((String)map.get("title"));
        	filmReview.setContent((String)map.get("content"));
        	filmReview.setStarNumber((Integer)map.get("starNumber"));
        	filmReview.setMid((Integer)map.get("mid"));
        	filmReview.setMname((String)map.get("mname"));
        	filmReview.setDate((Date)map.get("date"));
        	rs.add(filmReview);
		}
		
		return rs;
	}
	
	public List<FilmReview> findByUserId(int userid) throws Exception {
		List<FilmReview> rs = new ArrayList<FilmReview>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from filmreview where uid = ?";
		params.add(userid);
		list = mysql.findMoreResult(sql, params);
		System.out.println(list.size());
		for(int i = 0; i < list.size(); i++) {
			FilmReview filmReview = new FilmReview();
        	map = list.get(i);
        	filmReview.setId((Integer)map.get("id"));
        	filmReview.setUid((Integer)map.get("uid"));
        	filmReview.setTitle((String)map.get("title"));
        	filmReview.setContent((String)map.get("content"));
        	filmReview.setStarNumber((Integer)map.get("starNumber"));
        	filmReview.setMid((Integer)map.get("mid"));
        	filmReview.setMname((String)map.get("mname"));
        	filmReview.setDate((Date)map.get("date"));
        	rs.add(filmReview);
		}
		
		return rs;
	}
	
	public FilmReview findById(int id) throws Exception {
		FilmReview filmReview = new FilmReview();
		List<Object> params = new ArrayList<Object>();
        Map<String, Object> map = null;
		String sql = "select * from filmreview where id = ?";
		params.add(id);
		map = mysql.findSimpleResult(sql, params);
		if(map.size() != 0) {
        	filmReview.setId((Integer)map.get("id"));
        	filmReview.setUid((Integer)map.get("uid"));
        	filmReview.setTitle((String)map.get("title"));
        	filmReview.setContent((String)map.get("content"));
        	filmReview.setStarNumber((Integer)map.get("starNumber"));
        	filmReview.setMid((Integer)map.get("mid"));
        	filmReview.setMname((String)map.get("mname"));
        	filmReview.setDate((Date)map.get("date"));
		}
		return filmReview;
	}

}
