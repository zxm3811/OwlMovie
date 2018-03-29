package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.MovieListDaoImpl;
import com.mt.dao.impl.UserDaoImpl;
import com.mt.vo.MovieList;
import com.mt.vo.User;

public class CenterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CenterServlet() {
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

		response.setContentType("text/xml;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		int sex = Integer.parseInt(request.getParameter("group"));
		SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = null;
		try {
			birthday = d.parse(request.getParameter("birthday"));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String area = request.getParameter("area");
		
		User user = new User();
		UserDaoImpl use = new UserDaoImpl();
		try {
			user = use.findUserById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		user.setArea(area);
		user.setBirthday(birthday);
		user.setDescription(description);
		user.setName(name);
		user.setSex(sex);
		System.out.println(user.getName());
		boolean flag = false;
		try {
			flag = use.doUpdateInfo(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(true){
			Cookie cookies[] = request.getCookies();
			String nameStr = java.net.URLEncoder.encode(user.getName());
			for(int i = 0; i < cookies.length; i++)
				if(cookies[i].getName().equals("id") || cookies[i].getName().equals("username"))
					cookies[i].setMaxAge(0);
			String userid = ""+id;
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
		}
		request.getRequestDispatcher("/center.jsp?id="+id).forward(request, response);
		
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
