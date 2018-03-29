<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.SeriesDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="OwlMovie" />
<meta name="keywords" content="OwlMovie" />
<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Owl Carousel -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/tags.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!--Appshow-->
<script type="text/javascript" src="path/to/js/jquery.min.js"></script>
<script type="text/javascript" src="path/to/js/xSlider.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="./css/app.css">
<link href="css/series.css" rel="stylesheet" type="text/css">
<!--lunbo-->
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link type="text/css" rel="stylesheet" href="css/posterTvGrid.css">
<!---->
<link type="text/css" rel="stylesheet" href="css/index.css">
<!---->
<script src="js/modernizr.js" type="text/javascript"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.js"></script>
<script src="js/cookie.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// js 获取cookie
	var name = Cookies.get('name');
	var userid = Cookies.get('userid');
});
</script>

		<script type="text/javascript" src="js/jquery.js"></script>
	
<script type="text/javascript">

$(function(){
	$(".fh5co-active").removeClass('fh5co-active');
	$('#indexpage').addClass("fh5co-active");
});

</script>

</head>
<body>


<div id="fh5co-page">
<%@ include file="aside.jsp" %>
<!--右栏边页开始-->
<div id="fh5co-main"> 
<%@ include file="searchbar.jsp" %>

  <!-- 轮播框开始 -->
  <div class="htmleaf-container">
		<div class="htmleaf-content">
			<div id="posterTvGrid" style="margin:40px auto 0 auto;"></div>
		</div>
	</div>
	
	<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script type="text/javascript" src="js/posterTvGrid.js"></script>
	<script type="text/javascript">
	var posterTvGrid = new posterTvGrid('posterTvGrid',{className: "posterTvGrid"},[
			{"img":"images\/index4.jpg","title":"","url":"details.jsp?id=6690"},
			{"img":"images\/index3.jpg","title":"","url":"details.jsp?id=2321"},
			{"img":"images\/index5.jpg","title":"","url":"single.jsp?id=14"},
			{"img":"images\/p2463316373.jpg","title":"","url":"details.jsp?id=6691"},
			{"img":"images\/index2.jpg","title":"","url":"details.jsp?id=2311"},
			{"img":"images\/index1.jpg","title":"","url":"details.jsp?id=6688"},
		]
	);
	</script>
  <!-- 轮播框结束 -->
		
<div class="animate-box fh5co-border-bottom" style="margin-left: 28px;margin-top: 40px;margintop">
			<div class="fh5co-gallery">
            <!--正在上映开始-->
            <div class="animate-box">
             <div class="index_name" style="color:#7ac143;">正在上映<span class="icon-play"></span></div>
               
               <%
               
               MovieDaoImpl mdi = new MovieDaoImpl();
               
               for(int i = 0; i < 5; i++) {
            	   Movie movie = new Movie();
            	   movie = mdi.findMovieById(6688+i);
               
               %>
               
               <div class="block">
				<a class="gallery-item" href="details.jsp?id=<%= movie.getId() %>">
					<img src="<%= movie.getCover() %>" alt="<%= movie.getChineseName() %>">
					<span class="overlay">
						<h2><%= movie.getGrade() %>✨</h2>
						<span><%= movie.getActor() %></span>
					</span>
				</a>
                <div class="information">
                <a href="details.jsp?id=<%= movie.getId() %>"><%= movie.getChineseName() %></a>
                </div>
                </div>
				
				<%
               }
				%>
				
              <div class="s2">
              <a href="SearchMovieServlet?search_text=<%= "热门电影推荐" %>" target="_blank"></a>
              </div>
                </div>
			<!--正在上映结束-->	
			<!--热门推荐开始-->	            
            <div class="animate-box">
               <div class="index_name">热门推荐<span class="icon-bell"></span></div>
               
               <%
               
               List<Movie> list = new ArrayList<Movie>();
               list = mdi.findHotRecommandMovie();
               
               for(int i = 0; i < list.size(); i++) {
            	   Movie movie = new Movie();
            	   movie = list.get(i);
               
               %>
               
               <div class="block">
				<a class="gallery-item" href="details.jsp?id=<%= movie.getId() %>">
					<img src="<%= movie.getCover() %>" alt="<%= movie.getChineseName() %>">
					<span class="overlay">
						<h2><%= movie.getGrade() %>✨</h2>
						<span><%= movie.getActor() %></span>
					</span>
				</a>
                <div class="information">
                <a href="details.jsp?id=<%= movie.getId() %>"><%= movie.getChineseName() %></a>
                </div>
                </div>
				
				<%
               }
				%>
				
              <div class="s2">
              <a href="SearchMovieServlet?search_text=<%= "热门电影推荐" %>" target="_blank"></a>
              </div>
                </div>
				<!--热门推荐结束-->
				<% if(id != 0){%>
				  <!--个性化推荐开始-->          
            <div class="animate-box">
              <div class="index_name" style="color:#7ac143;">个性化推荐<span class="icon-heart"></span></div>
              <%
              MovieDaoImpl m = new MovieDaoImpl();
              List<Movie> ms = new ArrayList<Movie>();
              ms = m.doRecommandMovie(id);
              int num = ms.size();
              for(int i = 0; i < (num>5?5:num); i++){
            	  Movie movie = ms.get(i);
              %>
		               <div class="block">
						<a class="gallery-item" href="details.jsp?id=<%= movie.getId() %>">
							<img src="<%= movie.getCover() %>" alt="<%= movie.getChineseName() %>">
							<span class="overlay">
								<h2><%= movie.getGrade() %></h2>
								<span><%= movie.getActor() %></span>
							</span>
						</a>
		                <div class="information">
		                <a href="details.jsp?id=<%= movie.getId() %>"><%= movie.getChineseName() %></a>
		                </div>
		                </div>
				<% } %>
              <div class="s2">
              <a href="#" target="_blank"></a>
              </div>
               </div>
				<!--个性化推荐结束-->
				<% } %>
				<!--专题推荐开始-->            
            <div class="animate-box">
              <div class="index_name">专题推荐<span class="icon-magic"></span></div>
               
               <%
               
               SeriesDaoImpl sdi = new SeriesDaoImpl();
               List<Series> serieses = new ArrayList<Series>();
               serieses = sdi.findHotRecommandSeries();
               
               for(int i = 0; i < serieses.size(); i++) {
            	   Series series = new Series();
            	   series = serieses.get(i);
				   String movielist = series.getMovieList();
				   String [] movies = movielist.split(";*;");
				   int movieid = Integer.parseInt(movies[1]);
				   Movie movie1 = mdi.findMovieById(movieid);
               
               %>
               
               <div class="block">
				<a class="gallery-item" href="seriesdetails.jsp?id=<%= series.getId() %>">
					<img src="<%= movie1.getCover() %>" alt="<%= series.getName() %>">
					<span class="overlay">
						<h2><%= series.getStarNumber() %>👍</h2>
						<span><%= series.getDescription() %></span>
					</span>
				</a>
                <div class="information">
                <a href="seriesdetails.jsp?id=<%= series.getId() %>"><%= series.getName() %></a>
                </div>
                </div>
				
				<%
               }
				%>
				
              <div class="s2">
              <a href="series.jsp" target="_blank">更多</a>
              </div>
                </div>
              <!--专题推荐结束-->  

			</div>
            </div>		
  <!--右侧轮播下主体结束-->
  <!--右边页结束--> 
</div>

<!-- jQuery --> 
<script src="js/jquery.min.js"></script> 
<!-- jQuery Easing --> 
<script src="js/jquery.easing.1.3.js"></script> 
<!-- Bootstrap --> 
<script src="js/bootstrap.min.js"></script> 
<!-- Carousel --> 
<script src="js/owl.carousel.min.js"></script> 
<!-- Stellar --> 
<script src="js/jquery.stellar.min.js"></script> 
<!-- Waypoints --> 
<script src="js/jquery.waypoints.min.js"></script> 
<!-- Counters --> 
<script src="js/jquery.countTo.js"></script> 

<!-- MAIN JS --> 
<script src="js/main.js"></script>
</body>
</html>
