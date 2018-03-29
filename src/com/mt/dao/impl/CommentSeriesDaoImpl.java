package com.mt.dao.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


import com.mt.dao.ICommentSeriesDao;
import com.mt.mysql.Mysql;
import com.mt.vo.CommentSeries;
public class CommentSeriesDaoImpl implements ICommentSeriesDao{
	Mysql mysql = null;
	
	public CommentSeriesDaoImpl() {
		mysql = new Mysql();
	}

	protected void finalize(){
		mysql.releaseConn();
	}

	@Override
	public boolean doDeleteCommentSeries(int commentSeriesId) throws Exception {
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "delete from commentseries where id = ?";
		params.add(commentSeriesId);
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();
		
		return flag;
	}

	@Override
	public boolean doInsertCommentSeries(CommentSeries commentSeries)
			throws Exception {
		
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "insert into commentseries (id,content,time,starNumber,starUid) values (NULL,?,?,?,?)";
		params.add(commentSeries.getContent());
		params.add(commentSeries.getTime());
		params.add(commentSeries.getStarNumber());
		params.add(commentSeries.getStarUid());
		mysql.getConnection();
		flag = mysql.updateByPreparedStatement(sql, params);
		mysql.releaseConn();

		return flag;
	}

	@Override
	public List<CommentSeries> findCommentSeriesBySeriesId(int seriesId)
			throws Exception {
		List<CommentSeries> rs = new ArrayList<CommentSeries>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from commentseries where id = ? order by starNumber DESC";
		params.add(seriesId);
		mysql.getConnection();
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			CommentSeries commentSeries = new CommentSeries();
        	map = list.get(i);
        	commentSeries.setId((Integer)map.get("id"));
        	commentSeries.setContent((String)map.get("content"));
        	commentSeries.setTime((Date)map.get("time"));
        	commentSeries.setStarNumber((Integer)map.get("starNumber"));
        	commentSeries.setStarUid((String)map.get("starUid"));
        	
        	rs.add(commentSeries);
		}
		mysql.releaseConn();
		
		return rs;
	}

}
