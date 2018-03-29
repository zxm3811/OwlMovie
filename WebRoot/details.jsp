<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*,com.mt.dao.impl.*" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<!doctype html>

<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>电影详情页</title>
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
<link rel="stylesheet" href="css/wangliping.css">
<!--星星-->
<link rel="stylesheet" href="css/xingxing.css">
 <!--悬浮窗-->
    <link rel='stylesheet prefetch' href='http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css'>
	<link rel='stylesheet prefetch' href='css/animate.min.css'>
	<link rel="stylesheet" type="text/css" href="css/menu.css">

<!-- Modernizr JS -->
<script src="js/modernizr-2.6.2.min.js"></script>
	<!--悬浮窗-->
    <link rel='stylesheet prefetch' href='http://cdn.bootcss.com/font-awesome/4.6.0/css/font-awesome.min.css'>
	<link rel='stylesheet prefetch' href='css/animate.min.css'>
	<link rel="stylesheet" type="text/css" href="css/menu.css">
<!--弹出窗口-->
<link rel="stylesheet" type="text/css" href="css/component.css" />
<script src="js/modernizr.custom.js"></script>
<!--videojs-->
<link href="css/video-js.css" rel="stylesheet" type="text/css">
<script src="js/video.js"></script>
	
<script src="js/cookie.js"></script>
<script type="text/javascript" src="js/wangEditor.min.js"></script>
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
// flag 1:收藏 2:写短评 3:写影评 4:创建专题 5:将电影添加到影单
	$(document).ready(function(){
		var id = getQueryString("id");
		var userid = $('#star').attr('class');
		$('#star').click(function(){ // 收藏电影
			userid = checkLogin();
			$.ajax({
				url:'DetailsServlet',
				method:'post',
				async:true,
				data:{
					movieid:id,
					flag:"1",
					userid:userid
				},
				cache:false,
				dataType:'xml',
				success:function(data){
					alert("操作成功");
					if($('#star').text() == "收藏"){
						$('#star').text("取消收藏");
					}
					else{
						$('#star').text("收藏");
					}
				},
				error:function(){
					alert("服务器出错，请稍后重试");
				}
			});
		});
		
		$('#submitDuanping').click(function(){
			var userid = checkLogin();
			var content = $('#duanping').val();
			var mid = $('.movieid').attr('id');
			var moviename = $('#moviename').text();
			$.ajax({
				url:'DetailsServlet',
				method:'post',
				async:true,
				data:{
					flag:"2",
					userid:userid,
					content:content,
					movieid:mid,
					moviename:moviename
				},
				cache:false,
				dataType:'xml',
				success:function(data){
					alert("发表成功");
					var str = "<div class=\"cblock\"><div class=\"chead\"><img src=\"images/head.jpg\"  width=\"50\" height=\"50\"><div><h2 class=\"word1\"><a href=\"center.jsp?id="+userid+"\">"+$('#touxiang').attr('title')+"</a></h2></div></div><div class=\"ccontent\"><p class=\"word\">"+content+"</p><div class=\"ccontentbottom\"><div class=\"cicon \"><span class=\"word1\"><a href=\"#\" title=\"赞\"><i class=\"icon-thumbs-up\"></i></a><span>0</span>&nbsp;&nbsp;&nbsp;</span></div></div></div></div>";
					$('.md-content').hide();
					$('#duanpingqu').append(str);
					alert("插入成功");
				},
				error:function(){
					alert("服务器出错，请稍后重试");
				}
			});
		});
		
		$('#submitYingping').click(function(){
			var E = window.wangEditor;
			var editor = new E("#editor");
			editor.create();
			var content = editor.txt.text();
			
			var title = "影评";
			var userid = checkLogin();
			var mid = $('.movieid').attr('id');
			var moviename = $('#moviename').val();
			$.ajax({
				url:'DetailsServlet',
				method:'post',
				async:true,
				data:{
					flag:"3",
					userid:userid,
					title:title,
					content:content,
					movieid:mid,
					moviename:moviename
				},
				cache:false,
				dataType:'xml',
				success:function(data){
					var str = "<div class=\"cblock\"><div class=\"chead\"><img src=\"images/head.jpg\"  width=\"50\" height=\"50\"><div><h2 class=\"word1\"><a href=\"center.jsp?id="+userid+"\">"+$('#touxiang').attr('title')+"</a></h2> </div></div><p><a>"+title+"</a></p><div class=\"ccontent\"><p class=\"word\">"+content+"</p><div class=\"ccontentbottom\"><div class=\"cicon \"><span class=\"word1\"><a href=\"#\" title=\"赞\"><i class=\"icon-thumbs-up\"></i></a><span>0</span>&nbsp;&nbsp;&nbsp;</span></div></div></div></div>";
					alert("发表成功");
					$('.md-content').fadeOut();
					$('#yingpingqu').append(str);
				},
				error:function(){
					alert("服务器出错，请稍后重试");
				}
			});
		});
		
		$('#submitYingdanXinjian').click(function(){
			var userid = checkLogin();
			var name = document.getElementById("submitYingdan").value;
			alert(name);
			var description = $('.yingdanjianjie').val();
			alert(description);
			$.ajax({
				url:'DetailsServlet',
				method:'post',
				async:true,
				data:{
					flag:"4",
					userid:userid,
					name:name,
					description:description
				},
				cache:false,
				dataType:'xml',
				success:function(data){
					alert("创建成功");
				},
				error:function(){
					alert("服务器出错，请稍后重试");
				}
			});
		});
		
		$('#jiadianying').click(function(){
			var userid = checkLogin();
			var movielistid = $(this).attr("class");
			var movieid = $('.movieid').attr('id');
			$.ajax({
				url:'DetailsServlet',
				method:'post',
				async:true,
				data:{
					flag:"5",
					movieid:movieid,
					movielistid:movielistid
				},
				cache:false,
				dataType:'xml',
				success:function(data){
					alert("添加成功");
				},
				error:function(){
					alert("服务器出错，请稍后重试");
				}
			});
		});
		
		$('.star a').click(function(){
			var score = $(this).text();
			$('#scoredisplay').text(score*2);
			$('.ystar').attr("style", "width:"+score*20+"%;");
			var movieid = $('.movieid').attr('id');
			var userid = checkLogin();
			$.ajax({
				type:'post',
				async:true,
				url:'DetailsServlet',
				data:{
					movieid:movieid,
					score:score,
					userid:userid,
					flag:'7'
				},
				cache:false,
				dataType:'xml',
				success:function(){
					alert('评价成功');
				},
				error:function(){
					alert('评价失败');
				}
			});
		});
	});
	
	function getQueryString(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) return unescape(r[2]); return null; 
	}
	
	function checkLogin(){
		userid =  $('#star').attr('class');
		
		if(!userid){
			alert("请先登录");
			window.location.href = "login.jsp";
		}
		return userid;
	}
</script>
 
</head>

<body>
<%

Cookie[] cookiess = request.getCookies();
String username = null;
int userid = 0;
if(cookiess != null)
	for(int i = 0; i < cookiess.length; i++){
		String cname = cookiess[i].getName();
		String cvalue = URLDecoder.decode(cookiess[i].getValue());
		if(cname.equals("username")){
			username = cvalue;
		}
		else if(cname.equals("id")){
			userid = Integer.parseInt(cvalue);
		}
	}

%>
<%
List<MovieList> movieLists = new ArrayList<MovieList>();
MovieListDaoImpl mo = new MovieListDaoImpl();
movieLists = mo.findMovieListByUserId(userid); 
int num = movieLists.size();
%>

<!--短评弹出开始-->
<div class="md-modal md-effect-1" id="modal-1">
  <div class="md-content" style="height:400px;">
    <button class="md-close">×</button>
    <div class="e_center">
	 <textarea rows="10" cols="50" style="margin: 10px;" id="duanping">
	  
     </textarea>
	 <button class="e_center" type="submit" id="submitDuanping" formtarget="_new">提交</button>
    </div>
	
  </div>
  
</div>
<!--短评弹出结束-->
<!--长影评弹出开始-->
<div class="md-modal md-effect-1" id="modal-2">
  <div class="md-content">
    <button class="md-close">×</button>
    <div>
<div id="editor" style="margin-top:30px; margin-bottom:8px;">
</div>

<button class="e_center" type="submit" name="submit" formtarget="_new" id="submitYingping">提交</button>

</div>
  </div>
</div>
<!--长影评弹出结束-->
<!--播放器弹出开始-->
<div class="md-modal md-effect-1"  id="modal-3">
  <div class="md-content" style="width:700px;">
    <button class="md-close">×</button>
    <div class="e_center">
	<video id="example_video_1" class="e_center video-js vjs-default-skin" 
	  controls preload="none" width="600" height="450"
      poster="images/slider-1.jpg"
      data-setup="{}">
    <source src="video/hangge.mp4" type='video/mp4' />
<track kind="captions" src="hangge.vtt" srclang="en" label="English" />
  </video>

    
    </div>
  </div>
</div>
<!--播放器弹出结束-->
<!--加入影单弹出开始-->
<div class="md-modal md-effect-1" id="modal-4">
  <div class="md-content" style="height:600px;width:800px;">
    <button class="md-close">×</button>
    <div>
	<button class="md-trigger" data-modal="modal-5">创建新影单</button>
    <br><br>
	<%
	for(int i = 0; i < num; i++){
		out.print("<div class=\"lists\"><img src=\"images/slider-5.jpg\"><div class=\"info\" style=\"color:#7ac143;\"><a id=\"jiadianying\" class=\""+ userid +"\">"+ movieLists.get(i).getName() +"\"</a></div><div class=\"info\">"+ movieLists.get(i).getDescription() +"</div></div>");
	} 
	%>
    </div>
  </div>
</div>
<!--加入影单弹出结束-->
<!--创建影单的弹出框开始-->
<div class="md-modal md-effect-1" id="modal-5">
  <div class="md-content" style="height:500px;width:600px;">
    <button class="md-close">×</button>
	<div class="lists_noneborder">
                              
    <div><form class="form-horizontal">
    <fieldset>
    
    <div class="control-group">

          <!-- Text input-->
          <label class="control-label" for="input01">影单名：</label>
          <div class="controls">
            <input type="text"  class="input-xlarge" id="submitYingdan">
          </div>
        </div>

    <div class="control-group">

          <!-- Textarea -->
          <label class="control-label">影单简介</label>
          <div class="controls">
            <div class="textarea">
                  <textarea rows="5" cols="30" type="" class="yingdanjianjie"> </textarea>
            </div>
          </div>
        </div>

    </fieldset>
  </form>

	 <button class="e_center" type="submit" name="submit" formtarget="_new" style="margin-left:22%" id="submitYingdanXinjian">新建</button>
    </div>
	
</div>	

  </div>
  
</div>
<!--创建影单的弹出框结束-->
<!--悬浮弹出菜单开始-->
<div class="container">
		
		<div id='ss_menu'>
		  <!--短评按钮-->
		  <div>
         <div class="main clearfix">
          <div class="column">
          <button class="md-trigger" data-modal="modal-1"> <i class="fa fa-pencil"><span style="font-size:12px;">短评</span></i></button>
          </div>
		</div> 
		 </div>
		 <!--长影评按钮-->
		 <div>
		    <div class="main clearfix">
          <div class="column">
          <button class="md-trigger" data-modal="modal-2"> <i class="fa fa-book"><span style="font-size:12px;">影评</span></i></button>
          </div>
		</div> 
		  </div>
		 
<!--预告片按钮-->
		<div>
		    <div class="main clearfix">
          <div class="column">
          <button class="md-trigger" data-modal="modal-3"> <i class="fa fa-camera"><span style="font-size:12px;">预告</span></i></button>
          </div>
		</div> 
		  </div>
		 <!--加入影单按钮-->
		  <div>
		    <button class="md-trigger" data-modal="modal-4"> <i class="fa fa-list"><span style="font-size:12px;">影单</span></i></button>
		  </div>
		  
		  <div class='menu'>
		    <div class='share' id='ss_toggle' data-rot='180' style="font-size:20px;margin-top:-15px;">
		      菜单
		    </div>
		  </div>
		</div>
		
	</div>
	
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<script>
	$(document).ready(function (ev) {
	    var toggle = $('#ss_toggle');
	    var menu = $('#ss_menu');
	    var rot;
	    $('#ss_toggle').on('click', function (ev) {
	        rot = parseInt($(this).data('rot')) - 180;
	        menu.css('transform', 'rotate(' + rot + 'deg)');
	        menu.css('webkitTransform', 'rotate(' + rot + 'deg)');
	        if (rot / 180 % 2 == 0) {
	            toggle.parent().addClass('ss_active');
	            toggle.addClass('close');
	        } else {
	            toggle.parent().removeClass('ss_active');
	            toggle.removeClass('close');
	        }
	        $(this).data('rot', rot);
	    });
	    menu.on('transitionend webkitTransitionEnd oTransitionEnd', function () {
	        if (rot / 180 % 2 == 0) {
	            $('#ss_menu div i').addClass('ss_animate');
	        } else {
	            $('#ss_menu div i').removeClass('ss_animate');
	        }
	    });
	});
	</script>
<!--悬浮弹出菜单结束-->
<!--page开始-->


  <!--侧边栏结束-->
  <!--主页面开始-->
  <div id="fh5co-main" >
  <%@ include file="aside.jsp" %>
<%@ include file="searchbar.jsp" %>

<%

Movie movie = new Movie();
MovieDaoImpl mov = new MovieDaoImpl();

String userids = request.getParameter("id");
movie = mov.findMovieById(Integer.parseInt(userids));



%>

    <!--第一行开始-->
    <div class="fh5co-narrow-content" >
    
      <div class="row movieid" id="<%= movie.getId() %>">
      <!--图片开始-->
        <div class="col-md-12" >
        <h2 class="  animate-box" data-animate-effect="fadeInLeft" id="moviename"><%= movie.getChineseName() %></h2>
        </div>
        <div class="col-md-4 col-xs-4 animate-box poster" data-animate-effect="fadeInLeft">
        <img src="<%= movie.getCover() %>" alt="<%= movie.getChineseName() %>" class="img-responsive">
        
        </a>
        </div>
        <!--图片结束-->
        <!--介绍开始-->
        <div class="col-md-4 col-xs-4 animate-box" style="position:relative;left:-80px;line-height:1em;" data-animate-effect="fadeInLeft" > 
          <!--<p class="fh5co-lead animate-box" data-animate-effect="fadeInLeft"></p>
          <p class="animate-box" data-animate-effect="fadeInLeft"></p>--> 
          <span class="word1"> <span>导演</span> ： <span> <%= movie.getDirector() %></span> </span><br>
          <span class="word1"> <span>编剧</span> ：<span> <a href="#">肯·道里欧</a> </span> </span><br>
          <span class="word1"><span>主演</span>：<span><%= movie.getActor() %> </a>/</span></span><br>
          <span class="word1"><span>类型</span>：<span><%= movie.getTag() %></span></span><br>
          <span class="word1"><span>制片国家/地区</span>：<span><%= movie.getArea() %></span></span><br>
          <span class="word1"><span>语言</span>：<span><%= movie.getLanguage() %></span></span><br>
          <span class="word1"><span>上映日期</span>：<span>2017-07-07(中国大陆)</span> /<span> 2017-06-14(安锡动画电影节)</span> /<span> 2017-06-30(美国)</span></span><br>
          <span class="word1"><span>片长</span>：<span><%= movie.getLength() %></span></span><br>
          <span class="word1"><span>又名</span>：<span><%= movie.getOriginalName() %></span></span><br>
    </div>
    <!--介绍结束-->
    
    <!--评分开始-->
        <div class="col-md-4 col-xs-4 animate-box" style="position:relative;left:-80px;" data-animate-effect="fadeInLeft"  style="border-left:1px  solid #CCC;"> <span>评分</span> 
        
        <div>
        <strong class="fh5co-heading"><%= movie.getGrade() %></strong>
        
        </div>
        
        </div>
     <!--评分结束-->   
      </div>
     
    </div>
    <!--第一行结束-->
    <!--第二行开始-->
    <div class="fh5co-narrow-content animate-box  fh5co-border-bottom" data-animate-effect="fadeInLeft" >
    <div style="overflow:hidden;">
  
    <div style="float:left;"> 
    <span class="word">我的评价：</span>
    </div>
     <div id="scoremark" class="scoremark scores">
      <em class="score" id="scoredisplay"><%= movie.getGrade() %></em>
      <span class="star">
       <span class="ystar" style="width:<%= movie.getGrade()*10 %>%"></span>
       <ul>
        <li><a href="javascript:void(0)" data-name="很差" class="one-star">1</a></li>
        <li><a href="javascript:void(0)" data-name="较差" class="two-stars">2</a></li>
        <li><a href="javascript:void(0)" data-name="一般" class="three-stars">3</a></li>
        <li><a href="javascript:void(0)" data-name="较好" class="four-stars">4</a></li>
        <li><a href="javascript:void(0)" data-name="很好" class="five-stars">5</a></li>
       </ul>
      </span>
      <div style="left: 0px; display: none;" class="tips"></div>
   </div>
        <div class="widget">
          <span class="word1">
          <a href="#">
          <i class="icon-heart"></i>
          <span id="star" class="<%= id %>"><%= (new UserDaoImpl()).doHasLike(movie.getId(), id)? "取消收藏":"收藏" %></span>
          </a>
          </span>

     </div>
    </div>
    
  </div>
  <!--第二行结束-->
  <!--第三行开始-->
    <div class="fh5co-narrow-content animate-box  fh5co-border-bottom" data-animate-effect="fadeInLeft">
      
      <h2>剧情简介</h2>
      
      <div> <p class="word"><%= movie.getDescription() %></p> </div>
     
    </div>
    <!--第三行结束-->
    <!--第四行开始-->
			<div class="fh5co-narrow-content  animate-box fh5co-border-bottom"
				data-animate-effect="fadeInLeft">
				<h2>喜欢这部电影的人也喜欢</h2>
				<div class="row">
					<div class="fh5co-gallery">
					
					<%
					
					MovieDaoImpl mdi = new MovieDaoImpl();
					List<Movie> list = new ArrayList<Movie>();
					String typelist = movie.getTag();
					String [] type = typelist.split("/");
					String area = movie.getArea();
					list = mdi.findMovieByTypeAndArea(type[0], area);
					for(int m = 0; m < (list.size()>6?6:list.size()); m++) {
						Movie movie1 = new Movie();
						movie1 = list.get(m);
						if(movie1.getId() != movie.getId()) {
					
					%>

						<div class="block">
							<a class="gallery-item" href="details.jsp?&id=<%= movie1.getId() %>"> <img src="<%= movie1.getCover() %>" alt="<%= movie1.getChineseName() %>">
							<span class="overlay">
								<h2><%= movie1.getGrade() %></h2> <span><%= movie1.getActor() %></span>
							</span>
							</a>
							<div class="information">
								<a href="details.jsp?&id=<%= movie1.getId() %>"><%= movie1.getChineseName() %></a>
							</div>
						</div>

					<%
						}
					}
					%>


					</div>
				</div>
			</div>
			<!--第四行结束-->
    
    <!--第五行开始-->
    <div class="fh5co-narrow-content  animate-box fh5co-border-bottom" data-animate-effect="fadeInLeft">
      <!--短评开始-->
      <div  class="comment">
        <!--短评区开始-->
        <%
        
        List<Comment> comments = new ArrayList<Comment>();
        List<FilmReview> filmReviews = new ArrayList<FilmReview>();
        CommentDaoImpl co = new CommentDaoImpl();
        FilmReviewDaoImpl fi = new FilmReviewDaoImpl();
        comments = co.findByMid(movie.getId());
        filmReviews = fi.findByMid(movie.getId());
        UserDaoImpl use = new UserDaoImpl();
        int nums = comments.size();
        int numss = filmReviews.size();
        %>
        <div class="ctitle">
          <h2>短评区</h2>
        </div>
        <!--短评区结束-->
        <!--短评展示开始-->
        <div class="cdisplay" id="duanpingqu">
        <%
        for(int i = 0; i < nums; i++){
       	%>
          <div class="cblock">
          <div class="chead"><img src="images/head.jpg"  width="50" height="50">
          <div>
            <h2 class="word1"><a href="center.jsp?id=<%= comments.get(i).getUid() %>"><%= use.findUserById(comments.get(i).getUid()).getName() %></a></h2> 
          </div>
          </div>
          
          
          <div class="ccontent">
            <p class="word"><%= comments.get(i).getContent() %></p>
            <div class="ccontentbottom">
              <div class="cicon ">
               <span class="word1">
                 <a href="#" title="赞">
                   <i class="icon-thumbs-up"></i>
                 </a><span><%= comments.get(i).getStarNumber() %></span>&nbsp;&nbsp;&nbsp;
               </span>
              </div>
            </div>
          </div>
          </div>
          <% } %>
          <div style="height:50px;">
            
          </div>
        </div>
        <!--短评展示结束-->
      </div>
      <!--短评结束-->
    </div>
<!--第五行结束-->

        <div class="fh5co-narrow-content  animate-box fh5co-border-bottom" data-animate-effect="fadeInLeft">
      
      <!--影评开始-->
      <div  class="comment">
        <!--影评区开始-->
        <div class="ctitle">
          <h2>影评区</h2>
        </div>
        <!--影评区结束-->
        <!--影评展示开始-->
        <div class="cdisplay" id="yingpingqu">
          <!--第一个人开始-->
          <% if(numss!=0) for(int i = 0; i < numss; i++){ %>
          <div class="cblock">
          <div class="chead"><img src="images/head.jpg"  width="50" height="50">
          <div>
            <h2 class="word1"><a href="center.jsp?id=<%= filmReviews.get(i).getId() %>"><%= use.findUserById(filmReviews.get(i).getUid()).getName() %></a></h2> 
          </div>
          </div>
          
          <p><a href="filmreviewdetails.jsp?id=<%= filmReviews.get(i).getId() %>"><%= filmReviews.get(i).getTitle() %></a></p>
          <div class="ccontent">
            <p class="word"><%= filmReviews.get(i).getContent() %></p>
            <div class="ccontentbottom">
              <div class="cicon ">
               <span class="word1">
                 <a href="#" title="赞">
                   <i class="icon-thumbs-up"></i>
                 </a><span><%= filmReviews.get(i).getStarNumber() %></span>&nbsp;&nbsp;&nbsp;
               </span>
              </div>
            </div>
          </div>
          </div>
          <% } %>
          <div style="height:50px;">
            
          </div>
        </div>
        <!--影评展示结束-->
      </div>
      <!--影评结束-->
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

<script>
//星星评分
starScore($(".scoremark"));
function starScore(star){
 star.find(".star ul li a").mouseenter(function(){
  var txt = $(this).attr("data-name");
  var x = $(this).parent("li").index();
  star.find(".tips").html(txt).css("left",-6+x*24).show();
 });
 star.find(".star ul li a").mouseleave(function(){
  star.find(".tips").html("").css("left",0).hide();
 }); 
}
</script>
<!--弹出窗-->
<script src="js/classie.js"></script> 
<script src="js/modalEffects.js"></script> 

<!-- for the blur effect --> 


<script>
			var polyfilter_scriptpath = '/js/';

		</script> 
<script src="js/cssParser.js"></script> 
<script src="js/css-filters-polyfill.js"></script> 
<!--文本框-->
    <script type="text/javascript" src="js/wangEditor.js"></script>
    <script type="text/javascript">
        var E = window.wangEditor
        var editor = new E('#editor')
        editor.create()
    </script>

</body>
</html>
