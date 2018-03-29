package com.mt.dao;

import java.util.List;
import com.mt.vo.Movie;


public interface IMovieDao {
	
	/**
	 * 通过电影id查询电影
	 * 
	 * @param int id 电影id
	 * @return Movie 返回电影的信息
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public Movie findMovieById(int id) throws Exception;
	
	/**
	 * 通过电影名（中文名或英文名或其它名字）查询电影
	 * 
	 * @param String movieName 电影名
	 * @return List<Movie> 返回电影信息的List，电影按照评分高低排序
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public List<Movie> findMovieByMovieName(String movieName) throws Exception;
	
	/**
	 * 通过类型名查询电影
	 * 
	 * @param String tagName 类型名
	 * @return List<Movie> 返回电影信息的List，电影按照评分高低排序
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public List<Movie> findMovieByTagName(String tagName) throws Exception;
	
	/**
	 * 通过所有信息查电影
	 * 
	 * @param String keyword 任何类型的信息
	 * @return List<Movie> 返回电影信息的List，电影按照评分高低排序
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public List<Movie> findMovieByAll(String keyword) throws Exception;
	
	/**
	 * 向数据库中添加电影信息
	 * 
	 * @param int movie 电影的信息
	 * @return boolean 返回插入的结果
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public boolean doInsertMovie(Movie movie) throws Exception;
	
	/**
	 * 从数据库中删除电影
	 * 
	 * @param int movieId 电影id
	 * @return boolean 返回删除结果
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public boolean doDeleteMovie(int movieId) throws Exception;
	
	/**
	 * 从数据库中批量删除电影
	 * 
	 * @param List<Integer> movieIds 电影id的List
	 * @return int 返回删除的电影的个数
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public int doDeleteMovies(List<Integer> movieIds) throws Exception;
	
	/**
	 * 更新电影的信息
	 * 
	 * @param Movie movie 电影的信息
	 * @return boolean 返回更新的结果
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public boolean doUpdateMovie(Movie movie) throws Exception;
	
	/**
	 * 电影个性化推荐
	 * 
	 * @param int userId 用户id
	 * @return List<Movie> 返回推荐电影的List
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public List<Movie> doRecommandMovie(int userId) throws Exception;
	
	/**
	 * 从数据库中选择经典的电影（评分高）
	 * 
	 * @param 没有参数
	 * @return List<Movie> 返回推荐电影的List
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public List<Movie> doSelectClassicMovie() throws Exception;
	
	/**
	 * 使用api得到影院热映的电影的信息
	 * 
	 * @param 没有参数
	 * @return List<Movie> 返回推荐电影的List
	 * 
	 * @throws Exception 有异常交给调用方法去处理
	 * */
	public List<Movie> doSelectHotLineMovie() throws Exception;
	
	/**
	 * 通过类型名和地区从数据库中查询电影
	 * 
	 * @param String type, String area 类型名，地区名
	 * @return List<Movie> 返回电影的List
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public List<Movie> findMovieByTypeAndArea(String type, String area) throws Exception;
}
