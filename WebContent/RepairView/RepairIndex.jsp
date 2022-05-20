<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_css/Index.css" />
</head>
<body>
	<div class="navbar">
		<input type="checkbox" id="checkbox" />
		<label for="checkbox" class="checkB">
			<i class="fa fa-outdent"></i>
		</label>
		<ul>
			<li>
					<img src="../image/head3.png" alt="" />
					<span>您好，<%= session.getAttribute("RepairID") %>号维修人员</span>
			</li>
			<li>
				<a class="session" href="<%= request.getContextPath()%>/repairController/queryRidRepair?rid=${sessionScope.RepairID}" target="frame">
					<i class="fa fa-phone"></i>
					<span>报修管理</span>
				</a>
			</li>
		</ul>
			<iframe src="" class="frame" name="frame" scrolling="yes"></iframe>
		<div class="navbar-right">
			<i class="fa fa-drivers-license-o"></i>
			<span class="">${sessionScope.repairPeople.rname}</span>&nbsp;
			<a class="nosession" href="${pageContext.request.contextPath}/login/session_Invalidate.jsp"><i class="fa fa-sign-out"></i>安全退出</a>
		</div>
	</div>
</body>
</html>