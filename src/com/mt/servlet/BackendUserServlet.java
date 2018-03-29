package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.UserDaoImpl;
import com.mt.vo.User;

public class BackendUserServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BackendUserServlet() {
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

			this.doPost(request, response);
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
		
		UserDaoImpl udi = new UserDaoImpl();
		int flag = Integer.parseInt(request.getParameter("flag"));
		if(flag == 2) {
			//删
			try {
				String userid = request.getParameter("userid");
				boolean flag1 = udi.doDeleteUserById(userid);
				System.out.println(flag1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher("backend/user.jsp").forward(request, response);
		}
		else if(flag == 3) {
			//查
			try {
				List<User> list = udi.findUserOrderById();
				out.print("<response>");
				for(int i = 0; i < list.size(); i++) {
					User user = new User();
					user = list.get(i);
					out.print("<info>");
					out.print("<id>"+user.getId()+"</id>");
					out.print("<name>"+user.getName()+"</name>");
					out.print("<password>"+user.getPassword()+"</password>");
					out.print("<sex>"+user.getSex()+"</sex>");
					out.print("<commentNumber>"+user.getCommentNumber()+"</commentNumber>");
					out.print("<star>"+user.getStar()+"</star>");
					out.print("<email>"+user.getEmail()+"</email>");
					out.print("<stateCode>"+user.getStateCode()+"</stateCode>");
					out.print("<area>"+user.getArea()+"</area>");
					out.print("<birthday>"+user.getBirthday()+"</birthday>");
					out.print("<description>"+user.getDescription()+"</description>");
					out.print("</info>");
				}
				out.print("</response>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
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
