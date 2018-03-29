package com.mt.dao;

import java.util.List;

import com.mt.vo.CommentSeries;

public interface ICommentSeriesDao {

	/**
	 * 通过专题id查询评论，并按照赞数排序
	 * 
	 * @param int movieListId 专题id
	 * @return List<CommentSeries> 返回专题评论的List
	 * 
	 *  @throws 有异常交给调用函数去处理
	 * */
	public List<CommentSeries> findCommentSeriesBySeriesId(int seriesId) throws Exception;
	/**
	 * 向数据库中添加专题评论
	 * 
	 * @param CommentSeries commentSeries 专题评论信息
	 * @return boolean 返回插入结果
	 * 
	 * @throws Exception 有异常交给调用函数去处理
	 * */
	public boolean doInsertCommentSeries(CommentSeries commentSeries) throws Exception;
	
	/**
	 * 从数据库中删除专题评论
	 * 
	 * @param int commentSeriesId 专题评论id
	 * @return boolean 返回删除结果
	 * 
	 * @throws Exception 有异常交给调用函数去处理
	 * */
	public boolean doDeleteCommentSeries(int commentSeriesId) throws Exception;

}
