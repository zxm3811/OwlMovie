<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>评论管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="layouts/bootstrap.jsp" %>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="/backend/js/ajax.js"></script>
	<script type="text/javascript">
		var xml;
		$(document).ready(function(){
			$.ajax({
				url:'BackendCommentServlet',
				method:'post',
				async:true,
				data:{
					flag:'3'
				},
				cache:false,
				dataType:'xml',
				success:function(data){
					xml = data;
					printInfo(xml);
				},
				error:function(){
					alert("服务器出错，请稍后重试");
				}
			});
		});
		
		function printInfo(xml){
			//xmlDoc = createXml(text); // 创建xml格式的内容，将直接用ajax从Servlet直接获取
			x = xml.documentElement.childNodes;
			xson = x[0].childNodes;
		
			// 打印表头
			var th = "<tr>";
			for(i = 0; i < xson.length; i++){
				th += "<th>"+xson[i].nodeName+"</th>";
			}
			th += "<td></td>";
			th += "</tr>";
			
			$('#content').append(th);
		
			// 打印内容
			for(j = 0; j < x.length; j++){
				xson = x[j].childNodes;
				var td = "<tr>";
				for(i = 0; i < xson.length; i++){
					if(xson[i].firstChild)
						td += "<td>" + xson[i].firstChild.nodeValue + "</td>";
					else
						td += "<td></td>";
				}
				td += "<td><div class=\"btn-group\"><button type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\">操作 <span class=\"caret\"></span></button><ul class=\"dropdown-menu\" role=\"menu\"><li><a href=\"BackendCommentServlet?flag=2&commentid="+xson[0].firstChild.nodeValue+"\">删除</a></li></ul></div></td>";
				$('#content').append(td);
			}
		}
		
		// 将字符串解析为xml格式
		function createXml(str){ 
		if(document.all){ 
			var xmlDom=new ActiveXObject("Microsoft.XMLDOM");
			xmlDom.loadXML(str);
			return xmlDom;
		} 
		else
			return new DOMParser().parseFromString(str, "text/xml");
		}
		
		// js获取get参数
		function getQueryString(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) return unescape(r[2]); return null; 
		}
		
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
            <li class="active"><a href="backend/comment.jsp">评论管理</a></li>
            <li><a href="backend/filmreview.jsp">影评管理</a></li>
            <li><a href="backend/series.jsp">专题管理</a></li>
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
<div class="container table-responsive">
  <table class="table table-hover table-bordered" id="content">
  </table>
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
