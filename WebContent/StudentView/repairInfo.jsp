<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/items.css" rel="stylesheet" >
<title>物品遗失</title>
</head>
<body>
	<a class="open" href="<%=request.getContextPath()%>/StudentView/AddRepairInfo.jsp">报修</a>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>维修信息编号</th>
					<th>维修信息</th>
					<th>维修宿舍号</th>
					<th>负责人编号</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="repairinfo" items="${repairInfo }">
					<tr>
						<td class="repairid">${repairinfo.repairid }</td>
						<td>${repairinfo.repairNote }</td>
						<td>${repairinfo.bid }栋${repairinfo.did }室</td>
						<td>
							<c:if test="${ repairinfo.rid == 0 }">
								未分配负责人
							</c:if>
							<c:if test="${ repairinfo.rid != 0 }">
								${repairinfo.rid }
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	</body>
</html>