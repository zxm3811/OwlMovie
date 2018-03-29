package com.mt.dao;

import java.util.List;

import com.mt.vo.Comment;

public interface ICommentDao {

	/**
	 * 通过所有信息查询短评
	 * 
	 * @param String keyword 关键词
	 * @return List<Comment> 返回评论的List
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public List<Comment> findByAll(String keyword) throws Exception;
	
	/**
	 * 向数据库中插入短评
	 * 
	 * @param Comment comment 短评的信息
	 * @return boolean 返回添加的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doInsertComment(Comment comment) throws Exception;
	
	/**
	 * 从数据库中删除短评
	 * 
	 * @param int id 短评的id
	 * @return boolean 返回删除的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doDeleteComment(String id) throws Exception;
	
	/**
	 * 根据电影id查询短评
	 * 
	 * @param int mid
	 * @return List<Comment> 返回短评的List
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public List<Comment> findByMid(int mid) throws Exception;
}