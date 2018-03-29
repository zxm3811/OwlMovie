package com.mt.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.mt.dao.ICommenMovieListDao;
import com.mt.mysql.Mysql;
import com.mt.vo.Comment;
import com.mt.vo.CommentMovieList;

public class CommentMovieListDaoImpl implements ICommenMovieListDao {
	Mysql mysql = null;

	public CommentMovieListDaoImpl() {
		mysql = new Mysql();
		mysql.getConnection();
	}

	protected void finalize() {
		mysql.releaseConn();
	}

	@Override
	public List<CommentMovieList> findCommentMovieListByMovieListId(int Id)
			throws Exception {
		// TODO Auto-generated method stub
		List<CommentMovieList> rs = new ArrayList<CommentMovieList>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		String sql = "select * from commentmovieList where id = ? order by starNumber DESC";
		params.add(Id);
		
		list = mysql.findMoreResult(sql, params);
		for (int i = 0; i < list.size(); i++) {
			CommentMovieList commentMovieList = new CommentMovieList();
			map = list.get(i);
			commentMovieList.setId((Integer) map.get("id"));
			commentMovieList.setContent((String) map.get("content"));
			commentMovieList.setStarNumber((Integer) map.get("starNumber"));
			commentMovieList.setStarUId((String) map.get("starUId"));
			commentMovieList.setTime((Date) map.get("time"));
			rs.add(commentMovieList);
		}

		return rs;
	}

	@Override
	public boolean doInsertCommentMovieList(CommentMovieList commentMovieList)
			throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "insert into commentmovieList (id,content,time,starNumber,starUId) values (NULL,?,?,?,?)";
		params.add(commentMovieList.getContent());
		params.add(commentMovieList.getTime());
		params.add(commentMovieList.getStarNumber());
		params.add(commentMovieList.getStarUId());
		flag = mysql.updateByPreparedStatement(sql, params);
		return flag;
	}

	@Override
	public boolean doDeleteCommentMovieList(int commentMovieListId)
			throws Exception {
		// TODO Auto-generated method stub
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "delete from commentmovieListId where id = ?";
		params.add(commentMovieListId);
		flag = mysql.updateByPreparedStatement(sql, params);
		return flag;
	}

}
