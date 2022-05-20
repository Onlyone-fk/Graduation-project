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
<a class="open" href="<%=request.getContextPath()%>/ManagerView/AddLostItem.jsp">丢失物品</a>
<%-- 	<a class="open" href="" target="_self" onclick="window.open('<%= request.getContextPath()%>/ManagerView/AddLostItem.jsp','','height=529, width=700, top=265,left=645, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')">丢失物品</a> --%>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>物品编号</th>
					<th>物品名称</th>
					<th>失主学生编号</th>
					<th>失主宿舍编号</th>
					<th>备注</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="items" items="${itemsList }">
					<tr>
						<td><label class="item">${items.itemsId }</label></td>
						<td>${items.itemsName }</td>
						<td>${items.sid }</td>
						<td>${items.bid }栋${items.did }室${items.bedNo }号床</td>
						<td>
							<c:if test="${items.notes=='' }"><label>暂无</label></c:if>
							<c:if test="${items.notes!='' }"><label>${items.notes }</label></c:if>
						</td>
						<td>${items.itemstatus }</td>
						<td><a class="update" href="<%= request.getContextPath()%>/itemsController/renewStatus?itemsid=${items.itemsId }">已收到</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	</body>
</html>