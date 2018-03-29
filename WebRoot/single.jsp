<%@ page import="com.mt.dao.impl.MovieDaoImpl"%>
<%@ page import="com.mt.dao.impl.UserDaoImpl"%>
<%@ page import="com.mt.dao.impl.FilmReviewDaoImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.mt.vo.*" %>
<%@ page import="com.mt.dao.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>影评</title>
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

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

	<div id="fh5co-page">
	<%@ include file="aside.jsp" %>
		<div id="fh5co-main">


<%

int reviewid = Integer.parseInt(request.getParameter("id"));
FilmReview filmReview = null;
FilmReviewDaoImpl film = new FilmReviewDaoImpl();
filmReview = film.findById(reviewid);
int userid = filmReview.getUid();
int movieid = filmReview.getMid();
UserDaoImpl udi2 = new UserDaoImpl();
MovieDaoImpl mdi = new MovieDaoImpl();
User user = udi2.findUserById(userid);
Movie movie = mdi.findMovieById(movieid);

%>			

			<div class="fh5co-narrow-content animate-box fh5co-border-bottom" data-animate-effect="fadeInLeft">
				<h2 class="fh5co-heading" ><%= filmReview.getTitle() %></span></h2>
				<span><a href="center.jsp?id=<%= user.getId() %>"><%= user.getName() %></a></span>&nbsp;&nbsp;&nbsp;&nbsp;<span><%= filmReview.getDate() %></span>
		
				<br><br>
				
				<div class="row">
					<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
						<p class="fh5co-lead"><%= filmReview.getContent() %></p>
						<!-- <p><a href="#" class="btn btn-primary">Learn More</a></p> -->
					</div>
					
				</div>

					
				</div>

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

	</body>
</html>

