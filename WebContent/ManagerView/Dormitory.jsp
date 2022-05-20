<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/dormitory.css" rel="stylesheet" >
<title>宿舍管理</title>
</head>
<body>
		<div class="container">
		<table>
			<thead>
				<tr>
					<th>所属楼栋</th>
					<th>宿舍编号</th>
					<th>住宿学生编号</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dormitoryList" items="${DormitoryList }">
					<tr>
						<td><%= session.getAttribute("bid") %>栋</td>
						<td><a href="<%= request.getContextPath()%>/dormitoryController/findBed?bid=${bid }&did=${ dormitoryList.did }">${ dormitoryList.did }室</a></td>
						<td>
							<c:forEach items="${dormitoryList.stu }" var="dormitorytoStu">${dormitorytoStu }号学生 </c:forEach>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<a class="back" href="<%= request.getContextPath()%>/dormitoryController/findBuilding?mid=${sessionScope.managerID}">返回</a>
</body>
</html>