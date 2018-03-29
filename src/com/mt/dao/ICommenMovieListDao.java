package com.mt.dao;

import java.util.List;

import com.mt.vo.CommentMovieList;

public interface ICommenMovieListDao {
	
	/**
	 * 向数据库中添加影单评论
	 * 
	 * @param CommentMovieList commentMovieList 影单评论信息
	 * @return boolean 返回插入结果
	 * 
	 * @throws Exception 有异常交给调用函数去处理
	 * */
	public boolean doInsertCommentMovieList(CommentMovieList commentMovieList) throws Exception;
	
	/**
	 * 从数据库中删除影单评论
	 * 
	 * @param int commentMovieListId 影单评论id
	 * @return boolean 返回删除结果
	 * 
	 * @throws Exception 有异常交给调用函数去处理
	 * */
	public boolean doDeleteCommentMovieList(int commentMovieListId) throws Exception;

	/**
	 * 通过影单id查询评论，并按照赞数排序
	 * 
	 * @param int movieListId 影单id
	 * @return List<CommentSeries> 返回影单评论的List
	 * 
	 *  @throws 有异常交给调用函数去处理
	 * */
	public List<CommentMovieList> findCommentMovieListByMovieListId(int Id) throws Exception;
}
