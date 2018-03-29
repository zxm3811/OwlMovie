<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>登录</title>
<link rel="stylesheet" href="css/login.css">
<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	
	<%-- ajax请求开始 --%>
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.js"></script>
	<script src="js/cookie.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#loginBtn").click(function(){
			var userid = document.getElementById('userid').value;
			var password = document.getElementById('password').value;
	
			$.ajax({
				url:'LoginServlet',
				async:true,
				data:{
					userid: userid,
					password: password
				},
				type:'POST',
				cache:false,
				dataType:'xml',
				success:function(data){
					var res = data.getElementsByTagName("result")[0].firstChild.nodeValue;
					if(res == 0)
						document.getElementById('loginInfo').innerHTML = "用户名或密码错误，请重新输入";
					else{
						var name = data.getElementsByTagName("name")[0].firstChild.nodeValue;
						document.getElementById('loginInfo').innerHTML = "登录成功";
						//Cookies.set('name', name);
						//Cookies.set('userid', userid);
						//alert("cookie设置成功");
						window.location.href = "index.jsp";
					}
				},
				error:function(){
					alert("服务器出错，请稍候重试。");
				}
			});	
		});
	});
		
	</script>
	<%-- ajax请求结束 --%>
	
</head>
<body>
<!-- begin -->
<div id="login">
    <div class="wrapper">
        <div class="login">
            <form method="post" class="container offset1 loginform">
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <input type="hidden" name="_csrf" value="9IAtUxV2CatyxHiK2LxzOsT6wtBE6h8BpzOmk=">
                    <div class="control-group">
                        <div class="controls">
                            <label  class="icon-user"></label>
                            <input id="userid" type="text" name="userid" placeholder="id" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label  class="icon-key"></label>
                            <input id="password" type="password" name="password" placeholder="请输入密码" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
                    <span style="color: #7ac143;" id="loginInfo"></span>
                </div>
                <div class="form-actions"><a href="signup.jsp" tabindex="5" class="btn pull-left btn-link text-muted">现在创建一个帐号？</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="forgetpassword.jsp" tabindex="5" class="btn pull-left btn-link text-muted">忘记密码</a>
                    <button type="submit" tabindex="4" class="btn btn-primary" id="loginBtn" onclick="return false;">登录</button>
                </div>
            </form>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script>
    $(function() {

        $('#login #password').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
    </script>
</div>
<!-- end -->
</body>
</html>