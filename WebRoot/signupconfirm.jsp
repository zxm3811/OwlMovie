<%@page import="com.mt.dao.impl.UserDaoImpl,com.mt.vo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


request.setCharacterEncoding("utf-8");
String userid = request.getParameter("userid");

User user = new User();
UserDaoImpl use = new UserDaoImpl();
user = use.findUserById(Integer.parseInt(userid));
user.setStateCode(1);
boolean flag = use.doUpdateInfo(user);
if(flag)
	out.println("验证成功，登录吧：<a href=\"http://wuteng-virtualbox:8080/MovieTime\">");
else
	out.println("验证失败了");
%>