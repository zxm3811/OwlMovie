package com.mt.dao;

import java.util.List;

import com.mt.vo.MovieList;

public interface IMovieListDao {
	
	/**
	 * 通过影单id从数据库中查询影单信息
	 * 
	 * @param int movieListId 影单的id
	 * @return MovieList 返回查询到的影单的信息
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public MovieList findMovieListByMovieListId(int movieListId) throws Exception;
	
	/**
	 * 通过用户id从数据库中查询该用户所创建的所有影单
	 * 
	 * @param int userId 用户的id
	 * @return List<MovieList> 返回用户创建的影单的List
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public List<MovieList> findMovieListByUserId(int userId) throws Exception;
	
	/**
	 * 返回所有的影单信息，按照点赞数排序
	 * 
	 * @param 无
	 * @return List<MovieList> 返回查询到的MovieList的List
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public List<MovieList> findAllMovieList() throws Exception;
	
	/**
	 * 根据所有信息查询影单
	 * 
	 * @param String keyword 关键词
	 * @return List<MovieList> 返回查询到的MovieList的List
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public List<MovieList> findMovieListByAll(String keyword) throws Exception;
	
	/**
	 * 根据用户id和影单id查询用户是否赞了此影单
	 * 
	 * @param int userId, int movieListId 用户id，影单id
	 * @return boolean 返回结果 true/false
	 * 
	 * @throws Exception 有异常交给异常去处理
	 * */
	public boolean hasLikeMovieList(int userId, int movieListId) throws Exception;
	
	/**
	 *  向数据库中插入影单信息
	 *  
	 *  @param MovieList movieList 影单信息
	 *  @return boolean 返回插入结果
	 *  
	 *  @throws Exception 有异常交给异常去处理
	 * */
	public boolean doInsertMovieList(MovieList movieList) throws Exception;
	
	/**
	 * 通过影单id从数据库中删除影单信息
	 * 
	 * @param int movieListId 影单id
	 * @return boolean 返回删除结果
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public boolean doDeleteMovieList(String movieListId) throws Exception;
	
	/**
	 * 用户对某个影单点赞或取消赞
	 * 
	 * @param int userId, int movieListId 用户id，影单id
	 * @return boolean 返回点赞或取消赞的结果
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public boolean doLikeMovieList(int userId, int movieListId) throws Exception;

	
}