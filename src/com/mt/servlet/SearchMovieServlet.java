package com.mt.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.MovieDaoImpl;
import com.mt.vo.Movie;

public class SearchMovieServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchMovieServlet() {
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

			request.setCharacterEncoding("utf-8");
			String path = "searchMovie.jsp";
			String s = null;
			try{
				if(request.getParameter("search_text") == null) {
					s = "";
				}
				else {
				s = new String(request.getParameter("search_text").getBytes("iso8859-1"),"utf-8");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			if(s.equals("") || s == null) {
				s = "猫头鹰";
			}
			String keyword = s;
			request.setAttribute("name", s);
			//电影搜索
			MovieDaoImpl mov = new MovieDaoImpl();
			List<Movie> movies = new ArrayList<Movie>();
			try {
				movies = mov.findMovieByAll(keyword);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("keyword", keyword);
			request.setAttribute("movies", movies);
			request.getRequestDispatcher(path).forward(request, response);
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

			this.doGet(request, response);
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
