<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>短讯</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="OwlMovie" />
<meta name="keywords"
	content="OwlMovie" />
<link rel="shortcut icon" href="favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>

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
<!--Appshow-->
<script type="text/javascript" src="path/to/js/jquery.min.js"></script>
<script type="text/javascript" src="path/to/js/xSlider.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="./css/app.css">
<link href="css/series.css" rel="stylesheet" type="text/css">
<!--lunbo-->
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
<link rel="stylesheet" href="css/jquery-yys-slider.css">
<link href="css/tags.css" rel="stylesheet" type="text/css">
<!---->
<script src="js/modernizr.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/info.css" />
		<script type="text/javascript" src="js/jquery.js"></script>
	
<script type="text/javascript">

$(function(){
	$(".fh5co-active").removeClass('fh5co-active');
	$('#informationpage').addClass("fh5co-active");
});

</script>
</head>
<body>
	<div id="fh5co-page">
	<%@ include file="aside.jsp" %>
		 <div id="fh5co-main" >
<%@ include file="searchbar.jsp" %>
			<!--手风琴开始-->
			<div class="htmleaf-container">
				<div class="container">
					<div class="accordion">
						<dl>
							<dt>
								<a href="#accordion1" aria-expanded="false"
									aria-controls="accordion1"
									class="accordion-title accordionTitle js-accordionTrigger">陈意涵张钧甯《闺蜜2》改档十一</a>
							</dt>
							<dd class="accordion-content accordionItem is-collapsed"
								id="accordion1" aria-hidden="true">
								<p>由陈意涵、张钧甯主演的《闺蜜2》宣布杀进国庆档，同时发布一组“并肩版”海报。今年国庆档将有九部国产片扎堆上映，包括冯小刚导演的《芳华》、成龙主演的《英伦对决》等，竞争十分激烈。</p>
								<div class="accordion info">
									<p>2017-07-24 09:58:06</p>
									<a href="#">来源：猫头鹰电影网</a>
								</div>
							</dd>
							<dt>
								<a href="#accordion1" aria-expanded="false"
									aria-controls="accordion1"
									class="accordion-title accordionTitle js-accordionTrigger">《绣春刀2》票房破亿顺利超前作</a>
							</dt>
							<dd class="accordion-content accordionItem is-collapsed"
								id="accordion1" aria-hidden="true">
								<p>《绣春刀·修罗战场》票房破亿顺利超越前作票房，7月22日单日票房、观影人次超越首日实现逆增长。今日该片曝光一组新剧照，杨幂、张震互动的经典台词引网友热评。</p>
								<div class="accordion info">
									<p>2017-07-23 20:53:18</p>
									<a href="#">来源：猫头鹰电影网</a>
								</div>
							</dd>
							<dt>
								<a href="#accordion1" aria-expanded="false"
									aria-controls="accordion1"
									class="accordion-title accordionTitle js-accordionTrigger">"变形金刚5"累计15.5亿收官不如"变4"</a>
							</dt>
							<dd class="accordion-content accordionItem is-collapsed"
								id="accordion1" aria-hidden="true">
								<p>备受期待的暑期档遇冷，多部国产片的票房成绩并未达到预期。周六7月22日全国单日分账票房报收1.49亿，创下三个半月以来最差周六表现，《变形金刚5》累计15.5亿收官，远不如"变4"的19.8亿票房。</p>
								<div class="accordion info">
									<p>2017-07-23 09:59:57</p>
									<a href="#">来源：猫头鹰电影网</a>
								</div>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				(function() {
					var d = document, accordionToggles = d
							.querySelectorAll('.js-accordionTrigger'), setAria, setAccordionAria, switchAccordion, touchSupported = ('ontouchstart' in window), pointerSupported = ('pointerdown' in window);

					skipClickDelay = function(e) {
						e.preventDefault();
						e.target.click();
					}

					setAriaAttr = function(el, ariaType, newProperty) {
						el.setAttribute(ariaType, newProperty);
					};
					setAccordionAria = function(el1, el2, expanded) {
						switch (expanded) {
						case "true":
							setAriaAttr(el1, 'aria-expanded', 'true');
							setAriaAttr(el2, 'aria-hidden', 'false');
							break;
						case "false":
							setAriaAttr(el1, 'aria-expanded', 'false');
							setAriaAttr(el2, 'aria-hidden', 'true');
							break;
						default:
							break;
						}
					};
					//function
					switchAccordion = function(e) {
						console.log("triggered");
						e.preventDefault();
						var thisAnswer = e.target.parentNode.nextElementSibling;
						var thisQuestion = e.target;
						if (thisAnswer.classList.contains('is-collapsed')) {
							setAccordionAria(thisQuestion, thisAnswer, 'true');
						} else {
							setAccordionAria(thisQuestion, thisAnswer, 'false');
						}
						thisQuestion.classList.toggle('is-collapsed');
						thisQuestion.classList.toggle('is-expanded');
						thisAnswer.classList.toggle('is-collapsed');
						thisAnswer.classList.toggle('is-expanded');

						thisAnswer.classList.toggle('animateIn');
					};
					for (var i = 0, len = accordionToggles.length; i < len; i++) {
						if (touchSupported) {
							accordionToggles[i].addEventListener('touchstart',
									skipClickDelay, false);
						}
						if (pointerSupported) {
							accordionToggles[i].addEventListener('pointerdown',
									skipClickDelay, false);
						}
						accordionToggles[i].addEventListener('click',
								switchAccordion, false);
					}
				})();
			</script>
			<!--手风琴结束-->
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
