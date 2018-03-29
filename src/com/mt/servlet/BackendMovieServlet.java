package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.MovieDaoImpl;
import com.mt.dao.impl.UserDaoImpl;
import com.mt.vo.Movie;
import com.mt.vo.User;

public class BackendMovieServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BackendMovieServlet() {
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
			
			MovieDaoImpl mdi = new MovieDaoImpl();
			int flag = Integer.parseInt(request.getParameter("flag"));
			if(flag == 2) {
				//删
				try {
					String movieid = request.getParameter("movieid");
					boolean flag1 = mdi.doDeleteMovieById(movieid);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/movie.jsp").forward(request, response);
			}
			else if(flag == 3) {
				//查
				try {
					List<Movie> list = mdi.findAllMovieOrderById();
					out.print("<response>");
					for(int i = 0; i < list.size(); i++) {
						Movie movie = new Movie();
						movie = list.get(i);
						out.print("<info>");
						out.print("<id>"+movie.getId()+"</id>");
						out.print("<chineseName>"+movie.getChineseName()+"</chineseName>");
						out.print("<originalName>"+movie.getOriginalName()+"</originalName>");
						out.print("<length>"+movie.getLength()+"</length>");
						out.print("<language>"+movie.getLanguage()+"</language>");
						out.print("<director>"+movie.getDirector()+"</director>");
						out.print("<actor>"+movie.getActor()+"</actor>");
						out.print("<tag>"+movie.getTag()+"</tag>");
						out.print("<area>"+movie.getArea()+"</area>");
						out.print("<cover>"+movie.getCover()+"</cover>");
						out.print("<grade>"+movie.getGrade()+"</grade>");
						out.print("<starNumber>"+movie.getStarNumber()+"</starNumber>");
						out.print("<commentNumber>"+movie.getCommentNumber()+"</commentNumber>");
						out.print("<description>"+movie.getDescription()+"</description>");
						out.print("</info>");
					}
					out.print("</response>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(flag == 4) {
				//改
				Movie movie = (Movie) request.getAttribute("movie");
				try {
					boolean flag1 = mdi.doUpdateMovie(movie);
					System.out.println(flag1);
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
