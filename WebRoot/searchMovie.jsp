<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
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
  <title>电影搜索</title>
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



  <!-- Modernizr JS -->
  <script src="js/modernizr-2.6.2.min.js"></script>

  <script src="http://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
  <script src="js/jquery-1.8.3.min.js"></script>
  <script src="js/text_overflow.js"></script>
  <script>
  $(document).ready(function(){
	  $('.word').attr("displayLength","50");
	  $('.word').text_overflow();
  });
  </script>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");
String keyword = (String)request.getAttribute("keyword");
List<Movie> movies = (List<Movie>)request.getAttribute("movies");

%>


  <div id="fh5co-page"> 
  <%@ include file="/aside.jsp" %>
  </div>

  <!--主要内容开始-->
  <div id="fh5co-main">
<%@ include file="searchbar.jsp" %>

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
        <a style="border:none;" href="SearchMovieServlet?search_text=<%=keyword %>" class="tag-checked" >电影</a>
        <a style="border:none;" href="SearchSeriesServlet?search_text=<%=keyword %>" class="tab" >专题</a>  
        <a style="border:none;" href="SearchMovieListServlet?search_text=<%=keyword %>" class="tab" >影单</a>
        <a style="border:none;" href="SearchFilmReviewServlet?search_text=<%=keyword %>" class="tab" >影评</a>
      </div>

      <div id="myTabContent" class="tab-content ">
       <!-- 电影开始 -->
       <div class="tab-pane fade in active" id="movie" style="height: 100px;">
        <div  class="seminar">
          <hr>
          
          <%
          
          int filmCurPage = 1;        //当前所在页面，默认情况下当前页面是第一页
          int filmListSize = 8;           //每页显示的记录数，默认为8条
          int filmAllRecords = 0;         //全部的记录数
          int filmPageSize = 1;           //全部的页数
          
          try{
              if(request.getParameter("filmCurPage") != null) {
        	  	  filmCurPage = Integer.parseInt(request.getParameter("filmCurPage"));
              }
          }catch(Exception e) {}
          
          if(movies != null)
          	filmAllRecords = movies.size();
          filmPageSize = (filmAllRecords + filmListSize - 1) / filmListSize;
          
          if(filmAllRecords == 0) {
        	  %>
        	  <center>
        	  <p>Sorry,没有搜索到相关内容...请换个关键字</p>
        	  </center>
        	  <%
          }
          
          for(int i = (filmCurPage-1)*8; i < filmCurPage*8; i++) {
        	  if(i < filmAllRecords) {
        	  	  Movie movie = movies.get(i);
        	  	  String actorlist = movie.getActor();
        	  	  String directorlist = movie.getDirector();
        	  	  String [] actors = actorlist.split("/");
        	  	  String [] directors = directorlist.split("/");
          %>
          
          <dl>
           <dd>
             <div class="col-md-3 col-xs-3"class="film-poster">
                 <a href="details.jsp?&id=<%= movie.getId() %>"><img src="<%=movie.getCover() %> " alt="电影封面" width="140" height="210"></a>
             </div>
             <div class="col-md-8 col-xs-8" class="film-synopsis">
                <h2><a href="details.jsp?&id=<%= movie.getId() %>"><%=movie.getChineseName() %>&nbsp;</a></h2>
                <span class="word">导演: <%for(int k = 0; k < (directors.length>3?3:directors.length); k++ ) {%><%= "<a href=\"SearchMovieServlet?search_text="+directors[k].trim() +"\">"+directors[k] %><%} %></span><br>
                <span class="word">主演：<%for(int k = 0; k < (actors.length>3?3:actors.length); k++ ) {%><%= "<a href=\"SearchMovieServlet?search_text="+actors[k].trim() +"\">"+actors[k] %><%} %></span>
                <p class="word" style="line-height:20px;max-height:200px;overflow:hidden; width: 600px; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 7;">简介：<%=movie.getDescription() %></p>
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
            
            <%if(filmCurPage > 1) {
              %>
                  <a rel="nofollow" href="SearchMovieServlet?search_text=<%=keyword %>&filmCurPage=<%=filmCurPage-1%>" target="_self">上一页&gt; </a>
            <%}
              else {
              %>
                  <a rel="nofollow" href="javascript:volid(0);" target="_self" onclick="retrun false;" style="cursor:not-allowed;">上一页&gt; </a>
            <%}
              int j = filmCurPage;
              
              if(j <= 4) {
            	  for(int i = 1; i <= (filmPageSize>7?7:filmPageSize); i++) {
            		  if(i == filmCurPage) {
            			  %><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
            		  }
            		  else {
            			  %><a rel="nofollow" href="SearchMovieServlet?search_text=<%=keyword %>&filmCurPage=<%=i%>" target="_self" ><%=i %></a><%
            		  }
            	  }
              }
              else {
            	  if(filmPageSize <= 7) {
            		  for(int i = 1; i <= (filmPageSize>filmCurPage?filmPageSize:filmCurPage); i++) {
            			  if(i == filmCurPage) {
                			  %><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="return false;" style="cursor:not-allowed;"><%=i %></a><%
                		  }
                		  else {
                			  %><a rel="nofollow" href="SearchMovieServlet?search_text=<%=keyword %>&filmCurPage=<%=i%>" target="_self" ><%=i %></a><%
                		  }
            		  }
            	  }
            	  
            	  else{
            	  	for(int i = filmCurPage-3; i < (filmPageSize>filmCurPage?filmCurPage:filmPageSize); i++) {
            		  %><a rel="nofollow" href="SearchMovieServlet?search_text=<%=keyword %>&filmCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  	%><a rel="nofollow" href="javascript:volid(0);" target="_self" class="cur" onclick="retrun false;" style="cursor:not-allowed;"><%=j %></a><%
            	  	for(int i = filmCurPage+1; i <= (filmPageSize>filmCurPage+3?filmCurPage+3:filmPageSize); i++) {
            		  %><a rel="nofollow" href="SearchMovieServlet?search_text=<%=keyword %>&filmCurPage=<%=i%>" target="_self"><%=i %></a><%
            	  	}
            	  }
              }
              
              if(filmCurPage < filmPageSize) {
              %>
                  <a rel="nofollow" href="SearchMovieServlet?search_text=<%=keyword %>&filmCurPage=<%=filmCurPage+1%>" target="_self">下一页&gt; </a>
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
      <!-- 电影结束 -->
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
