package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.CommentDaoImpl;
import com.mt.dao.impl.FilmReviewDaoImpl;
import com.mt.vo.Comment;
import com.mt.vo.FilmReview;

public class BackendFilmReviewServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BackendFilmReviewServlet() {
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
			
			FilmReviewDaoImpl frdi = new FilmReviewDaoImpl();
			int flag = Integer.parseInt(request.getParameter("flag"));
			if(flag == 2) {
				//删
				try {
					String reviewid = request.getParameter("filmreviewid");
					boolean flag1 = frdi.doDeleteFilmReview(reviewid);
					System.out.println(flag1);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				request.getRequestDispatcher("backend/filmreview.jsp").forward(request, response);
			}
			else if(flag == 3) {
				//查
				try {
					List<FilmReview> list = frdi.findAllOrderById();
					out.print("<response>");
					for(int i = 0; i < list.size(); i++) {
						FilmReview filmreview = new FilmReview();
						filmreview = list.get(i);
						out.print("<info>");
						out.print("<id>"+filmreview.getId()+"</id>");
						out.print("<uid>"+filmreview.getUid()+"</uid>");
						out.print("<title>"+filmreview.getTitle()+"</title>");
						out.print("<content>"+filmreview.getContent()+"</content>");
						out.print("<starNumber>"+filmreview.getStarNumber()+"</starNumber>");
						out.print("<mid>"+filmreview.getMid()+"</mid>");
						out.print("<mname>"+filmreview.getMname()+"</mname>");
						out.print("<date>"+filmreview.getDate()+"</date>");
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
