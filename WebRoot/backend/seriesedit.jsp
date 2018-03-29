<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mt.dao.impl.*, com.mt.vo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>专题管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="layouts/bootstrap.jsp" %>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="/backend/js/ajax.js"></script>
	<script type="text/javascript">
	</script>
  </head>
<body>
<!-- 顶栏开始 -->
  <nav class="navbar navbar-inverse navbar-static-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="backend/user.jsp">OwlMovie网站后台</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-left">
            <li><a href="backend/user.jsp">用户管理</a></li>
            <li><a href="backend/movie.jsp">电影管理</a></li>
            <li><a href="backend/comment.jsp">评论管理</a></li>
            <li><a href="backend/filmreview.jsp">影评管理</a></li>
            <li class="active"><a href="backend/series.jsp">专题管理</a></li>
            <li><a href="backend/movielist.jsp">影单管理</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">退出</a></li>
          </ul>
        </div>
      </div>
    </nav>
<!-- 顶栏结束 -->
<!-- 页面部分开始 -->
<div class="container">
  
  <%
	int seriesid = Integer.parseInt(request.getParameter("seriesid"));
  	SeriesDaoImpl sdi = new SeriesDaoImpl();
  	Series series = sdi.findSeriesBySeriesId(seriesid);
  %>
  
  <form class="form-horizontal" action="BackendSeriesServlet" method="post">
    <fieldset>
      <div id="legend" class="">
        <legend class="">添加专题</legend>
      </div>
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">专题名称</label>
          <div class="controls">
            <input type="text" placeholder="" class="input-xlarge" name="name" value="<%= series.getName() %>">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">

          <!-- Textarea -->
          <label class="control-label">描述</label>
          <div class="controls">
            <div class="textarea">
                  <textarea type="" class="" name="description"><%= series.getDescription() %></textarea>
            </div>
          </div>
        </div><div class="control-group">
        
        <input type="text" value="4" name="flag" hidden="hidden"/>
		<input type="text" value="<%= series.getId() %>" name="seriesid" hidden="hidden"/>
          <!-- Text input-->
          <label class="control-label" for="input01">电影列表</label>
          <div class="controls">
            <input type="text" placeholder=";2305;" class="input-xlarge" name="movielist" value="<%= series.getMovieList() %>">
            <p class="help-block">请在每个电影id前后加上英文输入法状态下的分号</p>
          </div>
        </div>

    <div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-default">提交</button>
          </div>
        </div>

    </fieldset>
  </form>
  
</div>
<!-- 页面部分结束 -->

<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"><\/script>')</script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="https://cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
  </body>
</html>
