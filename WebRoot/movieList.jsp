<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.MovieListDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>影单推荐</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="OwlMovie" />
<meta name="keywords" content="OwlMovie" />
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
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

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
<!--Appshow-->
<script type="text/javascript" src="path/to/js/xSlider.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="./css/app.css">
<link href="css/series.css" rel="stylesheet" type="text/css">
<!--lunbo-->
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="css/jquery-yys-slider.css">
<link href="css/tags.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".fh5co-active").removeClass('fh5co-active');
	$('#movielistpage').addClass("fh5co-active");
});

</script>

</head>
<body>
<%

MovieListDaoImpl mldi = new MovieListDaoImpl();
List<MovieList> lists = mldi.findAllMovieList();

%>


	<div id="fh5co-page">
<!-- 侧边栏开始 -->
  <%@ include file="/aside.jsp" %>
  <!--侧边栏结束-->
		<div id="fh5co-main">
			<%@ include file="searchbar.jsp" %>

			<!--轮播开始-->
			<div class="slider">

				<div class="slider-img">
					<ul class="slider-img-ul">
						<li><a href="#"><img src="images/movielist1.jpg"></a></li>
						<li><a href="#"><img src="images/movielist2.jpg"></a></li>
						<li><a href="#"><img src="images/movielist1.jpg"></a></li>
						<li><a href="#"><img src="images/movielist2.jpg"></a></li>
					</ul>
				</div>

			</div>


			<script src="http://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"
				type="text/javascript"></script>
			<script>
				window.jQuery
						|| document
								.write('<script src="js/jquery-1.11.0.min.js"><\/script>')
			</script>
			<script type="text/javascript" src="./js/xSlider.js"></script>

			<!--轮播结束-->


			<div class="animate-box fh5co-border-bottom"
				style="margin-left: 28px;margin-top: 40px;margintop">
				<div class="fh5co-gallery">

					<%
          
          			int listCurPage = 1;        	//当前所在页面，默认情况下当前页面是第一页
          			int listListSize = 4;           //每页显示的记录数，默认为8条
          			int listAllRecords = 0;         //全部的记录数
          			int listPageSize = 1;           //全部的页数
        			  
          			try{
             	 		if(request.getParameter("listCurPage") != null) {
        	  	  			listCurPage = Integer.parseInt(request.getParameter("listCurPage"));
              			}
          			}catch(Exception e) {}
          
          			listAllRecords = lists.size();
          			listPageSize = (listAllRecords + listListSize - 1) / listListSize;
          
          			if(listAllRecords == 0) {
        	  			%>
        	  			<center>
        	  			<p>Sorry,没有检索到影单信息...</p>
        	  			</center>
        	  			<%
          			}
          
          			for(int i = (listCurPage-1)*4; i < listCurPage*4; i++) {
        	  			if(i < listAllRecords) {
        	  	 			MovieList list = lists.get(i);
        	  	  
        	  	  			String movieList = list.getMovieList();
    						String [] movies = movieList.split(";*;");
        	  
          			%>
          
					<div class="animate-box">
						<dt>
							<h3>
								<a href="movielistdetails.jsp?id=<%=list.getId() %>" target="_blank"><%=list.getName() %></a>
							</h3>
							<div class="s1"><%=list.getDescription() %></div>
						</dt>
						
						<%
						
						for(int j = 1; j < (movies.length>6?6:movies.length); j++) {
        	  	  			String movie = movies[j];
        	  	  			int movieId = Integer.parseInt(movie);
        	  	  			MovieDaoImpl mov = new MovieDaoImpl();
        	  	  			Movie movie1 = new Movie();
        	  	  			movie1 = mov.findMovieById(movieId);

						
						%>
						
						<div class="block">
							<a class="gallery-item" href="details.jsp?id=<%= movie1.getId() %>"> <img src="<%=movie1.getCover() %>" alt="Free HTML5 Bootstrap Template by FreeHTML5.co">
								<span class="overlay">
									<h2><%=movie1.getGrade() %>✨</h2> <span><%=movie1.getActor() %></span>
								</span>
							</a>
							<div class="information">
								<a href="details.jsp?id=<%= movie1.getId() %>"><%=movie1.getChineseName() %></a>
							</div>
						</div>
						
						<%
						}
						%>
						
						<div class="s2">
							<a href="movielistdetails.jsp?id=<%=list.getId() %>" target="_blank">更多</a>
						</div>
					</div>
					<%
        	  			}
          			}
         			%>

				</div>
			</div>
			
			<!-- 分页开始 -->
			<br>
			<div class="container-fluid">
				<div class="col-xs-12 col-md-12 v_page">
					    
            	<%if(listCurPage > 1) {
              	%>
                  	<a rel="nofollow" href="movieList.jsp?&listCurPage=<%=listCurPage-1%>" target="_self">上一页&gt; </a>
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
            			  %><a rel="nofollow" href="movieList.jsp?&listCurPage=<%=i%>" target="_self" ><%=i %></a><%
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
                			  	%><a rel="nofollow" href="movieList.jsp?&listCurPage=<%=i%>" target="_self" ><%=i %></a><%
                		  	}
            		  	}
            	  	}
            	  
            	  	else{
            	  		for(int i = listCurPage-3; i < (listPageSize>listCurPage?listCurPage:listPageSize); i++) {
            		  	%><a rel="nofollow" href="movieList.jsp?&listCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  		}
            	  		%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="retrun false;" style="cursor:not-allowed;"><%=j %></a><%
            	  		for(int i = listCurPage+1; i <= (listPageSize>listCurPage+3?listCurPage+3:listPageSize); i++) {
            		  	%><a rel="nofollow" href="movieList.jsp?&listCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  		}
            	  	}
              	}
              
              	if(listCurPage < listPageSize) {
              	%>
                  	<a rel="nofollow" href="movieList.jsp?&listCurPage=<%=listCurPage+1%>" target="_self">下一页&gt; </a>
            	<%}
              	else {
              	%>
                  	<a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">下一页&gt; </a>
            	<%} %>
              	</div>
			</div>
			<br>
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
	</div>
</body>
</html>

