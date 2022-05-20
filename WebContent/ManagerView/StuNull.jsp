<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>${param.bid }栋${param.did }室${param.bedNo }床</label>
	<label>这里暂时没有学生住</label>
	<a href="<%= request.getContextPath()%>/StuBedController/StuWithoutBed">分配床位</a>
	<a href="<%= request.getContextPath()%>/ManagerView/Bed.jsp">返回</a>
</body>
</html>