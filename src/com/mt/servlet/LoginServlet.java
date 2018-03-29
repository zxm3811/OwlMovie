package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.*;
import java.security.MessageDigest;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Decoder.BASE64Encoder;

import com.mt.dao.impl.UserDaoImpl;
import com.mt.vo.User;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
	 * @throws ServletException if an error occurred		// 关闭out输出句柄
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		response.setContentType("text/xml;charset=UTF-8");
		
		// 在这里获取数据并以xml的格式输出
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");

		User user = new User();
		UserDaoImpl  use = new UserDaoImpl();
		user.setId(Integer.parseInt(userid));
		user.setPassword(password);
		boolean flag = false;
		try {
			flag = use.doUserIdentify(user);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		System.out.println(flag);
		if(flag){
			User u = new User();
			try {
				u = use.findUserById(Integer.parseInt(userid));
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			Cookie cookies[] = request.getCookies();
			String nameStr = java.net.URLEncoder.encode(u.getName(), "utf-8");
			//String nameStr = u.getName();
			for(int i = 0; i < cookies.length; i++)
				if(cookies[i].getName().equals("id") || cookies[i].getName().equals("username"))
					cookies[i].setMaxAge(0);
			Cookie c1 = new Cookie("id", userid);
			Cookie c2 = new Cookie("username", nameStr);
			
			System.out.println((String)c2.getValue());
			c1.setMaxAge(3600);
			c2.setMaxAge(3600);
			try{
				response.addCookie(c1);
				response.addCookie(c2);
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.print("<response><result>1</result><name>"+ u.getName() +"</name></response>");
		}
		else{
			out.print("<response><result>0</result></response>");
		}
		
		// 关闭out输出句柄
		out.flush();
		out.close();
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
