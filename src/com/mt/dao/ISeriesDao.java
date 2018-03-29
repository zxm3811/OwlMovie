package com.mt.dao;

import java.util.List;

import com.mt.vo.Series;

public interface ISeriesDao {

	/**
	 * 通过专题id查询专题信息
	 * 
	 * @param int seriesId 专题id
	 * @return Series 返回专题
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public Series findSeriesBySeriesId(int seriesId) throws Exception;

	/**
	 * 返回所有专题信息，按照点赞数排序
	 * 
	 * @param 无
	 * @return List<Series> 返回专题的List
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public List<Series> findAllSeries() throws Exception;
	
	/**
	 * 通过所有信息查询专题信息
	 * 
	 * @param String keyword 关键词
	 * @return List<Series> 专题的List
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public List<Series> findSeriesByAll(String keyword) throws Exception;
	
	/**
	 * 根据用户id和专题id查询用户是否赞了此专题
	 * 
	 * @param int userId, int seriesId用户id，专题id
	 * @return boolean 返回结果 true/false
	 * 
	 * @throws Exception 有异常交给异常去处理
	 * */
	public boolean hasLikeSeriesId(int userId, int seriesId) throws Exception;
	
	/**
	 * 向数据库中添加专题信息
	 * 
	 * @param Series series 专题
	 * @return boolean 返回插入的结果
	 * 
	 * @throws Exception 有异常交给异常去处理
	 * */
	public boolean doInsertSeries(Series series) throws Exception;
	
	/**
	 * 通过专题id从数据库中删除专题
	 * 
	 * @param int seriesId 专题id
	 * @return boolean 返回删除的结果
	 * 
	 * @throws Exception 有异常交给异常去处理
	 * */
	public boolean doDeleteSeries(String seriesId) throws Exception;
	
	/**
	 * 用户对某个专题点赞或取消赞
	 * 
	 * @param int userId, int seriesId 用户id，专题id
	 * @return boolean 返回点赞或取消赞的结果
	 * 
	 * @throws Exception 有异常交给调用的函数去处理
	 * */
	public boolean doLikeSeries(int userId, int seriesId) throws Exception;
}
