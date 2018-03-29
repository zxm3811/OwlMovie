package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.MovieDaoImpl;
import com.mt.vo.Movie;

public class TagServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public TagServlet() {
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

		String flag = request.getParameter("flag");
		System.out.println(flag);
		if(flag != null || ( flag != null && flag.equals("2"))){
			String type = "";
			String area = "";
			if(request.getParameter("type") == null){
				type = "";
			}
			else{
				type = request.getParameter("type");
			}
			if(request.getParameter("area") == null){
				area = "";
			}
			else{
				area = request.getParameter("area");
			}
			System.out.println(type+area);
			
			MovieDaoImpl mov = new MovieDaoImpl();
			List<Movie> movies = new ArrayList<Movie>();
			try {
				movies = mov.findMovieByTypeAndAreaHot(type, area);
			} catch (Exception e) {
				e.printStackTrace();
			}
					
			out.print("<response>");
			int size = movies.size();
			for(int i = 0; i < size; i++){
				Movie movie = movies.get(i);
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
			}
			out.print("</response>");
		}
		else{
			String type = "";
			String area = "";
			if(request.getParameter("type") == null){
				type = "";
			}
			else{
				type = request.getParameter("type");
			}
			if(request.getParameter("area") == null){
				area = "";
			}
			else{
				area = request.getParameter("area");
			}
			System.out.println(type+area);
			
			MovieDaoImpl mov = new MovieDaoImpl();
			List<Movie> movies = new ArrayList<Movie>();
			try {
				movies = mov.findMovieByTypeAndArea(type, area);
			} catch (Exception e) {
				e.printStackTrace();
			}
					
			out.print("<response>");
			int size = movies.size();
			for(int i = 0; i < size; i++){
				Movie movie = movies.get(i);
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
			}
			out.print("</response>");
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
