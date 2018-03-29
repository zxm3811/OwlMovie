package com.mt.dao.impl;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;





import com.mt.dao.ISeriesDao;
import com.mt.mysql.Mysql;
import com.mt.vo.Movie;
import com.mt.vo.Series;
public class SeriesDaoImpl implements ISeriesDao{
	private Mysql mysql = null;
	public SeriesDaoImpl() {
		mysql = new Mysql();
		mysql.getConnection();
	}

	protected void finalize(){
		mysql.releaseConn();
	}

	@Override
	public boolean doDeleteSeries(String seriesId) throws Exception {
		String sql="delete from series where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(seriesId);
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}

	@Override
	public boolean doInsertSeries(Series series) throws Exception {
		boolean flag = false;
		String sql = "insert into series (id,name,description,starNumber,starUid,movieList,commentNumber) values (NULL,?,?,?,?,?,?)";
		List<Object> params = new ArrayList<Object>();
		params.add(series.getName());
		params.add(series.getDescription());
		params.add(series.getStarNumber());
		params.add(series.getStarUid());
		params.add(series.getMovieList());
		params.add(series.getCommentNumber());
		flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}

	@Override
	public boolean doLikeSeries(int userId, int seriesId) throws Exception {
		boolean flag = false;
		List<Object> params = new ArrayList<Object>();
		String sql = "select * from series where id = ?";
		params.add(seriesId);
		Map<String, Object> item = mysql.findSimpleResult(sql, params);
		
		if(item.size() != 0) {
			String starUid = (String) item.get("starUid");
			int starNumber = (Integer) item.get("starNumber");
        
		
			boolean hasLike = this.hasLikeSeriesId(userId, seriesId);
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
		
			String sql2 = "update series set starUid=?,starNumber=? where id = ?";
			List<Object> params2 = new ArrayList<Object>();
			params2.add(starUid);
			params2.add(starNumber);
			params2.add(seriesId);
			flag = mysql.updateByPreparedStatement(sql2, params2);
		}
		
		return flag;

	}

	@Override
	public List<Series> findAllSeries() throws Exception {
		List<Series> rs = new ArrayList<Series>();
		List<Map<String,Object>> list = null;
		Map<String,Object> map = null;
		String sql = "Select * from series order by starNumber DESC";
		list = mysql.findMoreResult(sql,null);
		for(int i=0;i<list.size();i++){
			Series series = new Series ();
			map = list.get(i);
			series.setId((Integer)map.get("id"));
        	series.setName((String)map.get("name"));
        	series.setDescription((String)map.get("description"));
        	series.setStarNumber((Integer)map.get("starNumber"));
        	series.setStarUid((String)map.get("starUid"));
        	series.setMovieList((String)map.get("movieList"));
        	series.setCommentNumber((Integer)map.get("commentNumber"));
        	rs.add(series);
		}
		
		return rs;
	}
	
	public List<Series> findAllSeriesOrderById() throws Exception {
		List<Series> rs = new ArrayList<Series>();
		List<Map<String,Object>> list = null;
		Map<String,Object> map = null;
		String sql = "Select * from series order by id";
		list = mysql.findMoreResult(sql,null);
		for(int i=0;i<list.size();i++){
			Series series = new Series ();
			map = list.get(i);
			series.setId((Integer)map.get("id"));
        	series.setName((String)map.get("name"));
        	series.setDescription((String)map.get("description"));
        	series.setStarNumber((Integer)map.get("starNumber"));
        	series.setStarUid((String)map.get("starUid"));
        	series.setMovieList((String)map.get("movieList"));
        	series.setCommentNumber((Integer)map.get("commentNumber"));
        	rs.add(series);
		}
		
		return rs;
	}

	@Override
	public List<Series> findSeriesByAll(String keyword) throws Exception {
		List<Series> rs = new ArrayList<Series>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from series where id like ? or name like ? or description like ?  or starNumber like ? or starUid like ? or movieList like ? or commentNumber like ? order by starNumber DESC";
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");

		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Series series = new Series();
        	map = list.get(i);
        	series.setId((Integer)map.get("id"));
        	series.setName((String)map.get("name"));
        	series.setDescription((String)map.get("description"));
        	series.setStarNumber((Integer)map.get("starNumber"));
        	series.setStarUid((String)map.get("starUid"));
        	series.setMovieList((String)map.get("movieList"));
        	series.setCommentNumber((Integer)map.get("commentNumber"));
        	
        	rs.add(series);
		}
		
		return rs;
	}

	@Override
	public Series findSeriesBySeriesId(int seriesId) throws Exception {
		Series series = null;
		List<Object> params = new ArrayList<Object>();
        Map<String, Object> map = null;
        String sql = "select * from series where id = ?";
		params.add(seriesId);
		map = mysql.findSimpleResult(sql, params);
		if(map.size() != 0) {
			series = new Series();
			series.setId((Integer)map.get("id"));
			series.setName((String)map.get("name"));
			series.setDescription((String)map.get("description"));
			series.setStarNumber((Integer)map.get("starNumber"));
			series.setStarUid((String)map.get("starUid"));
			series.setMovieList((String)map.get("movieList"));
			series.setCommentNumber((Integer)map.get("commentNumber"));
		}
		return series;
	
	}

	@Override
	public boolean hasLikeSeriesId(int userId, int seriesId) throws Exception {
		boolean flag = false;
		String sql = "select * from series where id=? and starUid like ?";
		List<Object> params = new ArrayList<Object>();
		params.add(seriesId);
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
	
	public List<Series> findHotRecommandSeries() throws Exception {
		List<Series> rs = new ArrayList<Series>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from series order by starNumber DESC LIMIT 5";
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Series series = new Series();
        	map = list.get(i);
        	series.setId((Integer)map.get("id"));
        	series.setName((String)map.get("name"));
        	series.setDescription((String)map.get("description"));
        	series.setStarNumber((Integer)map.get("starNumber"));
        	series.setStarUid((String)map.get("starUid"));
        	series.setMovieList((String)map.get("movieList"));
        	series.setCommentNumber((Integer)map.get("commentNumber"));
        	
        	rs.add(series);
		}
		
		return rs;
	}
	
	public boolean doUpdateSeries(Series series) throws Exception{
		String sql = "update series set name = ?, description = ?, starNumber = ?, starUid = ?, movieList = ?, commentNumber = ? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(series.getName());
		params.add(series.getDescription());
		params.add(series.getStarNumber());
		params.add(series.getStarUid());
		params.add(series.getMovieList());
		params.add(series.getCommentNumber());
		params.add(series.getId());
		
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		return flag;
	}


}
