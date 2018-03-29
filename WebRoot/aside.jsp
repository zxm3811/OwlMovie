<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.File" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.mt.dao.impl.UserDaoImpl"%>
<%

Cookie[] cookies = request.getCookies();
String name = null;
int id = 0;
if(cookies != null)
	for(int i = 0; i < cookies.length; i++){
		String cname = cookies[i].getName();
		String cvalue = URLDecoder.decode(cookies[i].getValue(), "utf-8");
		//String cvalue = cookies[i].getValue();
		if(cname.equals("username")){
			name = cvalue;
			System.out.println(name);
		}
		else if(cname.equals("id")){
			id = Integer.parseInt(cvalue);
		}
	}

%>
<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
<%
UserDaoImpl udi = new UserDaoImpl();
%>
<aside id="fh5co-aside" role="complementary" class="border js-fullheight">
  <h1 id="fh5co-logo"><a href="<%= id==0?"login.jsp":"center.jsp?id="+id %>"><img id="touxiang" title="<%= name==null?"登陆":udi.findUserById(id).getName() %>" src="images/touxiang/<%= (new File(id+".jpg")).exists() ?  id+".jpg" : "head.jpg" %>"></a></h1>
  <nav id="fh5co-main-menu" role="navigation">
    <ul>
      <li id="indexpage"><a href="index.jsp">主页</a></li>
      <li id="tagpage"><a href="tag.jsp">分类</a></li>
      <li id="seriespage"><a href="series.jsp">专题</a></li>
      <li id="movielistpage"><a href="movieList.jsp">影单</a></li>
      <li id="informationpage"><a href="information.jsp">资讯</a></li>
      <% if(name!=null){ %>
      <li id="centerpage"><a href="center.jsp?id=<%= id %>">个人中心</a></li>
      <% } %>
    </ul>
  </nav>
  <div class="fh5co-footer">
    <img src="images/logo.png"/>
    <ul>
      <li><a href="LogoutServlet" style="font-size:14px;">退出</a></li>
    </ul>
  </div>
</aside>

