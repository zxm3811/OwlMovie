package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.MovieDaoImpl;
import com.mt.dao.impl.SeriesDaoImpl;
import com.mt.vo.Movie;
import com.mt.vo.Series;

public class BackendSeriesServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BackendSeriesServlet() {
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
			
			SeriesDaoImpl sdi = new SeriesDaoImpl();
			int flag = Integer.parseInt(request.getParameter("flag"));
			if(flag == 1) {
				//增
				String name = request.getParameter("name");
				String description = request.getParameter("description");
				String movielist = request.getParameter("movielist");
				Series series = new Series();
				series.setName(name);
				series.setCommentNumber(0);
				series.setDescription(description);
				series.setMovieList(movielist);
				series.setStarNumber(0);
				series.setStarUid("");
//				Series series = (Series) request.getAttribute("series");
				try {
					boolean flag1 = sdi.doInsertSeries(series);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/series.jsp").forward(request, response);
			}
			else if(flag == 2) {
				//删
				try {
					String seriesid = request.getParameter("seriesid");
					boolean flag1 = sdi.doDeleteSeries(seriesid);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/series.jsp").forward(request, response);
			}
			else if(flag == 3) {
				//查
				try {
					List<Series> list = sdi.findAllSeriesOrderById();
					out.print("<response>");
					for(int i = 0; i < list.size(); i++) {
						Series series = new Series();
						series = list.get(i);
						out.print("<info>");
						out.print("<id>"+series.getId()+"</id>");
						out.print("<name>"+series.getName()+"</name>");
						out.print("<description>"+series.getDescription()+"</description>");
						out.print("<starNumber>"+series.getStarNumber()+"</starNumber>");
						out.print("<starUid>"+series.getStarUid()+"</starUid>");
						out.print("<movieList>"+series.getMovieList()+"</movieList>");
						out.print("<commentNumber>"+series.getCommentNumber()+"</commentNumber>");
						out.print("</info>");
					}
					out.print("</response>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else if(flag == 4) {
				//改
				String name = request.getParameter("name");
				String description = request.getParameter("description");
				String movielist = request.getParameter("movielist");
				SeriesDaoImpl dsi = new SeriesDaoImpl();
				Series series = new Series();
				try {
					series = dsi.findSeriesBySeriesId(Integer.parseInt(request.getParameter("seriesid")));
				} catch (NumberFormatException e1) {
					e1.printStackTrace();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				series.setName(name);
				series.setDescription(description);
				series.setMovieList(movielist);
//				Series series = (Series) request.getAttribute("series");
				try {
					boolean flag1 = sdi.doUpdateSeries(series);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/series.jsp").forward(request, response);
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
