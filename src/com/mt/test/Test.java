package com.mt.test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

import com.mt.dao.impl.MovieDaoImpl;
import com.mt.dao.impl.UserDaoImpl;
import com.mt.mysql.Mysql;
import com.mt.vo.Movie;
import com.mt.vo.User;

public class Test {

	public static void main(String args[]) throws Exception{
//		Mysql mysql = new Mysql();
//		mysql.getConnection();
//		String sql = "select * from Movie where mid < 2400";
//		List<Map<String, Object>> m = mysql.findModeResult(sql, null);
//		int num = m.size();
//		for(int i = 0; i < num; i++){
//			Map<String, Object> item = null;
//			item = m.get(i);
//			System.out.println(item.get("chineseName"));
//		}
//		List<Movie> items = null;
//		
//		System.out.println();
//		MovieDaoImpl mov = new MovieDaoImpl();
//		List<Movie> list = mov.doSelectClassicMovie();
//		int num = list.size();
//		for(int i = 0; i < num; i++){
//			System.out.println(list.get(i).getChineseName() + " " + list.get(i).getGrade());
//		}
		
		// User测试开始
		UserDaoImpl use = new UserDaoImpl();
//		User user = new User();
//		user.setId(1001);
//		user.setName("张三");
//		user.setPassword("123456");
//		user.setEmail("12345@qq.com");
//		user.setSex(1);
//		user.setCommentNumber(10);
//		user.setStar("2305");
//		user.setStateCode(1);
//		UserDaoImpl use = new UserDaoImpl();
//		use.doInsertUser(user);
//		User user = new User();
//		UserDaoImpl use = new UserDaoImpl();
//		user.setId(1001);
//		user.setPassword("12356");
//		user.setEmail("12345@qq.com");
//		boolean flag = use.doUserIdentify(user);
//		if(flag){
//			System.out.println("登录成功");
//		}
//		else{
//			System.out.println("登录失败");
//		}
//		User user = use.findUserById(1001);
//		System.out.println(user.getName());
		int userId = 1001;
		int movieId = 2305;
		boolean flag = use.doInsertLikeMovie(movieId, userId);
		if(flag)
			System.out.println("用户喜欢成功");
//		String str = ";1234;;21324;;43254;;32432;";
//		String[] strs = str.split(";*;");
//		for(String s : strs){
//			System.out.println("s "+s);
//		}
		//List<Movie> movies = use.findLikeMovie(1001);
		//for(int i = 0; i < movies.size(); i++){
		//	System.out.println(movies.get(i).getChineseName());
		//}
		// User测试结束
		
	}
}
