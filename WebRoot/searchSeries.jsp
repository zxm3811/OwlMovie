<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.SeriesDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>专题搜索页</title>
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
  <!-- <link rel="stylesheet" href="css/style.css"> -->
  <link rel="stylesheet" href="css/tags.css">
  <link rel="stylesheet" href="css/z-wangliping.css">



  <script src="js/modernizr-2.6.2.min.js"></script>

  <script src="http://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");
String keyword = (String)request.getAttribute("keyword");
List<Series> serieses = (List<Series>)request.getAttribute("serieses");

%>


  <div id="fh5co-page">
  <!-- 侧边栏开始 -->
  <%@ include file="/aside.jsp" %>
  <!--侧边栏结束-->
  </div>

  <!--主要内容开始-->
  <div id="fh5co-main">
<!--顶栏开始-->
    <div id="db-nav-movie" class="nav">
      <div class="nav-wrap">
        <div class="nav-primary">
          <div class="nav-logo">
            <a href="#">MT</a>
          </div>
          <div class="nav-search">
            <form action="SearchSeriesServlet" method="get">
              <fieldset>
                <legend>搜索：</legend>
                <label for="inp-query"></label>
                <div class="inp">
                  <input id="inp-query" name="search_text" size="16px" maxlength="60" placeholder="电影、专题" value="${name}" autocomplete="off">
                </div>
                <div class="inp-btn"><input type="submit" value="搜索"></div>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!--顶栏结束-->

    <!-- 选项卡开始 -->
    <style>
      a.tag-checked{
        padding-bottom: 20px;
        color: white !important;
      }
       .tabs{
        margin: 0;
        font-size: 13px;
      } 
    </style>
    <div class="row" style="text-align: center;">
      <div class="tabs" id="myTab">
        <a style="border:none;" href="SearchMovieServlet?search_text=<%=keyword %>" class="tab" >电影</a>
        <a style="border:none;" href="SearchSeriesServlet?search_text=<%=keyword %>" class="tag-checked" >专题</a>  
        <a style="border:none;" href="SearchMovieListServlet?search_text=<%=keyword %>" class="tab" >影单</a>
        <a style="border:none;" href="SearchFilmReviewServlet?search_text=<%=keyword %>" class="tab" >影评</a>
      </div>

      <div id="myTabContent" class="tab-content ">
      <!-- 专题开始 -->
      <div class="tab-pane fade in active" id="series" style="height: 100px;">
        <div  class="seminar">
          <hr>
          
          <%
          
          int seriesCurPage = 1;        //当前所在页面，默认情况下当前页面是第一页
          int seriesListSize = 8;           //每页显示的记录数，默认为8条
          int seriesAllRecords = 0;         //全部的记录数
          int seriesPageSize = 1;           //全部的页数
          
          try{
              if(request.getParameter("seriesCurPage") != null) {
        	  	  seriesCurPage = Integer.parseInt(request.getParameter("seriesCurPage"));
              }
          }catch(Exception e) {}
          
          seriesAllRecords = serieses.size();
          seriesPageSize = (seriesAllRecords + seriesListSize - 1) / seriesListSize;
          
          if(seriesAllRecords == 0) {
        	  %>
        	  <center>
        	  <p>Sorry,没有搜索到相关内容...请换个关键字</p>
        	  </center>
        	  <%
          }
          
          for(int i = (seriesCurPage-1)*8; i < seriesCurPage*8; i++) {
        	  if(i < seriesAllRecords) {
        	  	  Series series = serieses.get(i);
        	  	  
        	  	  String movieList = series.getMovieList();
        	  	  String [] movies = movieList.split(";*;");
        	  	  String movie = movies[1];
        	  	  int movieId = Integer.parseInt(movie);
        	  	  MovieDaoImpl mov = new MovieDaoImpl();
        	  	  Movie movie1 = new Movie();
        	  	  movie1 = mov.findMovieById(movieId);
        	  
          %>
          
          <dl>
           <dd>
             <div class="col-md-3 col-xs-3"class="film-poster">
                 <a href="seriesdetails.jsp?&id=<%= series.getId() %>"><img src="<%=movie1.getCover() %>" alt="专题封面" width="140" height="210"></a>
             </div>
             <div class="col-md-8 col-xs-8" class="film-synopsis">
                <h2><a href="seriesdetails.jsp?&id=<%= series.getId() %>"><%=series.getName() %>&nbsp;</a></h2>
                <p class="word"  style="line-height:20px;max-height:200px;overflow:hidden; width: 600px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 7;">简介：<%=series.getDescription() %></p>
             </div>
           </dd>
         </dl>
         
         <%
        	  }
          }
          %>
         
          <!--翻页开始-->
            <div class="container-fluid">
            <div class="col-xs-12 col-md-12 v_page">
              
            <%if(seriesCurPage > 1) {
              %>
                  <a rel="nofollow" href="SearchSeriesServlet?search_text=<%=keyword %>&seriesCurPage=<%=seriesCurPage-1%>" target="_self">上一页&gt; </a>
            <%}
              else {
              %>
                  <a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">上一页&gt; </a>
            <%}
              int j = seriesCurPage;
              
              if(j <= 4) {
            	  for(int i = 1; i <= (seriesPageSize>7?7:seriesPageSize); i++) {
            		  if(i == seriesCurPage) {
            			  %><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
            		  }
            		  else {
            			  %><a rel="nofollow" href="SearchSeriesServlet?search_text=<%=keyword %>&seriesCurPage=<%=i%>" target="_self" ><%=i %></a><%
            		  }
            	  }
              }
              else {
            	  if(seriesPageSize <= 7) {
            		  for(int i = 1; i <= (seriesPageSize>seriesCurPage?seriesPageSize:seriesCurPage); i++) {
            			  if(i == seriesCurPage) {
                			  %><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
                		  }
                		  else {
                			  %><a rel="nofollow" href="SearchSeriesServlet?search_text=<%=keyword %>&seriesCurPage=<%=i%>" target="_self" ><%=i %></a><%
                		  }
            		  }
            	  }
            	  
            	  else{
            	  	for(int i = seriesCurPage-3; i < (seriesPageSize>seriesCurPage?seriesCurPage:seriesPageSize); i++) {
            		  %><a rel="nofollow" href="SearchSeriesServlet?search_text=<%=keyword %>&seriesCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  	%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="retrun false;" style="cursor:not-allowed;"><%=j %></a><%
            	  	for(int i = seriesCurPage+1; i <= (seriesPageSize>seriesCurPage+3?seriesCurPage+3:seriesPageSize); i++) {
            		  %><a rel="nofollow" href="SearchSeriesServlet?search_text=<%=keyword %>&seriesCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  }
              }
              
              if(seriesCurPage < seriesPageSize) {
              %>
                  <a rel="nofollow" href="SearchSeriesServlet?search_text=<%=keyword %>&seriesCurPage=<%=seriesCurPage+1%>" target="_self">下一页&gt; </a>
            <%}
              else {
              %>
                  <a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">下一页&gt; </a>
            <%} %>
              
            </div>
            </div>
            <!--翻页结束-->
        </div>
      </div>
      <!-- 专题结束 -->
    </div>
  </div>
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
