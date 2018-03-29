package com.mt.dao;

import java.util.List;

import com.mt.vo.FilmReview;

public interface IFilmReviewDao {

	/**
	 * 根据所有信息查询影评
	 * 
	 * @param String keyword 关键词
	 * @return List<FilmReview> 返回影评的List
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public List<FilmReview> findByAll(String keyword) throws Exception;
	
	/**
	 * 向数据库中添加影评
	 * 
	 * @param FilmReview filmReview 影评的信息
	 * @return boolean 返回添加的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doInsertFilmReview(FilmReview filmReview) throws Exception;

	/**
	 * 从数据库中删除影评
	 * 
	 * @param int id 影评的id
	 * @return boolean 返回删除的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doDeleteFilmReview(int id) throws Exception;
	
	/**
	 * 通过电影id查询影评
	 * 
	 * @param int mid 电影的id
	 * @return List<FilmReview> 返回影评的List
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public List<FilmReview> findByMid(int mid) throws Exception;
}


