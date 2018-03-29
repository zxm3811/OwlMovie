package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Decoder.BASE64Encoder;

import com.mt.dao.impl.UserDaoImpl;
import com.mt.email.SendEmail;
import com.mt.vo.User;

public class SignupServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SignupServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/xml;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		

		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String area = request.getParameter("area");
		System.out.println(userid+ " " + password);

		try {
			password = EncoderByMd5(password);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		User user = new User();
		UserDaoImpl  use = new UserDaoImpl();
		user.setId(Integer.parseInt(userid));
		user.setPassword(password);
		user.setName(name);
		user.setArea(area);
		user.setEmail(email);
		user.setBirthday(new Date());
		user.setCommentNumber(0);
		user.setDescription("这个人很帅，不愿意介绍自己。");
		user.setSex(1);
		user.setStar("");
		user.setStateCode(0);
		String validUrl = "恭喜您注册成功了：http://wuteng-virtualbox:8080/MovieTime/signupconfirm.jsp?userid="+userid;
		
		Cookie cookies[] = request.getCookies();
		for(int i = 0; i < cookies.length; i++)
			if(cookies[i].getName().equals("userid") || cookies[i].getName().equals("name"))
				cookies[i].setMaxAge(0);
		Cookie c1 = new Cookie("id", userid);
		Cookie c2 = new Cookie("username", java.net.URLEncoder.encode(name));		
		response.addCookie(c1);
		response.addCookie(c2);
		
		boolean flag = false;
		try {
			flag = use.doInsertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(flag);

		if(flag){
			SendEmail sendEmail = new SendEmail("smtp.163.com",  
			       "15651696893@163.com", "owlmovie1", email,  
			       "Owl-Movie-Valid", validUrl, "Owl-Movie", "", "");  
			try{
					sendEmail.send();
				   	System.out.println("发送成功");
			}catch(Exception e){
					e.printStackTrace();
			}
		}
		
		out.print("<response><result>");
		if(flag){
			out.print("1");
		}
		else{
			out.print("0");
		}
		out.print("</result></response>");

		out.flush();
		out.close();

	}
	
	public String EncoderByMd5(String str) throws Exception{
		MessageDigest md5=MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
		return newstr;
	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
