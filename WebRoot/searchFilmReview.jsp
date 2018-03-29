<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.FilmReviewDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html class="no-js">
<!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>影评搜索页</title>
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



  <!-- Modernizr JS -->
  <script src="js/modernizr-2.6.2.min.js"></script>

  <script src="http://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");
String keyword = (String)request.getAttribute("keyword");
List<FilmReview> reviews = (List<FilmReview>)request.getAttribute("reviews");

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
            <form action="SearchFilmReviewServlet" method="get">
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
        <a style="border:none;" href="SearchMovieListServlet?search_text=<%=keyword %>" class="tab" >影单</a>
        <a style="border:none;" href="SearchFilmReviewServlet?search_text=<%=keyword %>" class="tag-checked" >影评</a>
      </div>

      <div id="myTabContent" class="tab-content ">
      <!-- 影评开始 -->
      <div class="tab-pane fade in active" id="filmReview" style="height: 100px;">
        <div  class="seminar">
          <hr>
          
          <%
          
          int reviewCurPage = 1;        //当前所在页面，默认情况下当前页面是第一页
          int reviewListSize = 8;           //每页显示的记录数，默认为8条
          int reviewAllRecords = 0;         //全部的记录数
          int reviewPageSize = 1;           //全部的页数
          
          try{
              if(request.getParameter("reviewCurPage") != null) {
            	  reviewCurPage = Integer.parseInt(request.getParameter("reviewCurPage"));
              }
          }catch(Exception e) {}
          
          reviewAllRecords = reviews.size();
          reviewPageSize = (reviewAllRecords + reviewListSize - 1) / reviewListSize;
          
          if(reviewAllRecords == 0) {
        	  %>
        	  <center>
        	  <p>Sorry,没有搜索到相关内容...请换个关键字</p>
        	  </center>
        	  <%
          }
          
          for(int i = (reviewCurPage-1)*8; i < reviewCurPage*8; i++) {
        	  if(i < reviewAllRecords) {
        	  	  FilmReview review = reviews.get(i);
        	  	  int mid = review.getMid();
        	  	  MovieDaoImpl mov1 = new MovieDaoImpl();
        	  	  Movie movie1 = new Movie();
        	  	  movie1 = mov1.findMovieById(mid);
        	  
          %>
          
          <dl>
           <dd>
             <div class="col-md-3 col-xs-3"class="film-poster">
                 <a href="#"><img src="<%=movie1.getCover() %> " alt="电影封面" width="140" height="210"></a>
             </div>
             <div class="col-md-8 col-xs-8" class="film-synopsis">
                <h2><a href="single.jsp?id=<%= review.getId() %>"><%=review.getTitle() %>&nbsp;</a></h2>
                <span class="word">作者ID:<a href="#"><%=review.getUid() %></a></span><br>
                <span class="word">影片标题：<a href="#"><%=movie1.getChineseName() %></a></span><br>
                <span class="word">创建时间：<a href="#"><%=review.getDate() %></a></span>
                <p class="word" style="line-height:20px;max-height:200px;overflow:hidden; width: 600px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 7;">主要内容：<%=review.getContent() %></p>
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
              <%if(reviewCurPage > 1) {
              %>
                  <a rel="nofollow" href="SearchFilmReviewServlet?search_text=<%=keyword %>&reviewCurPage=<%=reviewCurPage-1%> " target="_self">上一页&gt; </a>
            <%}
              else {
              %>
                  <a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">上一页&gt; </a>
            <%}
              int k = reviewCurPage;
              
              if(k <= 4) {
            	  for(int i = 1; i <= (reviewPageSize>7?7:reviewPageSize); i++) {
            		  if(i == reviewCurPage) {
            			  %><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
            		  }
            		  else {
            			  %><a rel="nofollow" href="SearchFilmReviewServlet?search_text=<%=keyword %>&reviewCurPage=<%=i%>" target="_self"><%=i %></a><%
            		  }
            	  }
              }
              else {
            	  if(reviewPageSize <= 7) {
            		  for(int i = 1; i <= (reviewPageSize>reviewCurPage?reviewPageSize:reviewCurPage); i++) {
            			  if(i == reviewCurPage) {
                			  %><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
                		  }
                		  else {
                			  %><a rel="nofollow" href="SearchFilmReviewServlet?search_text=<%=keyword %>&reviewCurPage=<%=i%>" target="_self"><%=i %></a><%
                		  }
            		  }
            	  }
            	  
            	  else{
            	  	for(int i = reviewCurPage-3; i < (reviewPageSize>reviewCurPage?reviewCurPage:reviewPageSize); i++) {
            		  %><a rel="nofollow" href="SearchFilmReviewServlet?search_text=<%=keyword %>&reviewCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  	%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="retrun false;" style="cursor:not-allowed;"><%=k %></a><%
            	  	for(int i = reviewCurPage+1; i <= (reviewPageSize>reviewCurPage+3?reviewCurPage+3:reviewPageSize); i++) {
            		  %><a rel="nofollow" href="SearchFilmReviewServlet?search_text=<%=keyword %>&reviewCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  }
              }
              
              if(reviewCurPage < reviewPageSize) {
              %>
                  <a rel="nofollow" href="SearchFilmReviewServlet?search_text=<%=keyword %>&reviewCurPage=<%=reviewCurPage+1%>" target="_self">下一页&gt; </a>
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
      <!-- 影评结束 -->
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
