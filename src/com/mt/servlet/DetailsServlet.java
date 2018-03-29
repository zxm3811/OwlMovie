package com.mt.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mt.dao.impl.CommentDaoImpl;
import com.mt.dao.impl.FilmReviewDaoImpl;
import com.mt.dao.impl.MovieDaoImpl;
import com.mt.dao.impl.MovieListDaoImpl;
import com.mt.dao.impl.SeriesDaoImpl;
import com.mt.dao.impl.UserDaoImpl;
import com.mt.vo.Comment;
import com.mt.vo.FilmReview;
import com.mt.vo.MovieList;
import com.mt.vo.Series;

public class DetailsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DetailsServlet() {
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
		
		String flag = request.getParameter("flag");
		System.out.println(flag);
		if(flag.equals("1")){
			String movieId = request.getParameter("movieid");
			String userId = request.getParameter("userid");
			UserDaoImpl use = new UserDaoImpl();
			boolean res = false;
			try {
				res = use.doInsertLikeMovie(Integer.parseInt(movieId), Integer.parseInt(userId));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
			out.print("<response><result>");
			System.out.println(res);
			if(res){
				out.print("1");
				System.out.println("成功了1");
			}
			else
				out.print("0");
			out.print("</result></response>");
		}
		else if(flag.equals("2")){
			// 发表短评
			String content = request.getParameter("content");
			Date date = new Date();
			String mid = request.getParameter("movieid");
			String mname = request.getParameter("moviename");
			int starNumber = 0;
			String uid = request.getParameter("userid");
			
			Comment comment = new Comment();
			CommentDaoImpl com = new CommentDaoImpl();
			comment.setContent(content);
			comment.setDate(date);
			comment.setMid(Integer.parseInt(mid));
			comment.setMname(mname);
			comment.setStarNumber(starNumber);
			comment.setUid(Integer.parseInt(uid));
			boolean res = false;
			try {
				res = com.doInsertComment(comment);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("成功了2");
		}
		else if(flag.equals("3")){
			// 发表影评
			FilmReview filmReview = new FilmReview();
			FilmReviewDaoImpl film = new FilmReviewDaoImpl();
			
			String content = request.getParameter("content");
			Date date = new Date();
			int mid = Integer.parseInt(request.getParameter("movieid"));
			int starNumber = 0;
			int uid = Integer.parseInt(request.getParameter("userid"));
			String mname = request.getParameter("moviename");
			String title = request.getParameter("title");
			
			filmReview.setContent(content);
			filmReview.setDate(date);
			filmReview.setMid(mid);
			filmReview.setMname(mname);
			filmReview.setStarNumber(starNumber);
			filmReview.setTitle(title);
			filmReview.setUid(uid);
			boolean res = false;
			try {
				res = film.doInsertFilmReview(filmReview);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		else if(flag.equals("4")){
			// 创建影单
			MovieList movieList = new MovieList();
			MovieListDaoImpl mo = new MovieListDaoImpl();
			
			String description = request.getParameter("description");
			String movie = "";
			String name = request.getParameter("name");
			String starUid = "";
			Date date = new Date();
			int uid = Integer.parseInt(request.getParameter("userid"));
			
			movieList.setCommentNumber(0);
			movieList.setCreateTime(date);
			movieList.setDescription(description);
			movieList.setMovieList(movie);
			movieList.setName(name);
			movieList.setStarNumber(0);
			movieList.setStarUid(starUid);
			movieList.setUid(uid);
			
			boolean res = false;
			try {
				res = mo.doInsertMovieList(movieList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(res)
				System.out.println("成功了4");
		}
		else if(flag.equals("5")){
			// 将电影添加到专题
			int movieId = Integer.parseInt(request.getParameter("movieid"));
			int movieListId = Integer.parseInt(request.getParameter("movielistid"));
			MovieListDaoImpl mo = new MovieListDaoImpl();
			boolean res = false;
			try {
				res = mo.doInsertMovieToMovieList(movieId, movieListId); 
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(res){
				System.out.println("成功了5");
			}
		}
		else {
			int movieid = Integer.parseInt(request.getParameter("movieid"));
			int score = Integer.parseInt(request.getParameter("score"));
			int userid = Integer.parseInt(request.getParameter("userid"));
			MovieDaoImpl mov = new MovieDaoImpl();
			boolean flag1 = false;
			try {
				flag1 = mov.doInsertMovieScore(movieid, userid, score);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(flag1){
				System.out.println("成功了");
			}
			else{
				System.out.println("失败了");
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
