<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>忘记密码</title>
<link rel="stylesheet" href="css/login.css">
<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	
	<%-- ajax请求开始 --%>
	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#submitBtn").click(function(){
			var userid = document.getElementById('userid').value;
			var emailinput = document.getElementById('emailinput').value;
			$.ajax({
				url:'ForgetPasswordServlet',
				async:true,
				data:{
					userid: userid,
					emailinput: emailinput
				},
				type:'post',
				cache:false,
				dataType:'xml',
				success:function(data){
					var res = data.getElementsByTagName("result")[0].firstChild.nodeValue;
					if(res == 0)
						alert("id或邮箱输入不正确");
					else{
						var name = data.getElementsByTagName("name")[0].firstChild.nodeValue;
						document.getElementById('loginInfo').innerHTML = "提交成功，请至邮箱查收您的邮件。";
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
                            <input id="userid" type="text" name="userid" placeholder="请输入id" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label  class="icon-envelope-o"></label>
                            <input id="emailinput" type="email" name="password" placeholder="请输入邮箱" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
                    <span style="color: #7ac143;" id="loginInfo"></span>
                </div>
                    <button type="submit" tabindex="4" class="btn btn-primary" id="submitBtn" onclick="return false;">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- end -->
</body>
</html>