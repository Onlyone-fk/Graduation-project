<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/Building.css" rel="stylesheet" >
<title>宿舍楼管理</title>
</head>
<body>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>楼栋编号</th>
					<th>楼栋号码</th>
					<th>负责人id</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="buildingList" items="${BuildingList }">
					<tr>
						<td><a href="<%= request.getContextPath()%>/dormitoryController/findDormitory?bid=${ buildingList.bid }">${ buildingList.bid }栋</a></td>
						<td>${buildingList.bcall }</td>
						<td>${sessionScope.managerID} </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>