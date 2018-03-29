<%@page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>分类</title>
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
	<link rel="stylesheet" href="css/style.css">
	<link href="css/tags.css" rel="stylesheet" type="text/css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$(".fh5co-active").removeClass('fh5co-active');
	$('#tagpage').addClass("fh5co-active");
});
</script>
	</head>
	<body id="top">
<%

MovieDaoImpl mov = new MovieDaoImpl();
List<Movie> movies = new ArrayList<Movie>();
movies = mov.doSelectClassicMovie();

%>
	

<!-- 整个页面 -->
    <div id="fh5co-page">
    <!-- 边栏开始 -->
		<%@ include file="/aside.jsp" %>
		<!-- 边栏结束 -->
		<!-- 右侧主页开始 -->
		<div id="fh5co-main">
<!-- 搜索框开始 -->
	<div id="db-nav-movie" class="nav">
	  <div class="nav-wrap">
	   <div class="nav-primary">
	    <div class="nav-logo">
	    <a href="#">MT</a>
	    </div>
	    <div class="nav-search">
	    <form action="#" method="get">
	    <fieldset>
	    <legend>搜索：</legend>
	    <label for="inp-query"></label>
	    <div class="inp">
	    <input id="inp-query" name="search_text" size="16px" maxlength="60" placeholder="电影、影人" value="" autocomplete="off">
	    </div>
	    <div class="inp-btn"><input type="submit" value="搜索"></div>
	    </fieldset>
	    </form>
	    </div>
	   </div>
	  </div>
	</div>
<!-- 搜索框结束 -->
<div class="animate-box fh5co-border-bottom">
          <ul class="category category-type">
            <li><span class="tag-checked tag" id="">全部类型</span></li>
            <li><span class="tag" id="爱情">爱情</span></li>
            <li><span class="tag" id="剧情">剧情</span></li>
            <li><span class="tag" id="喜剧">喜剧</span></li>
            <li><span class="tag" id="动作">动作</span></li>
            <li><span class="tag" id="科幻">科幻</span></li>
            <li><span class="tag" id="悬疑">悬疑</span></li>
            <li><span class="tag" id="犯罪">犯罪</span></li>
            <li><span class="tag" id="战争">战争</span></li>
            <li><span class="tag" id="文艺">文艺</span></li>
            <li><span class="tag" id="恐怖">恐怖</span></li>
            <li><span class="tag" id="传记">传记</span></li>
            <li><span class="tag" id="家庭">家庭</span></li>
            <li><span class="tag" id="音乐">音乐</span></li>
            <li><span class="tag" id="青春">青春</span></li>
            <li><span class="tag" id="励志">励志</span></li>
          </ul>
           <ul class="category category-area">
            <li><span class="tag-checked tag" id="">全部地区</span></li>
            <li><span class="tag" id="大陆">大陆</span></li>
            <li><span class="tag" id="美国">美国</span></li>
            <li><span class="tag" id="香港">香港</span></li>
            <li><span class="tag" id="台湾">台湾</span></li>
            <li><span class="tag" id="日本">日本</span></li>
            <li><span class="tag" id="韩国">韩国</span></li>
            <li><span class="tag" id="泰国">泰国</span></li>
            <li><span class="tag" id="印度">印度</span></li>
            <li><span class="tag" id="法国">法国</span></li>
            <li><span class="tag" id="英国">英国</span></li>
            <li><span class="tag" id="德国">德国</span></li>
            <li><span class="tag" id="意大利">意大利</span></li>
            <li><span class="tag" id="西班牙">西班牙</span></li>
            <li><span class="tag" id="俄罗斯">俄罗斯</span></li>
            <li><span class="tag" id="伊朗">伊朗</span></li>
            <li><span class="tag" id="加拿大">加拿大</span></li>
            <li><span class="tag" id="澳大利亚">澳大利亚</span></li>
            <li><span class="tag" id="爱尔兰">爱尔兰</span></li>
            <li><span class="tag" id="巴西">巴西</span></li>
            <li><span class="tag" id="瑞典">瑞典</span></li>
            <li><span class="tag" id="丹麦">丹麦</span></li>
          </ul>
        
        <div class="tag-nav">
          <div class="tabs" id="sort">
            <a href="#" index="1" class="tab tab-checked">按热度排序</a> 
            <a href="#" index="2" class="tab">按评价排序</a>
          </div>
        </div>
    </div>
        
<!-- block开始 -->
		<div class="ani  mate-box fh5co-border-bottom" style="margin-left: 28px;margin-top: 40px;margintop">
			<div class="fh5co-gallery" id="append-list">
			<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
			<script type="text/javascript">
			
			var chineseNames;
			var originalNames;
			var ids ;
			var lengths ;
			var languages;
			var directors;
			var actors;
			var tags;
			var areas;
		    var covers;
			var grades ;
			var starNumbers;
		    var commentNumbers;
			var descriptions;
			var xml;
			var pageCur= 1;
			var type = null;
			var area = null;
			$(document).ready(function(){
				if(pageCur == "")
					pageCur = 1;
				$.ajax({
					url:'TagServlet',
					async:true,
					data:{
						type:type,
						area:area
					},
					type:'POST',
					cache:false,
					dataType:'xml',
					success:function(data){
						chineseNames = data.getElementsByTagName("chineseName");
						originalNames = data.getElementsByTagName("originalName");
						ids = data.getElementsByTagName("id");
						lengths = data.getElementsByTagName("length");
						languages = data.getElementsByTagName("language");
						directors = data.getElementsByTagName("director");
						actors = data.getElementsByTagName("actor");
						tags = data.getElementsByTagName("tag");
						areas = data.getElementsByTagName("area");
						covers = data.getElementsByTagName("cover");
						grades = data.getElementsByTagName("grade");
						starNumbers = data.getElementsByTagName("starNumber");
						commentNumbers = data.getElementsByTagName("commentNumber");
						descriptions = data.getElementsByTagName("description");
						xml = data;
						pageCur = 1;
						printMovie(pageCur);
					},
					error:function(){
						alert("服务器出错，请稍候重试。");
					}
			});
				$(".category-type span").click(function(){
					type = $(this).attr('id');
					$(".category-type .tag-checked").addClass("tab");
					$(".category-type .tag-checked").removeClass("tag-checked");
					$(this).removeClass("tab");
					$(this).addClass("tag-checked");
					$.ajax({
						url:'TagServlet',
						async:true,
						data:{
							type:type,
							area:area
						},
						type:'POST',
						cache:false,
						dataType:'xml',
						success:function(data){
							chineseNames = data.getElementsByTagName("chineseName");
							originalNames = data.getElementsByTagName("originalName");
							ids = data.getElementsByTagName("id");
							lengths = data.getElementsByTagName("length");
							languages = data.getElementsByTagName("language");
							directors = data.getElementsByTagName("director");
							actors = data.getElementsByTagName("actor");
							tags = data.getElementsByTagName("tag");
							areas = data.getElementsByTagName("area");
							covers = data.getElementsByTagName("cover");
							grades = data.getElementsByTagName("grade");
							starNumbers = data.getElementsByTagName("starNumber");
							commentNumbers = data.getElementsByTagName("commentNumber");
							descriptions = data.getElementsByTagName("description");
							xml = data;
							pageCur = 1;
							$(".block").remove();
							$(".pagepage").remove();
							printMovie(pageCur);
						},
						error:function(){
							alert("服务器出错，请稍候重试。");
						}
				});
				});
				$(".category-area span").click(function(){
					area = $(this).attr('id');
					$(".category-area .tag-checked").addClass("tab");
					$(".category-area .tag-checked").removeClass("tag-checked");
					$(this).removeClass("tab");
					$(this).addClass("tag-checked");
					$.ajax({
						url:'TagServlet',
						async:true,
						data:{
							type:type,
							area:area
						},
						type:'POST',
						cache:false,
						dataType:'xml',
						success:function(data){
							chineseNames = data.getElementsByTagName("chineseName");
							originalNames = data.getElementsByTagName("originalName");
							ids = data.getElementsByTagName("id");
							lengths = data.getElementsByTagName("length");
							languages = data.getElementsByTagName("language");
							directors = data.getElementsByTagName("director");
							actors = data.getElementsByTagName("actor");
							tags = data.getElementsByTagName("tag");
							areas = data.getElementsByTagName("area");
							covers = data.getElementsByTagName("cover");
							grades = data.getElementsByTagName("grade");
							starNumbers = data.getElementsByTagName("starNumber");
							commentNumbers = data.getElementsByTagName("commentNumber");
							descriptions = data.getElementsByTagName("description");
							xml = data;
							pageCur = 1;
							$(".block").remove();
							$(".pagepage").remove();
							printMovie(pageCur);
						},
						error:function(){
							alert("服务器出错，请稍候重试。");
						}
					});
				});
				$('#sort a').click(function(){
					$('#sort .tab-checked').addClass('tab-checked');
					$('#sort .tab-checked').removeClass('tab-checked');
					$(this).addClass('tab-checked');
					$.ajax({
						url:'TagServlet',
						async:true,
						data:{
							type:type,
							area:area,
							flag:$(this).attr('index')
						},
						type:'POST',
						cache:false,
						dataType:'xml',
						success:function(data){
							chineseNames = data.getElementsByTagName("chineseName");
							originalNames = data.getElementsByTagName("originalName");
							ids = data.getElementsByTagName("id");
							lengths = data.getElementsByTagName("length");
							languages = data.getElementsByTagName("language");
							directors = data.getElementsByTagName("director");
							actors = data.getElementsByTagName("actor");
							tags = data.getElementsByTagName("tag");
							areas = data.getElementsByTagName("area");
							covers = data.getElementsByTagName("cover");
							grades = data.getElementsByTagName("grade");
							starNumbers = data.getElementsByTagName("starNumber");
							commentNumbers = data.getElementsByTagName("commentNumber");
							descriptions = data.getElementsByTagName("description");
							xml = data;
							pageCur = 1;
							$(".block").remove();
							$(".pagepage").remove();
							printMovie(pageCur);
						},
						error:function(){
							alert("服务器出错，请稍候重试。");
						}
					});
				});
			});
			
			function sendRequest(type,area){
				$.ajax({
					url:'TagServlet',
					async:true,
					data:{
						type:type,
						area:area
					},
					type:'POST',
					cache:false,
					dataType:'xml',
					success:function(data){
						chineseNames = data.getElementsByTagName("chineseName");
						originalNames = data.getElementsByTagName("originalName");
						ids = data.getElementsByTagName("id");
						lengths = data.getElementsByTagName("length");
						languages = data.getElementsByTagName("language");
						directors = data.getElementsByTagName("director");
						actors = data.getElementsByTagName("actor");
						tags = data.getElementsByTagName("tag");
						areas = data.getElementsByTagName("area");
						covers = data.getElementsByTagName("cover");
						grades = data.getElementsByTagName("grade");
						starNumbers = data.getElementsByTagName("starNumber");
						commentNumbers = data.getElementsByTagName("commentNumber");
						descriptions = data.getElementsByTagName("description");
						xml = data;
					},
					error:function(){
						alert("服务器出错，请稍候重试。");
					}
			});
			}
			
			function printMovie(pageCur){
				//var pagePre = pageCur-1;
				//var pageNext = pageCur+1;
				var index = (pageCur-1)*20;
				for(var i = 0; i < 20; i++){
					var tmp = i+index;
					var str = "<div class=\"block \"><a class=\"gallery-item\" href=\"details.jsp?id="+getValue(ids[tmp])+"\"><img id=\"img" + i + "\" src=\"" + getValue(covers[tmp])+ " \" alt=\"Free HTML5 Bootstrap Template by FreeHTML5.co\"><span class=\"overlay\"><h2 id=\"h2"+i+"\">" + getValue(grades[tmp])+ " </h2><span id=\"span"+i+"\">主演：" + getValue(actors[tmp])+ " </span></span></a><div class=\"information \"><a id=\"a"+i+"\"\" href=\"details.jsp?id=" + getValue(ids[tmp])+ "\">" + getValue(chineseNames[tmp])+ " </a></div></div>";
					
					$("#append-list").append(str);
				}
				// 打印页码
				/*var page = "<div class=\"container-fluid\">";
				if(pageCur == 1){
					page += "<a rel=\"nofollow\" target=\"_self\" class=\"bunengdian\">&lt;上一页</a>";
				}
				else{
					page += "<a rel=\"nofollow\" target=\"_self\" href=\"\">&lt;上一页</a>";
				}*/
				printPage();
			}
			
			function printPage(){
				// 计算一共有多少页
				var pageCount = Math.ceil(areas.length/20);
				var pageStart = pageCur-3;
				var pageEnd = 0;
				var pagePre = pageCur-1;
				var pageNext = parseInt(pageCur)+1;
				var pageStr = "<div class=\"container-fluid pagepage\"><div class=\"col-xs-12 col-md-12 v_page\">";
				if(pageStart <= 0)
					pageStart = 1;
				pageEnd = parseInt(pageStart)+6;
				if(pageEnd > pageCount){
					pageEnd = pageCount;
				}
				if(pageCur == 1)
					pageStr += "<a rel=\"nofollow\" class=\"tata bunengdian\" href=\"#top\">&lt;上一页</a>";
				else
					pageStr += "<a rel=\"nofollow\" href=\"#top\" class=\"tata\" id=\"" + pagePre + "\" onclick=\"changeMovie("+pagePre+")\">&lt;上一页</a>";

				for(var i = pageStart; i <= pageEnd; i++){
					if(i == pageCur){
						pageStr += "<a href=\"#top\" rel=\"nofollow\" class=\"tata bunengdian cur\">"+i+"</a>";
					}
					else{
						pageStr += "<a href=\"#top\" rel=\"nofollow\" class=\"tata\" id=\""+i+"\" onclick=\"changeMovie("+i+")\">"+i+"</a>";
					}
				}
				if(pageCur == pageCount)
					pageStr += "<a href=\"#top\" rel=\"nofollow\" class=\"tata bunengdian\">下一页&gt;</a>";
				else
					pageStr += "<a href=\"#top\" rel=\"nofollow\" class=\"tata\" id=\"" + pageNext + "\" onclick=\"changeMovie("+pageNext+")\">下一页&gt;</a>";	
				pageStr += "</div></div>";
				$("#append-list").append(pageStr);
			}
			
			function changeMovie(pageNext){
				sendRequest(type, area);
				pageCur = pageNext;
				$(document).ready(function(){
					var index = (pageCur-1)*20;
					for(var i = 0; i < 20; i++){
						var tmp = i+index;
						$("#img"+i).attr("src", getValue(covers[tmp]));
						$("#h2"+i).html(getValue(grades[tmp]));
						$("#span"+i).html("主演："+getValue(actors[tmp]));
						$("#a"+i).attr("href", "details.jsp?id="+getValue(ids[tmp]));
						//$("#a"+i).html(getValue(chineseNames[tmp]));
						document.getElementById("a"+i).innerHTML = getValue(chineseNames[tmp]);
					}	
				});
				$(".pagepage").hide();
				printPage();
			}
			
			function getValue(xml){
				return xml.firstChild.nodeValue;
			}
			</script>
		</div>

	</div>
<!--整个页面结束 -->
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

