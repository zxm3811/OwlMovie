<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.MovieListDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>影单搜索页</title>
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
  <link rel="stylesheet" href="css/tags.css">
  <link rel="stylesheet" href="css/z-wangliping.css">



  <script src="js/modernizr-2.6.2.min.js"></script>

  <script src="http://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");
String keyword = (String)request.getAttribute("keyword");
List<MovieList> lists = (List<MovieList>)request.getAttribute("lists");

%>


  <div id="fh5co-page">
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
            <form action="SearchMovieListServlet" method="get">
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
        <a style="border:none;" href="SearchSeriesServlet?search_text=<%=keyword %>" class="tab" >专题</a>  
        <a style="border:none;" href="SearchMovieListServlet?search_text=<%=keyword %>" class="tag-checked" >影单</a>
        <a style="border:none;" href="SearchFilmReviewServlet?search_text=<%=keyword %>" class="tab" >影评</a>
      </div>

      <div id="myTabContent" class="tab-content ">
      <!-- 影单开始 -->
      <div class="tab-pane fade in active" id="filmList" style="height: 100px;">
        <div  class="seminar">
          <hr>
          
          <%
          
          int listCurPage = 1;        //当前所在页面，默认情况下当前页面是第一页
          int listListSize = 8;           //每页显示的记录数，默认为8条
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
        	  <p>Sorry,没有搜索到相关内容...请换个关键字</p>
        	  </center>
        	  <%
          }
          
          for(int i = (listCurPage-1)*8; i < listCurPage*8; i++) {
        	  if(i < listAllRecords) {
        	  	  MovieList list = lists.get(i);
        	  	  
        	  	  String movieList = list.getMovieList();
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
                 <a href="movielistdetails.jsp?&id=<%= list.getId() %>"><img src="<%=movie1.getCover() %>" alt="影单封面" width="140" height="210"></a>
             </div>
             <div class="col-md-8 col-xs-8" class="film-synopsis">
                <h2><a href="movielistdetails.jsp?&id=<%= list.getId() %>"><%=list.getName() %>&nbsp;</a></h2>
                <span class="word">创建者ID：<a href="#"><%=list.getUid() %></a></span><br>
                <span class="word">创建时间：<a href="#"><%=list.getCreateTime() %></a></span>
                <p class="word"  style="line-height:20px;max-height:200px;overflow:hidden; width: 600px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 7;">简介：<%=list.getDescription() %></p>
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
                
            <%if(listCurPage > 1) {
              %>
                  <a rel="nofollow" href="SearchMovieListServlet?search_text=<%=keyword %>&listCurPage=<%=listCurPage-1%>" target="_self">上一页&gt; </a>
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
            			  %><a rel="nofollow" href="SearchMovieListServlet?search_text=<%=keyword %>&listCurPage=<%=i%>" target="_self" ><%=i %></a><%
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
                			  %><a rel="nofollow" href="SearchMovieListServlet?search_text=<%=keyword %>&listCurPage=<%=i%>" target="_self" ><%=i %></a><%
                		  }
            		  }
            	  }
            	  
            	  else{
            	  	for(int i = listCurPage-3; i < (listPageSize>listCurPage?listCurPage:listPageSize); i++) {
            		  %><a rel="nofollow" href="SearchMovieListServlet?search_text=<%=keyword %>&listCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  	%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="retrun false;" style="cursor:not-allowed;"><%=j %></a><%
            	  	for(int i = listCurPage+1; i <= (listPageSize>listCurPage+3?listCurPage+3:listPageSize); i++) {
            		  %><a rel="nofollow" href="SearchMovieListServlet?search_text=<%=keyword %>&listCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  }
              }
              
              if(listCurPage < listPageSize) {
              %>
                  <a rel="nofollow" href="SearchMovieListServlet?search_text=<%=keyword %>&listCurPage=<%=listCurPage+1%>" target="_self">下一页&gt; </a>
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
      <!-- 影单结束 -->
    </div>
  </div>
</div>
<script>
 $(function (){
  $('#myTab a').click(function(){
    $('.tag-checked').addClass('tag');
    $('.tag-checked').removeClass('tag-checked');
    $(this).addClass('tag-checked');
  });
  //$('#myTab eq(0) a').tab('show');
});
</script>
<!-- 选项卡结束 -->



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
