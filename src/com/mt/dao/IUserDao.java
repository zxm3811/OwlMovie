package com.mt.dao;

import java.util.List;

import com.mt.vo.Movie;
import com.mt.vo.User;

public interface IUserDao {

	/**
	 * 通过id查找用户信息
	 * 
	 * @param int id 用户的id
	 * @return User 返回用户的信息
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public User findUserById(int id) throws Exception;
	
	/**
	 * 更新用户信息
	 * 
	 * @param User user 用户的信息
	 * @return boolean 返回更新的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doUpdateInfo(User user) throws Exception;
	
	/**
	 * 向数据库中添加用户信息
	 * 
	 * @param User user 用户的信息
	 * @return boolean 返回更新的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doInsertUser(User user) throws Exception;
	
	/**
	 * 验证用户的帐号密码是否正确
	 * 
	 * @param User user 用户的信息
	 * @return boolean 返回验证的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doUserIdentify(User user) throws Exception;

	/**
	 * 向数据库中插入用户喜欢的电影
	 * 
	 * @param int movieId, int userId 电影的id，用户的id
	 * @return boolean 返回插入的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doInsertLikeMovie(int movieId, int userId) throws Exception;
	
	/**
	 * 从数据库中根据star查询是否已经喜欢某个电影
	 * 
	 * @param int movieId, int userId 电影的id，用户的id
	 * @return boolean 返回查询的结果
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public boolean doHasLike(int movieId, int userId) throws Exception;
	
	/**
	 * 从数据库根据userId查找用户喜欢的电影
	 * 
	 * @param int userId 用户的id
	 * @return List<Movie> 返回电影doFindLikeMovie信息的List
	 * 
	 * @throws Exception 有异常交给调用的函数处理
	 * */
	public List<Movie> findLikeMovie(int userId) throws Exception;
}