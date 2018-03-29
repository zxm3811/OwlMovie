package com.mt.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mt.dao.ICommentDao;
import com.mt.mysql.Mysql;
import com.mt.vo.Comment;

public class CommentDaoImpl implements ICommentDao {

	Mysql mysql = null;
	
	public CommentDaoImpl() {
		mysql = new Mysql();
	}

	protected void finalize(){
		mysql.releaseConn();
	}
	
	@Override
	public List<Comment> findByAll(String keyword) throws Exception {
		// TODO Auto-generated method stub
		
		List<Comment> rs = new ArrayList<Comment>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from comment where id like ? or uid like ? or content like ?  or starNumber like ? or mid like ? or mname like ? or date like binary ? order by starNumber DESC";
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
			Comment comment = new Comment();
        	map = list.get(i);
        	comment.setId((Integer)map.get("id"));
        	comment.setUid((Integer)map.get("uid"));
        	comment.setContent((String)map.get("content"));
        	comment.setStarNumber((Integer)map.get("starNumber"));
        	comment.setMid((Integer)map.get("mid"));
        	comment.setMname((String)map.get("mname"));
        	comment.setDate((Date)map.get("date"));
        	rs.add(comment);
		}
		mysql.releaseConn();
		
		return rs;
	}

	@Override
	public boolean doInsertComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
				
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "insert into comment (id,uid,content,starNumber,mid,mname,date) values (?,?,?,?,?,?,?)";
		params.add(comment.getId());
		params.add(comment.getUid());
		params.add(comment.getContent());
		params.add(comment.getStarNumber());
		params.add(comment.getMid());
		params.add(comment.getMname());
		params.add(comment.getDate());
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();

		return flag;
	}

	@Override
	public boolean doDeleteComment(String id) throws Exception {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "delete from comment where id = ?";
		params.add(id);
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();
		
		return flag;
	}

	@Override
	public List<Comment> findByMid(int mid) throws Exception {
		// TODO Auto-generated method stub
		
		List<Comment> rs = new ArrayList<Comment>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from comment where mid = ? order by starNumber DESC";
		params.add(mid);
		mysql.getConnection();
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Comment comment = new Comment();
        	map = list.get(i);
        	comment.setId((Integer)map.get("id"));
        	comment.setUid((Integer)map.get("uid"));
        	comment.setContent((String)map.get("content"));
        	comment.setStarNumber((Integer)map.get("starNumber"));
        	comment.setMid((Integer)map.get("mid"));
        	comment.setMname((String)map.get("mname"));
        	comment.setDate((Date)map.get("date"));
        	rs.add(comment);
		}
		mysql.releaseConn();
		
		return rs;
	}
	
	public List<Comment> findAllOrderById() throws Exception {
		List<Comment> rs = new ArrayList<Comment>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from comment where 1 order by id";
		mysql.getConnection();
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Comment comment = new Comment();
        	map = list.get(i);
        	comment.setId((Integer)map.get("id"));
        	comment.setUid((Integer)map.get("uid"));
        	comment.setContent((String)map.get("content"));
        	comment.setStarNumber((Integer)map.get("starNumber"));
        	comment.setMid((Integer)map.get("mid"));
        	comment.setMname((String)map.get("mname"));
        	comment.setDate((Date)map.get("date"));
        	rs.add(comment);
		}
		mysql.releaseConn();
		
		return rs;
	}

}
