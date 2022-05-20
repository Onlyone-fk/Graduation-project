<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index_css/studentIndex.css" />
</head>
<body>
	<div class="navbar">
		<input type="checkbox" id="checkbox" />
		<label for="checkbox" class="checkB">
			<i class="fa fa-outdent"></i>
		</label>
		<ul>
			<li>
					<img src="../image/head2.png" alt="" />
					<span>您好，<%= session.getAttribute("studentID") %>号同学</span>
				</li>
			<li>
				<input type="radio" name="function" id="dorManage" onclick="cc1()">
				<label for="dorManage">
					<i class="fa fa-home"></i>
					<span>查看宿舍</span>
				</label>
			</li>
			<li>
				<input type="radio" name="function" id="Lost" onclick="cc2()">
				<label for="Lost">
					<i class="fa fa-user"></i>
					<span>物品遗失</span>
				</label>
			</li>
			<li>
				<input type="radio" name="function" id="repairManage" onclick="cc3()">
				<label for="repairManage">
					<i class="fa fa-phone"></i>
					<span>报修管理</span>
				</label>
			</li>
		</ul>
			<iframe src="" id="frame" class="frame" name="frame" scrolling="yes"></iframe>
		<div class="navbar-right">
			<i class="fa fa-drivers-license-o"></i>
			<span class="">${sessionScope.studentInfo.sname} ${sessionScope.studentInfo.sclass }</span>&nbsp;
			<a class="nosession" href="${pageContext.request.contextPath}/login/session_Invalidate.jsp"><i class="fa fa-sign-out"></i>安全退出</a>
		</div>
	</div>
	<script type="text/javascript">
		function cc1(){
			var path = "<%= request.getContextPath()%>/dormitoryController/querystuBuilding?sid=";
			var frame = document.getElementById("frame");
			frame.src=path+'${sessionScope.studentID}';
		}
		function cc2(){
			var path = "<%= request.getContextPath()%>/itemsController/stulostItems";
			var frame = document.getElementById("frame");
			frame.src=path;
		}
		function cc3(){
			var path = "<%= request.getContextPath()%>/repairController/querySidRepair?sid=";
			var frame = document.getElementById("frame");
			frame.src=path+'${sessionScope.studentID}';
		}
	
	</script>
</body>
</html>