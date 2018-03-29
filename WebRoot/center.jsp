<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.mt.dao.impl.*,com.mt.vo.*"%>
<%@page import="java.lang.reflect.Array"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人中心</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content=""/>
<meta property="og:image" content=""/>
<meta property="og:url" content=""/>
<meta property="og:site_name" content=""/>
<meta property="og:description" content=""/>
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">
<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

<!-- 表单框 -->
<link href="css/login.css"/>

<!-- Animate.css -->
<link rel="stylesheet" href="css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Owl Carousel -->
<!-- <link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
<!-- Theme style  -->
<link rel="stylesheet" href="css/style.css">  

<!-- Modernizr JS -->
<!-- <script src="js/modernizr-2.6.2.min.js"></script> -->
<!--Appshow-->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<!--标签-->
 <link href="css/tags.css" rel="stylesheet" type="text/css"> 
<!---->
<script src="js/modernizr.js" type="text/javascript"></script>
<!--3d折纸-->
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
 <link rel="stylesheet" href="css/main.css"> 
 <link rel="stylesheet" href="css/demo_styles.css"> 
<link rel="stylesheet" href="css/demo4.css">
<link rel="stylesheet" type="text/css" href="css/default.css">
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<!--个人中心tab-->
 <link rel="stylesheet" href="css/center_tabs.css"> 

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#submitChangePassword').click(function(){
		var id = $('#formChangePassword').attr('userid');
		var passwordOriginal = $('#password_original').attr('value');
		var passwordConfirm = $('#password_confirm').attr('value');
		var password = $('#password').attr('value');
		if(password != passwordConfirm){
			alert("两次输入的密码不一致，请重新输入");
		}
		else{
			$.ajax({
				type:'post',
				async:true,
				url:'ChangePasswordServlet',
				data:{
					password:password,
					passwordOriginal:passwordOriginal
				},
				dataType:'xml',
				success:function(data){
					if(data.getElementsByTagName('result')[0].firstChild.nodeValue == 1){
						alert("修改成功");
					}
					else{
						alert("原密码不正确，请重新输入");
					}
				},
				error:function(){
					alert("服务器出错了");
				}
			});
		}
	});
});
</script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$(".fh5co-active").removeClass('fh5co-active');
	$('#centerpage').addClass("fh5co-active");
});

</script>
</head>
<body>
<div id="fh5co-page">
<%@ include file="/aside.jsp" %>


<!--右栏边页开始-->
<div id="fh5co-main"> 
<%@ include file="searchbar.jsp" %>
  <%
  int userid = Integer.parseInt(request.getParameter("id"));
  
  UserDaoImpl use = new UserDaoImpl();
  User user = new User();
  user = use.findUserById(userid);
  boolean benren = false;
  System.out.println(userid + " " + id);
  if(id!=0 && userid == id)
	  benren = true;
  %>
  <!--折纸开始-->
  <div class="prompt">个人信息<span class="icon-settings"></span>&nbsp;&nbsp;我的影单<span class="icon-note"></span>&nbsp;&nbsp;我喜欢的电影<span class="icon-heart"></span>&nbsp;&euro;我的长影评<span class="icon-pen"></span></div>
  <div class=" col-md-12 dm-demo1">
    <div class="htmleaf-container"> 
      
      <!-- Demo navigation -->
      <div class="nav_2">
        <nav class="nav clearfix">
        <button class="nav-el" id="el-topleft" data-id="ov-topleft"><span class="icon-settings"></span></button>
        <button class="nav-el" id="el-topright" data-id="ov-topright"><span class="icon-note"></span></button>
        <button class="nav-el" id="el-btmleft" data-id="ov-btmleft"><span class="icon-heart"></span></button>
        <button class="nav-el" id="el-btmright" data-id="ov-btmright"><span class="icon-pen"></span></button>
      </div>
      <!-- section1开始-->
      <section class="overlay2" id="ov-topleft"> 
        <!--1中wrap开始-->
        <div class="wrap">
          <div class="row">
            <div class="col-md-12">
              <div class="tab2" role="tabpanel">
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#个人信息" aria-controls="home" role="tab" data-toggle="tab">个人信息</a></li>
                  <% if(benren){ %>
                  <li role="presentation"><a href="#修改资料" aria-controls="profile" role="tab" data-toggle="tab">修改资料</a></li>
                  <li role="presentation"><a href="#修改密码" aria-controls="messages" role="tab" data-toggle="tab">修改密码</a></li>
                  <% } %>
                </ul>
                <div class="tab-content border2">
                  <div role="tabpanel" class="tab-pane fade in active" id="个人信息">
                    <div class="animate-box  m-proifo">
                      <dt class="f-pr"> <img src="images/big_1.jpg"> </dt>
                      <dd>
                        <div class="name f-cb"> <%= user.getName() %>&nbsp;&nbsp;&nbsp;id:<%= user.getId() %><span class="icon-user"></span> </div>
                        <ul class="data">
                          <li class="fst"> <a href="#" ><strong id="111"><%= use.findReviewNumberByUserId(userid) %></strong><br>
                            <sapn>
                            影评数</span></a> </li>
                          <li class="fst"> <a href="#" ><strong id="222"><%= use.findMovieListNumberByUserId(userid) %></strong><br>
                            <sapn>
                            影单数</span></a> </li>
                          <li class="fst"> <a href="#" ><strong id="333"><%= use.findLikeMovieNumberByUserId(userid) %></strong><br>
                            <sapn>
                            收藏的电影数</span></a> </li>
                        </ul>
                      </dd>
                      <div class="inf s-fc3 f-brk">个人介绍：<%= user.getDescription() %></div>
                      <div class="inf s-fc3"><span>生日： <%= user.getBirthday().toString() %> </span></div>
                      <div class="inf s-fc3"><span>所在地区：<%= user.getArea() %></span></div>
                    </div>
                  </div>
                  <!--tab1结束--> 
                  <!--tab2开始-->
                  <div role="tabpanel" class="tab-pane fade" id="修改资料">
                    <div class="animate-box  m-proifo">
                      <dt class="f-pr"> <img src="<%= (new File("images/touxiang/"+id+".jpg")).exists()?"images/touxiang/"+id+".jpg":"images/touxiang/head.jpg" %>"> 
					    <div class="control-group">
                              <label class="control-label">上传头像</label>
                              <!-- File Upload -->
                              <div class="controls">
                              <form action="UploadHandleServlet?id=<%= id %>" enctype="multipart/form-data" method="post">
                                <input class="input-file" id="fileInput" type="file" name="file1">
                                <input type="submit" value="提交" id="submitTouxiang"/>
                              </form>
                              </div>
                            </div>
							</dt>
                      <dd>
                        <form action="CenterServlet?id=<%= id %>" method="post">
                          <fieldset>
                            <div id="legend" class="">
                              <legend class="">个人信息</legend>
                            </div>
                          
                            <div class="control-group"> 
                              
                              <!-- Text input-->
                              <label class="control-label" for="input01">昵称</label>
                              <div class="controls">
                                <input type="text" placeholder="请在这里输入" class="input-xlarge" name="name" id="nicheng">
                              </div>
                            </div>
                            <div class="control-group"> 
                              
                              <!-- Textarea -->
                              <label class="control-label">个人介绍</label>
                              <div class="controls">
                                <div class="textarea">
                                  <textarea type="" class="" name="description" id="gerenjieshao"> </textarea>
                                </div>
                              </div>
                            </div>
                            <div class="control-group" style="margin-bottom: 8px;">
                              <label class="control-label">性别</label>
                              <div class="controls"> 
                                
                                <!-- Inline Radios -->
                                <label class="radio inline">
                                  <input type="radio" value="1" class checked="checked" name="group">
                                  男 </label>
                                <label class="radio inline">
                                  <input type="radio" value="2" name="group">
                                  女 </label>
                              </div>
                            </div>
							<div class="control-group"> 
							<label class="control-label" for="input01">生日</label>
							<input type="date"  name="birthday"/>
							</div>
							
							<div class="control-group"> 
                              <!-- Text input-->
                              <label class="control-label" for="input01">地区</label>
                              <div class="controls">
                                <input type="text" placeholder="请在这里输入" name="area" class="input-xlarge">
                              </div>
                            </div>
							
                            <div class="control-group"> 
                              
                              <!-- Button -->
                              <div class="controls">
                                <button class="btn btn-success">保存</button>
                              </div>
                            </div>
                          </fieldset>
                        </form>
                      </dd>
                    </div>
                  </div>
                  <!--tab2结束--> 
                  <!--tab3开始-->
                  <div role="tabpanel" class="tab-pane fade" id="修改密码">
                        <div class="animate-box  m-proifo">
                      
                      <dd>
                        <form class="form-horizontal" id="formChangePassword" userid="<%= id %>">
                          <fieldset>
                            <div id="legend" class="">
                              <legend class="">修改密码</legend>
                            </div>
							
                            <div class="control-group">
                              <!-- Text input-->
                              <label class="control-label" for="input01">原密码</label>
                              <div class="controls">
                                <input type="password" placeholder="请输入原密码" class="input-xlarge" name="password_original">
                              </div>
                            </div>
							 <div class="control-group"> 
                              
                              <!-- Text input-->
                              <label class="control-label" for="input01">新密码</label>
                              <div class="controls">
                                <input type="password" placeholder="请输入新密码" class="input-xlarge" name="password">
                              </div>
                            </div>
							 <div class="control-group"> 
                              
                              <!-- Text input-->
                              <label class="control-label" for="input01">请再次输入新密码</label>
                              <div class="controls">
                                <input type="password" placeholder="请再次输入新密码" class="input-xlarge" name="password_fonfirm">
                              </div>
                            </div>

                            <div class="control-group"> 
                              
                              <!-- Button -->
                              <div class="controls">
                                <input type="submit" class="btn btn-success" id="submitChangePassword" value="提交" onclick="return false;">
                              </div>
                            </div>
                          </fieldset>
                        </form>
                      </dd>
                    </div>
					
                  <!--tab3结束--> 
               
              </div>
            </div>
          </div>
		  </div>
        </div>
		</div>
        <!--1中wrap结束-->
        <button class="close"><span class="mfg-cancel"></span></button>
      </section>
      <!--section1结束--> 
      
      <!--section2开始-->
      <section class="overlay2" id="ov-topright"> 
        <!--2中wrap开始-->
        <div class="wrap"> 
          
          <!--tab开始-->
          <div class="row">
            <div class="col-md-12">
              <div class="tab2" role="tabpanel">
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#我创建的影单" aria-controls="home" role="tab" data-toggle="tab"><%= userid==id?"我":"他" %>创建的影单</a></li>
                  <li role="presentation"><a href="#我收藏的影单" aria-controls="profile" role="tab" data-toggle="tab"><%= userid==id?"我":"他" %>收藏的影单</a></li>
                </ul>
                <div class="tab-content border2"> 
                  <!--s2的tab1开始-->
                  <div role="tabpanel" class="tab-pane fade in active" id="我创建的影单">
                  
                  <div class="fh5co-gallery">
                  <%
                  
                List<MovieList> movieLists = new ArrayList<MovieList>();
               	MovieListDaoImpl ml = new MovieListDaoImpl();
               	movieLists = ml.findMovieListByUserId(id);
               	int num = movieLists.size();
               	for(int i = 0; i < num; i++){
                  
                  %>
                  	  <div class="block myCreate0"> <a class="gallery-item" href="single.html"> <img src="images/work_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"> <span class="overlay">
                        <span><%= movieLists.get(i).getDescription() %></span> </span> </a>
                        <div class="information "> <a id="name" href="movieList.jsp?id=<%= movieLists.get(i).getId() %>"><%= movieLists.get(i).getName() %></a> </div>
                      </div>
                      <% } %>
                  </div>
                  <!--s2的tab1结束--> 
                  <!--s2的tab2开始-->
                  <div role="tabpanel" class="tab-pane fade" id="我收藏的影单">
                    <div class="fh5co-gallery">
                  <%
                  movieLists = ml.findLikeMovieListByUserId(id);
                  System.out.print(movieLists.size());
                  num = movieLists.size();
                  for(int i = 0; i < num; i++){
                  %>
                      <div class="block "> <a class="gallery-item" href="single.html"> <img src="images/work_1.jpg" alt="Free HTML5 Bootstrap Template by FreeHTML5.co"> <span class="overlay">
                        <span><%= movieLists.get(i).getDescription() %></span> </span> </a>
                        <div class="information "> <a href="movielistdetails.jsp?id=<%= movieLists.get(i).getId() %>"><%= movieLists.get(i).getName() %></a> </div>
                      </div>
                  <% } %>
                    </div>
                  </div>
                  <!--s2的tab2结束--> 
                  
                </div>
              </div>
            </div>
            
            <!--tab结束--> 
          </div>
        </div>
        <!--2中wrap结束-->
        <button class="close"><span class="mfg-cancel"></span></button>
      </section>
      <!--section2结束--> 
      
      <!--section3开始-->
      <section class="overlay2" id="ov-btmleft">
        <!--3中wrap开始-->
        <div class="wrap"> 
          <!--3的tab开始-->
          <div class="row">
            <div class="col-md-12">
              <div class="tab2" role="tabpanel">
                <ul class="nav nav-tabs" role="tablist">
                  <li role="presentation" class="active"><a href="#我喜欢的电影" aria-controls="home" role="tab" data-toggle="tab">我喜欢的电影</a></li>
                </ul>
                <div class="tab-content border2"> 
                  <!--s3的tab1开始-->
                  <div role="tabpanel" class="tab-pane fade in active" id="我喜欢的电影">
                    <div class="fh5co-gallery">
                    <%
                    
                    List<Movie> movies = new ArrayList<Movie>();
                    movies = use.findLikeMovie(id);
                    int numMovie = movies.size();
                    for(int i = 0; i < numMovie; i++){
                    %>
                      <div class="block "> <a class="gallery-item" href="details.jsp?id=<%= movies.get(i).getId() %>"> <img src="<%= movies.get(i).getCover() %>" alt="坏鸟"> <span class="overlay">
                        <h2><%= movies.get(i).getGrade() %></h2>
                        <span><%= movies.get(i).getActor() %></span> </span> </a>
                        <div class="information "> <a href="details.jsp?id=<%= movies.get(i).getId() %>"><%= movies.get(i).getChineseName() %></a> </div>
                      </div>
                      <% } %>
                   
                    </div>
                  </div>
                  <!--s3的tab1结束--> 
                  
                </div>
              </div>
            </div>
            
            <!--3的tab结束--> 
          </div>
        </div>
        
        <!--3中wrap结束-->
        <button class="close"><span class="mfg-cancel"></span></button>
      </section>
      <!--section3结束--> 
      
      <!--section4开始-->
      <section class="overlay2" id="ov-btmright"> 
        <!--4中wrap开始-->
        <div class="wrap">
        <!--section4的tab开始--> 
        <!--section3的tab开始-->
        <div class="row">
          <div class="col-md-12">
            <div class="tab2" role="tabpanel">
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#我的长影评" aria-controls="home" role="tab" data-toggle="tab">我的长影评</a></li>
              </ul>
              <div class="tab-content border2">
                <div role="tabpanel" class="tab-pane fade in active" id="我的长影评">
                  <div class="col-md-12">
                  <%
                  List<FilmReview> frl = new ArrayList<FilmReview>();
                  FilmReviewDaoImpl filmDao = new FilmReviewDaoImpl();
                  frl = filmDao.findByUserId(id);
                  int numFrl = frl.size();
                  for(int i = 0; i < numFrl; i++){
                  %>
                    <div class="note"> <a href="filmreviewdetails.jsp?id=<%= frl.get(i).getId() %>"><%= frl.get(i).getTitle() %></a>
                      <div class="note_data"> <%= frl.get(i).getDate() %> &nbsp;&nbsp;&nbsp;&nbsp; <%= frl.get(i).getContent() %> &nbsp;&nbsp;&nbsp;&nbsp;<a href="DeleteFilmReview?id=<%= frl.get(i).getId() %>"></a></div>
                    </div>
                  <% } %>
                  </div>
                  <!--section3的tab1结束--> 
                </div>
              </div>
            </div>
          </div>
          <!--section3的tab结束--> 
          <!--section4的tab结束--> 
        </div>
		 </div>
        <!--4中wrap结束-->
        <button class="close"><span class="mfg-cancel"></span></button>
      </section>
      <!--section4结束--> 
   
  </div>
  <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script> 
  <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.2.min.js"><\/script>')</script> 
  <script src="js/plugins.js"></script> 
  <script src="js/demo.js"></script> 
  <!--折纸结束--> 
  
  <!-- <div class="fh5co-narrow-content">
				<div class="row">
					<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
						<h1 class="fh5co-heading-colored">Get in touch</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
						<p class="fh5co-lead">Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
						<p><a href="#" class="btn btn-primary btn-outline">Learn More</a></p>
					</div>
					
				</div>
			</div> --> 
  
  <!--右边页结束--> 
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
