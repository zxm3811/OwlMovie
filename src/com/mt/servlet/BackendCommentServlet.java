package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.CommentDaoImpl;
import com.mt.dao.impl.MovieDaoImpl;
import com.mt.vo.Comment;
import com.mt.vo.Movie;

public class BackendCommentServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BackendCommentServlet() {
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
			
			CommentDaoImpl cdi = new CommentDaoImpl();
			int flag = Integer.parseInt(request.getParameter("flag"));
			if(flag == 2) {
				//删
				try {
					String commentid = request.getParameter("commentid");
					boolean flag1 = cdi.doDeleteComment(commentid);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/comment.jsp").forward(request, response);
			}
			else if(flag == 3) {
				//查
				try {
					List<Comment> list = cdi.findAllOrderById();
					out.print("<response>");
					for(int i = 0; i < list.size(); i++) {
						Comment comment = new Comment();
						comment = list.get(i);
						out.print("<info>");
						out.print("<id>"+comment.getId()+"</id>");
						out.print("<uid>"+comment.getUid()+"</uid>");
						out.print("<content>"+comment.getContent()+"</content>");
						out.print("<starNumber>"+comment.getStarNumber()+"</starNumber>");
						out.print("<mid>"+comment.getMid()+"</mid>");
						out.print("<mname>"+comment.getMname()+"</mname>");
						out.print("<date>"+comment.getDate()+"</date>");
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
