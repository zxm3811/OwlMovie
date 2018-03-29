package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Decoder.BASE64Encoder;

import com.mt.dao.impl.UserDaoImpl;
import com.mt.email.SendEmail;
import com.mt.mysql.Mysql;
import com.sun.mail.util.BASE64DecoderStream;
import com.sun.mail.util.BASE64EncoderStream;

public class ForgetPasswordServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ForgetPasswordServlet() {
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
		System.out.println("asdfdfs");
		UserDaoImpl udi = new UserDaoImpl();
		int userid = Integer.parseInt(request.getParameter("userid"));
		String emailinput = request.getParameter("emailinput");
		String password = "";
		try {
			password = udi.findUserById(userid).getPassword();
		} catch (Exception e) {
			e.printStackTrace();
		}
		String email = "";
		try {
			email = udi.findUserById(userid).getEmail();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(emailinput.equals(email)){
			String validCode = "";
			try {
				validCode = EncoderByMd5(password);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Mysql mysql = new Mysql();
			String sql = "insert into passwordvalid (id, validcode) values (?, ?)";
			List<Object> params = new ArrayList<Object>();
			params.add(userid);
			params.add(validCode);
			boolean flag = false;
			try {
				flag = mysql.updateByPreparedStatement(sql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(flag){
				System.out.println("操作成功");
			}
			else{
				System.out.println("操作失败");
			}
			SendEmail sendEmail = new SendEmail("smtp.163.com",  
				       "15651696893@163.com", "owlmovie1", email,  
				       "猫头鹰电影网认证邮件", "点击修改密码:http://MovieTime.jsp?userid="+userid+"&validcode="+validCode, "猫头鹰电影网", "", "");  
			try {
				sendEmail.send();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}
			out.print("<response><result>1</result></response>");
		}
		else{
			out.print("<response><result>0</result></response>");
		}
		
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
