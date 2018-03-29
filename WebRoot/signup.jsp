<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>注册</title>
<link rel="stylesheet" href="css/login.css">
	<link rel="stylesheet" href="css/icomoon.css">
	
		<%-- ajax请求开始 --%>
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var flag_name = false;
		var flag_id = false;
		var flag_email = false;
		var flag_password = false;
		var flag_password_confirm = false;
		var flag_area = false;
		$("#signupBtn").attr("disabled", true);
		$("#signupBtn").click(function(){
			var userid = document.getElementById('userid').value;
			var password = document.getElementById('password').value;
			var password_confirm = document.getElementById('password_confirm').value;
			var email = document.getElementById('email').value;
			var name = document.getElementById('name').value;
			var area = document.getElementById('area').value;
			$.ajax({
					url:'SignupServlet',
					async:true,
					data:{
						userid:userid,
						name:name,
						email:email,
						area:area,
						password:password
					},
					type:'POST',
					cache:false,
					success:function(data){
						var res = data.getElementsByTagName("result")[0].firstChild.nodeValue;
						if(res == 1){
							alert("注册成功，请查收您的验证邮件对帐号进行激活。");
							window.location.href = "hint.jsp";
						}
						else
							alert("注册失败，请联系管理员。");
					},
					error:function(){
						alert("服务器出错，请稍候重试。");
					}
				});
		});
		$('#userid').keyup(function(){
			var pattern = /^\d{4,11}$/;
			var userid = document.getElementById('userid').value;
			if(userid.match(pattern)){
				flag_id = true;
				$('#id-info').html("");
				if(flag_id && flag_name && flag_email && flag_password && flag_password_confirm && flag_area)
					$('#signupBtn').attr("disabled",false);
			}
			else{
				flag_id = false;
				$('#id-info').html("用户id必须是4-11位的数字组合");
				$('#signupBtn').attr("disabled",true);
			}
		});
		
		$('#password').keyup(function(){
			var pattern = /^[a-zA-Z0-9\._\-]{6,14}$/;
			var password = document.getElementById('password').value;
			if(password.match(pattern)){
				flag_password = true;
				$('#password-info').html("");
				if(flag_id && flag_name && flag_email && flag_password && flag_password_confirm && flag_area)
					$('#signupBtn').attr("disabled",false);
			}
			else{
				flag_password = false;
				$('#password-info').html("密码必须是6-14位的大小写字母、数字组合");
				$('#signupBtn').attr("disabled",true);
			}
		});
		
		$('#password_confirm').keyup(function(){
			var pattern = /^[a-zA-Z0-9\._\-]{6,14}$/;
			var password = document.getElementById('password').value;
			var password_confirm = document.getElementById("password_confirm").value;
			if(password_confirm.match(pattern) && password == password_confirm){
				flag_password_confirm = true;
				$('#password_confirm-info').html("");
				if(flag_id && flag_name && flag_email && flag_password && flag_password_confirm && flag_area)
					$('#signupBtn').attr("disabled",false);
			}
			else if(!password_confirm.match(pattern) && password == password_confirm){
				flag_password_confirm = false;
				$('#password_confirm-info').html("你再次输入的密码和上面一样，但是你的密码是不符合我们的规定的");
				$('#signupBtn').attr("disabled",true);
			}
			else if(password_confirm.match(pattern) && password != password_confirm){
				flag_password_confirm = false;
				$('#password_confirm-info').html("虽然你再次输入的密码和上面不一样，但你再次输入的密码符合我们的规定");
				$('#signupBtn').attr("disabled",true);
			}
			else{
				flag_password_confirm = false;
				$('#password_confirm-info').html("你再次输入的密码不仅和上面不一样，而且它不符合我们的规定");
				$('#signupBtn').attr("disabled",true);
			}
		});
		
		$('#name').keyup(function(){
			var pattern = /^[\u4e00-\u9fff\w]{5,16}$/;
			var name = document.getElementById("name").value;
			if(name.match(pattern)){
				flag_name = true;
				$('#name-info').html("");
				if(flag_id && flag_name && flag_email && flag_password && flag_password_confirm && flag_area)
					$('#signupBtn').attr("disabled",false);
			}
			else{
				flag_name = false;
				$('#name-info').html("用户名必须是5-16位的数字、字母或汉字");
				$('#signupBtn').attr("disabled",true);
			}
		});
		
		$('#email').keyup(function(){
			var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
			var email = document.getElementById("email").value;
			if(email.match(pattern)){
				flag_email = true;
				$('#email-info').html("");
				if(flag_id && flag_name && flag_email && flag_password && flag_password_confirm && flag_area)
					$('#signupBtn').attr("disabled",false);
			}
			else{
				flag_email = false;
				$('#email-info').html("这不是有效的邮件地址");
				$('#signupBtn').attr("disabled", true);
			}
		});
		
		$('#area').keyup(function(){
			var pattern = /^[a-zA-Z\u4e00-\u9fff]{2,10}$/;
			var area = document.getElementById("area").value;
			if(area.match(pattern)){
				flag_area = true;
				$('#area-info').html("");
				if(flag_id && flag_name && flag_email && flag_password && flag_password_confirm && flag_area)
					$('#signupBtn').attr("disabled",false);
			}
			else{
				flag_area = false;
				$('#area-info').html("你这个地区好奇怪啊");
				$('#signupBtn').attr("disabled", true);
			}
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
                             <label  class="icon-info"></label>
                            <input id="userid" type="text" name="id" placeholder="请输入ID" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                        <span id="id-info" style="color:#7ac143;"></span>
                    </div>
                     <div class="control-group">
                        <div class="controls">
                             <label  class="icon-user"></label>
                            <input id="name" type="text" name="name" placeholder="请输入昵称" tabindex="1"class="form-control input-medium">
                        </div>
                        <span id="name-info" style="color:#7ac143;"></span>
                    </div>
					 <div class="control-group">
                        <div class="controls">
                                <label  class="icon-envelope-o"></label>
                            <input id="email" type="email" name="email" placeholder="请输入邮件" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                        <span id="email-info" style="color:#7ac143;"></span>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                             <label  class="icon-key"></label>
                            <input id="password" type="password" name="password" placeholder="请输入密码" tabindex="2" class="form-control input-medium">
                        </div>
                        <span id="password-info" style="color:#7ac143;"></span>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                             <label  class="icon-key"></label>
                            <input id="password_confirm" type="password" name="password_confirm" placeholder="请再次输入密码" tabindex="2" class="form-control input-medium">
                        </div>
                        <span id="password_confirm-info" style="color:#7ac143;"></span>
                    </div>
					 <div class="control-group">
                        <div class="controls">
                            <label  class="icon-home"></label>
                            <input id="area" type="text" name="area" placeholder="请输入地区" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                        <span id="area-info" style="color:#7ac143;"></span>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" tabindex="4" class="btn btn-primary" id="signupBtn" onclick="return false;">注册</button>
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