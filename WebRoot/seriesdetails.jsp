<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.UserDaoImpl"%>
<%@ page import="com.mt.dao.impl.SeriesDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*"%>
<%@ page import="com.mt.dao.*"%>
<%@ page import="java.util.*"%>
<!doctype html>

<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>专题详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="OwlMovie" />
<meta name="keywords"
	content="OwlMovie" />
<link rel="shortcut icon" href="favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

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
<!--<link rel="stylesheet" href="css/style.css">-->
<!--wangliping style-->
<link rel="stylesheet" href="css/z-wangliping.css">
<!--星星-->
<link rel="stylesheet" href="css/xingxing.css">
<!--悬浮窗-->
<link rel='stylesheet prefetch'
	href='http://www.jq22.com/jquery/font-awesome.4.6.0.css'>
<link rel='stylesheet prefetch' href='css/animate.min.css'>
<link rel="stylesheet" type="text/css" href="css/menu.css">


<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>

<script src="http://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
</head>

<body>

<%
	SeriesDaoImpl sdi = new SeriesDaoImpl();
	int seriesid = Integer.parseInt(request.getParameter("id"));
	Series series = sdi.findSeriesBySeriesId(seriesid);
%>

	<!--page开始-->
	<div id="fh5co-page">
		<%@ include file="/aside.jsp" %>
		<!--侧边栏结束-->
		<!--主页面开始-->
		<div id="fh5co-main">
			<%@ include file="searchbar.jsp" %>
			<!--前一半页面开始-->
			<div>
				<!--中间内容开始-->
				<div class="seminar">

					<!--标题开始-->
					<div class="title">
						<h2><%= series.getName() %></h2>
					</div>
					<!--标题结束-->
					<!--介绍开始-->
					<div class="introduce">
						<p><%= series.getDescription() %></p>

					</div>
					<!--介绍结束-->
					<!--收藏开始-->
					<div class="widget">
						<span class="word"> <a href="#"> <i class="icon-heart"></i>
								<span>收藏</span>
						</a>
						</span>

					</div>
					<!--收藏结束-->

					<!--展示开始-->
					<div class="seminar-content">
						<dl>
						<%
						
						String movieList = series.getMovieList();    //获取专题里的电影字符串
						String [] movies = movieList.split(";*;");      //分割获取电影id
						
		          		int listCurPage = 1;        	//当前所在页面，默认情况下当前页面是第一页
		          		int listListSize = 5;           //每页显示的记录数，默认为8条
		          		int listAllRecords = 0;         //全部的记录数
		          		int listPageSize = 1;           //全部的页数
		        			  
		          		try{
		             	 	if(request.getParameter("listCurPage") != null) {
		        	  	  		listCurPage = Integer.parseInt(request.getParameter("listCurPage"));
		              		}
		          		}catch(Exception e) {}
		          
		          		listAllRecords = movies.length-1;
		          		listPageSize = (listAllRecords + listListSize - 1) / listListSize;
		          
		          		for(int i = (listCurPage-1)*5+1; i <= listCurPage*5; i++) {
	        	  			if(i <= listAllRecords) {
								int movieid = Integer.parseInt(movies[i]);
								MovieDaoImpl mdi = new MovieDaoImpl();
								Movie movie = mdi.findMovieById(movieid);
								String actorlist = movie.getActor();
				        	  	String [] actors = actorlist.split("/");
						%>
						
							<dd>
								<div class="col-md-3 col-xs-3 icon"
									style="background:#ff9600;float:left;">
									<span><%= i %></span>      //电影序号
								</div>
								<div class="col-md-3 col-xs-3" class="film-poster">
									<a href="details.jsp?id=<%= movie.getId() %>"><img src="<%= movie.getCover() %>" alt="<%= movie.getChineseName() %>" width="140"
										height="210"></a>
								</div>
								<div class="col-md-8 col-xs-8" class="film-synopsis">
									<h2>
										<a href="details.jsp?id=<%= movie.getId() %>"><%= movie.getChineseName() %>&nbsp;</a>
									</h2>
									<span class="word">导演:<a href="#"><%= movie.getDirector() %></a></span><br>
									<span class="word">主演：<a href="#"><%for(int k = 0; k < (actors.length>3?3:actors.length); k++ ) {%><%= actors[k] %><%} %></a></span>
									<p class="word" style="line-height:20px;max-height:200px;overflow:hidden; width: 600px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 7;">简介：<%= movie.getDescription() %></p>
								</div>
							</dd>
							
						<%
	        	  			}
						}
						%>

						</dl>
					</div>
					<!--展示结束-->

					<!-- 分页开始 -->
			<br>
			<div class="container-fluid">
				<div class="col-xs-12 col-md-12 v_page">
				
            	<%if(listCurPage > 1) {
              	%>
                  	<a rel="nofollow" href="seriesdetails.jsp?&id=<%= series.getId() %>&listCurPage=<%=listCurPage-1%>" target="_self">上一页&gt; </a>
            	<%}
              	else {
              	%>
                  <a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">上一页&gt; </a>
            	<%}
              	int j = listCurPage;
              
              	if(j <= 4) {
            	  	for(int i = 1; i <= (listPageSize>7?7:listPageSize); i++) {
            		  	if(i == listCurPage) {
            			  	%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
            		  	}
            		  	else {
            			  %><a rel="nofollow" href="seriesdetails.jsp?&id=<%= series.getId() %>&listCurPage=<%=i%>" target="_self" ><%=i %></a><%
            		  	}
            	  	}
              	}
              	else {
            	  	if(listPageSize <= 7) {
            		  	for(int i = 1; i <= (listPageSize>listCurPage?listPageSize:listCurPage); i++) {
            			  	if(i == listCurPage) {
                			  	%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
                		  	}
                		  	else {
                			  	%><a rel="nofollow" href="seriesdetails.jsp?&id=<%= series.getId() %>&listCurPage=<%=i%>" target="_self" ><%=i %></a><%
                		  	}
            		  	}
            	  	}
            	  
            	  	else{
            	  		for(int i = listCurPage-3; i < (listPageSize>listCurPage?listCurPage:listPageSize); i++) {
            		  	%><a rel="nofollow" href="seriesdetails.jsp?&id=<%= series.getId() %>&listCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  		}
            	  		%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="retrun false;" style="cursor:not-allowed;"><%=j %></a><%
            	  		for(int i = listCurPage+1; i <= (listPageSize>listCurPage+3?listCurPage+3:listPageSize); i++) {
            		  	%><a rel="nofollow" href="seriesdetails.jsp?&id=<%= series.getId() %>&listCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  		}
            	  	}
              	}
              
              	if(listCurPage < listPageSize) {
              	%>
                  	<a rel="nofollow" href="seriesdetails.jsp?&id=<%= series.getId() %>&listCurPage=<%=listCurPage+1%>" target="_self">下一页&gt; </a>
            	<%}
              	else {
              	%>
                  	<a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">下一页&gt; </a>
            	<%} %>
              	</div>
			</div>
			<br>
			<!-- 分页结束 -->

				</div>
				<!--中间内容结束-->
			</div>
		</div>
		<!--主页面结束-->
	</div>
	<!--page结束-->
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

	<script>
		//星星评分
		starScore($(".scoremark"));
		function starScore(star) {
			star.find(".star ul li a").mouseenter(function() {
				var txt = $(this).attr("data-name");
				var x = $(this).parent("li").index();
				star.find(".tips").html(txt).css("left", -6 + x * 24).show();
			});
			star.find(".star ul li a").mouseleave(function() {
				star.find(".tips").html("").css("left", 0).hide();
			});
		}
	</script>

</body>
</html>
