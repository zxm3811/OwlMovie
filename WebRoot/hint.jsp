<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'hint.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="小清新哦">
	<meta http-equiv="description" content="OwlMovie">
	
	<script type="text/javascript">
		setTimeout(function(){window.location.href = "index.jsp";},3000);
	</script>
	
  </head>
  
  <body>
  
  <div class="container">
  	<div class="col-md-12">
  		<img width="100%" height="100%" src="images/hint.jpg"/>
  	</div>
  </div>
    
  </body>
</html>
