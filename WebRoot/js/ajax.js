  $(document).ready(function(){
  	$('#btn').click(function(){
		$.ajax({
					type:'POST',
					async:true,
					url:'MyJsp.jsp',
					data:{
						type:'type',
					},
					success:function(data){
						func(data);
					},
					error:function(){
						alert("出错了");
					},
					dataType:'xml' 
		});
	});
  });

function func(data){
	alert("成功了");
	var contents = data.getElementsByTagName("content")[0].firstChild.nodeValue;
	document.getElementById('ps').innerHTML = contents;
}