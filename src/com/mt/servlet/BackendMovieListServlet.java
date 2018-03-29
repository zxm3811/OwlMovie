package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.FilmReviewDaoImpl;
import com.mt.dao.impl.MovieListDaoImpl;
import com.mt.vo.FilmReview;
import com.mt.vo.MovieList;

public class BackendMovieListServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BackendMovieListServlet() {
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
			
			MovieListDaoImpl mldi = new MovieListDaoImpl();
			int flag = Integer.parseInt(request.getParameter("flag"));
			if(flag == 2) {
				//删
				try {
					String listid = request.getParameter("movielistid");
					boolean flag1 = mldi.doDeleteMovieList(listid);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/movielist.jsp").forward(request, response);
			}
			else if(flag == 3) {
				//查
				try {
					List<MovieList> list = mldi.findAllMovieListOrderById();
					out.print("<response>");
					for(int i = 0; i < list.size(); i++) {
						MovieList movielist = new MovieList();
						movielist = list.get(i);
						out.print("<info>");
						out.print("<id>"+movielist.getId()+"</id>");
						out.print("<name>"+movielist.getName()+"</name>");
						out.print("<description>"+movielist.getDescription()+"</description>");
						out.print("<createTime>"+movielist.getCreateTime()+"</createTime>");
						out.print("<uid>"+movielist.getUid()+"</uid>");
						out.print("<starNumber>"+movielist.getStarNumber()+"</starNumber>");
						out.print("<starUid>"+movielist.getStarUid()+"</starUid>");
						out.print("<movieList>"+movielist.getMovieList()+"</movieList>");
						out.print("<commentNumber>"+movielist.getCommentNumber()+"</commentNumber>");
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
