package com.mt.dao.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;




import com.mt.dao.IMovieDao;
import com.mt.mysql.Mysql;
import com.mt.vo.Movie;
import com.mt.vo.User;

public class MovieDaoImpl implements IMovieDao {

	private Mysql mysql = null;
	
	public MovieDaoImpl(){
		mysql = new Mysql();
		mysql.getConnection();
	}
	
	protected void finalize(){
		mysql.releaseConn();
	}
	
	@Override
	public List<Movie> findMovieByMovieName(String movieName) throws Exception {
		List<Movie> rs = new ArrayList<Movie>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from movie where chineseName like ? or originalName like ? order by grade DESC";
		params.add("%"+movieName+"%");
		params.add("%"+movieName+"%");
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Movie movie = new Movie();
        	map = list.get(i);
        	movie.setId((Integer)map.get("id"));
        	movie.setChineseName((String)map.get("chineseName"));
        	movie.setOriginalName((String)map.get("originalName"));
        	movie.setLength((String)map.get("length"));
        	movie.setLanguage((String)map.get("language"));
        	movie.setDirector((String)map.get("director"));
        	movie.setActor((String)map.get("actor"));
        	movie.setTag((String)map.get("tag"));
        	movie.setArea((String)map.get("area"));
        	movie.setCover((String)map.get("cover"));
        	movie.setGrade((Double)map.get("grade"));
        	movie.setStarNumber((Integer)map.get("starNumber"));
        	movie.setCommentNumber((Integer)map.get("commentNumber"));
        	movie.setDescription((String)map.get("description"));
        	rs.add(movie);
		}
		
		return rs;
	}

	@Override
	public List<Movie> findMovieByTagName(String tagName) throws Exception {
		List<Movie> rs = new ArrayList<Movie>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from movie where tag like ? order by grade DESC";
		params.add("%"+tagName+"%");
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Movie movie = new Movie();
        	map = list.get(i);
        	movie.setId((Integer)map.get("id"));
        	movie.setChineseName((String)map.get("chineseName"));
        	movie.setOriginalName((String)map.get("originalName"));
        	movie.setLength((String)map.get("length"));
        	movie.setLanguage((String)map.get("language"));
        	movie.setDirector((String)map.get("director"));
        	movie.setActor((String)map.get("actor"));
        	movie.setTag((String)map.get("tag"));
        	movie.setArea((String)map.get("area"));
        	movie.setCover((String)map.get("cover"));
        	movie.setGrade((Double)map.get("grade"));
        	movie.setStarNumber((Integer)map.get("starNumber"));
        	movie.setCommentNumber((Integer)map.get("commentNumber"));
        	movie.setDescription((String)map.get("description"));
        	rs.add(movie);
		}
		
		return rs;
	}

	@Override
	public List<Movie> findMovieByAll(String keyword) throws Exception {
		List<Movie> rs = new ArrayList<Movie>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from movie where id like ? or chineseName like ? or originalName like ?  or length like ? or language like ? or director like ? or actor like ? or tag like ? or area like ? or cover like ? or grade like ? or starNumber like ? or commentNumber like ? order by grade DESC";
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
		params.add("%"+keyword+"%");
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
			Movie movie = new Movie();
        	map = list.get(i);
        	movie.setId((Integer)map.get("id"));
        	movie.setChineseName((String)map.get("chineseName"));
        	movie.setOriginalName((String)map.get("originalName"));
        	movie.setLength((String)map.get("length"));
        	movie.setLanguage((String)map.get("language"));
        	movie.setDirector((String)map.get("director"));
        	movie.setActor((String)map.get("actor"));
        	movie.setTag((String)map.get("tag"));
        	movie.setArea((String)map.get("area"));
        	movie.setCover((String)map.get("cover"));
        	movie.setGrade((Double)map.get("grade"));
        	movie.setStarNumber((Integer)map.get("starNumber"));
        	movie.setCommentNumber((Integer)map.get("commentNumber"));
        	movie.setDescription((String)map.get("description"));
        	rs.add(movie);
		}
		
		return rs;
	}
	
	public List<Movie> findAllMovieOrderById() throws Exception {
		List<Movie> rs = new ArrayList<Movie>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
        Map<String, Object> map = null;
		String sql = "select * from movie where 1 order by id";
		mysql.getConnection();
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Movie movie = new Movie();
        	map = list.get(i);
        	movie.setId((Integer)map.get("id"));
        	movie.setChineseName((String)map.get("chineseName"));
        	movie.setOriginalName((String)map.get("originalName"));
        	movie.setLength((String)map.get("length"));
        	movie.setLanguage((String)map.get("language"));
        	movie.setDirector((String)map.get("director"));
        	movie.setActor((String)map.get("actor"));
        	movie.setTag((String)map.get("tag"));
        	movie.setArea((String)map.get("area"));
        	movie.setCover((String)map.get("cover"));
        	movie.setGrade((Double)map.get("grade"));
        	movie.setStarNumber((Integer)map.get("starNumber"));
        	movie.setCommentNumber((Integer)map.get("commentNumber"));
        	movie.setDescription((String)map.get("description"));
        	rs.add(movie);
		}
		
		return rs;
	}

	@Override
	public boolean doInsertMovie(Movie movie) throws Exception {
		String sql = "INSERT INTO Movie (id, chineseName, originalName, length, language, director, actor, tag, area, cover, grade, starNumber, commentNumber, description) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		List<Object> params = new ArrayList<Object>();
		params.add(movie.getChineseName());
		params.add(movie.getOriginalName());
		params.add(movie.getLength());
		params.add(movie.getLanguage());
		params.add(movie.getDirector());
		params.add(movie.getActor());
		params.add(movie.getTag());
		params.add(movie.getArea());
		params.add(movie.getCover());
		params.add(movie.getGrade());
		params.add(movie.getStarNumber());
		params.add(movie.getCommentNumber());
		params.add(movie.getDescription());
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}

	public boolean doDeleteMovieById(String movieId) throws Exception {
		String sql = "delete from movie where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(movieId);
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}
	
	@Override 
	public boolean doDeleteMovie(int movieId) throws Exception{
		
		return true;
	}

	@Override
	public int doDeleteMovies(List<Integer> movieIds) throws Exception {
		int id = 0;
		int ret = 0;
		int num = movieIds.size();
		
		for(int i = 0; i < num; i++){
			List<Object> params  = new ArrayList<Object>();
			id = movieIds.get(i);
			String sql = "delete from movie where id=?";
			params.add(id);
			boolean flag = mysql.updateByPreparedStatement(sql, params);
			if(flag == true)
				ret++;
		}
		
		return ret;
	}

	@Override
	public boolean doUpdateMovie(Movie movie) throws Exception {
		String sql = "update Movie set chineseName=? , originalName=?, length=?, language=?, director=?, actor=?, tag=?, area=?, cover=?, grade=?, starNumber=?, commentNumber=?, description=? where id=?";
		List<Object> params = new ArrayList<Object>();
		params.add(movie.getChineseName());
		params.add(movie.getOriginalName());
		params.add(movie.getLength());
		params.add(movie.getLanguage());
		params.add(movie.getDirector());
		params.add(movie.getActor());
		params.add(movie.getTag());
		params.add(movie.getArea());
		params.add(movie.getCover());
		params.add(movie.getGrade());
		params.add(movie.getStarNumber());
		params.add(movie.getCommentNumber());
		params.add(movie.getDescription());
		params.add(movie.getId());
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}

	@Override
	public List<Movie> doRecommandMovie(int userid) throws Exception {
		List<Movie> movieByUser = this.doRecommandMovieByUser(userid);
		List<Movie> movieByList = this.doRecommandMovieByMovieList(userid);
		System.out.println("1:"+movieByUser.size()+" 2:"+movieByList.size());
		List<Movie> ret = new ArrayList<Movie>();
		int numUser = movieByUser.size();
		int numList = movieByList.size();
		Map<String, Boolean> flag = new HashMap<String, Boolean>();
		for(int i = 0; i < numUser; i++){
			if(flag.get(movieByUser.get(i).getId()+"") == null){
				flag.put(movieByUser.get(i).getId()+"", true);
				ret.add(movieByUser.get(i));
				System.out.println(flag.get(movieByUser.get(i).getId()+"")+"添加了"+movieByUser.get(i).getChineseName());
			}
		}
		for(int i = 0; i < numList; i++){
			if(flag.get(movieByList.get(i).getId()+"") == null){
				flag.put(movieByList.get(i).getId()+"", true);
				ret.add(movieByList.get(i));
				System.out.println("添加了"+movieByList.get(i).getChineseName()+movieByList.get(i).getId());
			}
		}
			
		return ret;
	}
	
	private List<Movie> doRecommandMovieByUser(int userid) throws Exception{
		List<Movie> ret = new ArrayList<Movie>();
		UserDaoImpl use = new UserDaoImpl();
		MovieDaoImpl mov = new MovieDaoImpl();
		String star = use.findUserById(userid).getStar();
		List<String> allUserStars = use.findAllStars();
		String[] userStars = star.split(";*;");
		Arrays.sort(userStars);
		int num = allUserStars.size();
		System.out.println("all "+num);
		for(int i = 0; i < num; i++){
			int count = 0;
			String tmp = allUserStars.get(i);
			String[] tmpStars = tmp.split(";*;");
			Arrays.sort(tmpStars);
			for(int j = 1, k = 1; j < tmpStars.length && k < userStars.length;){
				if(Integer.parseInt(userStars[j]) < Integer.parseInt(tmpStars[k]))
					j++;
				else if(Integer.parseInt(userStars[j]) > Integer.parseInt(tmpStars[k]))
					k++;
				else{
					count++;
					j++;
					k++;
				}
			}
//			System.out.println("用户匹配率"+(count*1.0)/tmpStars.length);
			if(((count*1.0)/tmpStars.length) > 0.4){
				System.out.println("用户匹配率高");
				int j,k;
				for(j = 1, k = 1; j < userStars.length && k < tmpStars.length;){
					if(Integer.parseInt(userStars[j]) != Integer.parseInt(tmpStars[k])){
						System.out.println("添加了"+mov.findMovieById(Integer.parseInt(tmpStars[k])));
						ret.add(mov.findMovieById(Integer.parseInt(tmpStars[k])));
						j++;
						k++;
					}
					else{
						j++;
						k++;
					}
				}
				while(k < tmpStars.length){
					ret.add(mov.findMovieById(Integer.parseInt(tmpStars[k])));
					System.out.println("添加了"+mov.findMovieById(Integer.parseInt(tmpStars[k])));
					k++;
				}
			}
		}
		
		return ret;
	}

	private List<Movie> doRecommandMovieByMovieList(int userid) throws Exception{
		List<Movie> ret = new ArrayList<Movie>();
		UserDaoImpl use = new UserDaoImpl();
		MovieListDaoImpl mov = new MovieListDaoImpl();
		MovieDaoImpl mo = new MovieDaoImpl();
		List<String> allMovieList = mov.findAllMovieListMovies();
		String star = use.findUserById(userid).getStar();
		String[] userStars = star.split(";*;");
		Arrays.sort(userStars);
		List<String> allMovieListMovies = mov.findAllMovieListMovies();
		int num = allMovieListMovies.size();
		for(int i = 0; i < num; i++){
			int count = 0;
			String tmp = allMovieListMovies.get(i);
			String[] tmpStars = tmp.split(";*;");
			Arrays.sort(tmpStars);
			for(int j = 1, k = 1; j < userStars.length && k < tmpStars.length;){
				if(Integer.parseInt(userStars[j]) < Integer.parseInt(tmpStars[k]))
					j++;
				else if(Integer.parseInt(userStars[j]) > Integer.parseInt(tmpStars[k]))
					k++;
				else{
					count++;
					j++;
					k++;
				}
			}
//			System.out.println("影单匹配率"+(count*1.0)/tmpStars.length);
			if((count*1.0)/tmpStars.length > 0.4){
				int j,k;
				for(j = 1, k = 1; j < userStars.length && k < tmpStars.length;){
					if(Integer.parseInt(userStars[j]) != Integer.parseInt(tmpStars[k])){
						j++;
						ret.add(mo.findMovieById(Integer.parseInt(tmpStars[k])));
					}
					else{
						j++;
						k++;
					}
				}
				while(k < tmpStars.length){
					ret.add(mo.findMovieById(Integer.parseInt(tmpStars[k])));
					k++;
				}
			}
		}
		
		return ret;
	}
	
	@Override
	public List<Movie> doSelectClassicMovie() throws Exception {
		String sql = "select * from movie where grade > 9.0 order by grade DESC";
		List<Map<String, Object>> list = mysql.findMoreResult(sql, null);
		List<Movie> ret = new ArrayList<Movie>();
		int num = list.size();
		for(int i = 0; i < num; i++){
			Movie movie = new Movie();
			movie.setChineseName((String) list.get(i).get("chineseName"));
			movie.setOriginalName((String) list.get(i).get("originalName"));
			movie.setId((Integer) list.get(i).get("id"));
			movie.setLength((String) list.get(i).get("length"));
			movie.setLanguage((String) list.get(i).get("language"));
			movie.setDirector((String) list.get(i).get("director"));
			movie.setActor((String) list.get(i).get("actor"));
			movie.setTag((String) list.get(i).get("tag"));
			movie.setArea((String) list.get(i).get("area"));
			movie.setCover((String) list.get(i).get("cover"));
			movie.setGrade((Double) list.get(i).get("grade"));
			movie.setStarNumber((Integer) list.get(i).get("starNumber"));
			movie.setCommentNumber((Integer) list.get(i).get("commentNumber"));
			movie.setDescription((String) list.get(i).get("description"));
			ret.add(movie);
		}
		
		return ret;
	}

	@Override
	public List<Movie> doSelectHotLineMovie() throws Exception {
		
		
		return null;
	}
	
	@Override
	public Movie findMovieById(int id) throws Exception {
		String sql = "select * from movie where id="+id;
		Map<String, Object> item = mysql.findSimpleResult(sql, null);
		Movie movie = new Movie();
		movie.setChineseName((String) item.get("chineseName"));
		movie.setOriginalName((String) item.get("originalName"));
		movie.setId((Integer) item.get("id"));
		movie.setLength((String) item.get("length"));
		movie.setLanguage((String) item.get("language"));
		movie.setDirector((String) item.get("director"));
		movie.setActor((String) item.get("actor"));
		movie.setTag((String) item.get("tag"));
		movie.setArea((String) item.get("area"));
		movie.setCover((String) item.get("cover"));
		movie.setGrade((Double) item.get("grade"));
		movie.setStarNumber((Integer) item.get("starNumber"));
		movie.setCommentNumber((Integer) item.get("commentNumber"));
		movie.setDescription((String) item.get("description"));
		
		return movie;
	}

	@Override
	public List<Movie> findMovieByTypeAndArea(String type, String area)
			throws Exception {
		String sql = "select * from movie where tag like ? and area like ? limit 200";
		List<Object> params = new ArrayList<Object>();
		params.add("%" + type + "%");
		params.add("%" + area + "%");
		List<Map<String, Object>> movies = mysql.findMoreResult(sql, params);
		List<Movie> ret = new ArrayList<Movie>();
		int size = movies.size();
		System.out.println(size+type+area);
		for(int i = 0; i < size; i++){
			Movie movie = new Movie();
			Map<String, Object> map = movies.get(i);
        	movie.setId((Integer)map.get("id"));
        	movie.setChineseName((String)map.get("chineseName"));
        	movie.setOriginalName((String)map.get("originalName"));
        	movie.setLength((String)map.get("length"));
        	movie.setLanguage((String)map.get("language"));
        	movie.setDirector((String)map.get("director"));
        	movie.setActor((String)map.get("actor"));
        	movie.setTag((String)map.get("tag"));
        	movie.setArea((String)map.get("area"));
        	movie.setCover((String)map.get("cover"));
        	movie.setGrade((Double)map.get("grade"));
        	movie.setStarNumber((Integer)map.get("starNumber"));
        	movie.setCommentNumber((Integer)map.get("commentNumber"));
        	movie.setDescription((String)map.get("description"));
        	ret.add(movie);
		}
		
		return ret;
	}
	
	public List<Movie> findHotRecommandMovie()
	throws Exception {
		List<Movie> rs = new ArrayList<Movie>();
		List<Object> params = new ArrayList<Object>();
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		String sql = "select * from movie order by grade DESC LIMIT 5";
		list = mysql.findMoreResult(sql, params);
		for(int i = 0; i < list.size(); i++) {
			Movie movie = new Movie();
			map = list.get(i);
			movie.setId((Integer)map.get("id"));
			movie.setChineseName((String)map.get("chineseName"));
			movie.setOriginalName((String)map.get("originalName"));
			movie.setLength((String)map.get("length"));
			movie.setLanguage((String)map.get("language"));
			movie.setDirector((String)map.get("director"));
			movie.setActor((String)map.get("actor"));
			movie.setTag((String)map.get("tag"));
			movie.setArea((String)map.get("area"));
			movie.setCover((String)map.get("cover"));
			movie.setGrade((Double)map.get("grade"));
			movie.setStarNumber((Integer)map.get("starNumber"));
			movie.setCommentNumber((Integer)map.get("commentNumber"));
			movie.setDescription((String)map.get("description"));
			rs.add(movie);
		}
		
		return rs;
	}

	public List<Movie> findMovieByTypeAndAreaHot(String type, String area) throws Exception {
		String sql = "select * from movie where tag like ? and area like ? order by starNumber DESC";
		List<Object> params = new ArrayList<Object>();
		params.add("%" + type + "%");
		params.add("%" + area + "%");
		System.out.println(type+area);
		List<Map<String, Object>> movies = mysql.findMoreResult(sql, params);
		List<Movie> ret = new ArrayList<Movie>();
		if(movies.size()!=0){
			int size = movies.size();
			System.out.println(size+type+area);
			for(int i = 0; i < size; i++){
				Movie movie = new Movie();
				Map<String, Object> map = movies.get(i);
		    	movie.setId((Integer)map.get("id"));
		    	movie.setChineseName((String)map.get("chineseName"));
		    	movie.setOriginalName((String)map.get("originalName"));
		    	movie.setLength((String)map.get("length"));
		    	movie.setLanguage((String)map.get("language"));
		    	movie.setDirector((String)map.get("director"));
		    	movie.setActor((String)map.get("actor"));
		    	movie.setTag((String)map.get("tag"));
		    	movie.setArea((String)map.get("area"));
		    	movie.setCover((String)map.get("cover"));
		    	movie.setGrade((Double)map.get("grade"));
		    	movie.setStarNumber((Integer)map.get("starNumber"));
		    	movie.setCommentNumber((Integer)map.get("commentNumber"));
		    	movie.setDescription((String)map.get("description"));
		    	ret.add(movie);
			}
		}
		
		return ret;
	}

	public boolean doInsertMovieScore(int movieid, int userid, int score) throws Exception{
		String sql1 = "select * from moviescore where id = ?";
		List<Object> params1 = new ArrayList<Object>();
		params1.add(movieid);
		Map<String, Object> map = mysql.findSimpleResult(sql1, params1);
		String sco = (String) map.get("score");
		sco += ";"+userid+":"+score+";";
		String sql = "update moviescore set score = ? where id = ?";
		List<Object> params = new ArrayList<Object>();
		params.add(sco);
		params.add(movieid);
		boolean flag = mysql.updateByPreparedStatement(sql, params);
		
		return flag;
	}
}
