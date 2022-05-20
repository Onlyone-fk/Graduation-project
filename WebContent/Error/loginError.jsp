<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录出错！</title>
</head>
<body>
	<% if("managerloginError".equals(session.getAttribute("loginError"))) {%>
	<label>不存在这个管理人员!</label>
	<% }else{ %>
	<label>不存在这个学生!</label>
	<%} %>
</body>
</html>