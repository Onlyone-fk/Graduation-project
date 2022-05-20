<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<title>loading</title>
<style>
	body{
		margin: 0px;
		padding: 0px;
		background-image:url("../image/error2.jpg");
		background-repeat: no-repeat;
		background-size: 100% 100vh;
		
	}
	.content{
		position: absolute;
		top: 10vh;
		left: 40vh;
	}
	h1{
		color: aliceblue;
	}
</style>
</head>
<body>
	<%
		//注销session并且返回登陆页面
		session.invalidate();
	%>	
		<div class="content">
			<h1><i class="fa fa-spinner"></i>Loading...</h1>
		</div>
	<%
		response.setHeader("Refresh", "3;url=ManagerLogin.jsp");
	%>
</body>
</html>