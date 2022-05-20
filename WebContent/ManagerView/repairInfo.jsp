<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/repairInfo.css" rel="stylesheet" >
<title>物品遗失</title>
</head>
<body>
<%-- 	<a class="open" href="" target="_self" onclick="window.open('<%= request.getContextPath()%>/ManagerView/AddLostItem.jsp','','height=529, width=700, top=265,left=645, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no')">丢失物品</a> --%>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>维修信息编号</th>
					<th>维修信息</th>
					<th>维修宿舍号</th>
					<th>负责人编号</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="repairinfo" items="${repairInfo }">
					<tr>
						<td class="repairid">${repairinfo.repairid }</td>
						<td>${repairinfo.repairNote }</td>
						<td>${repairinfo.bid }栋${repairinfo.did }室</td>
						<td>
							<c:if test="${ repairinfo.rid eq 0}">
								<select id="getRid">
									<c:forEach var="repair" items="${repairlist }">
										<option>${repair.rid }</option>
									</c:forEach>
								</select>
							</c:if>
							<c:if test="${ repairinfo.rid ne 0}">${repairinfo.rid }</c:if>
						</td>
						<td>
							<c:if test="${ repairinfo.rid eq 0}">
								<a href="" class="assign" onclick="assign(this,${repairinfo.repairid })">分配</a>
								<script type="text/javascript">
									function assign(a,b){
										var repairid = "repairid="+b;
										var getrid = document.getElementById("getRid");
										var index = getrid.selectedIndex;
										var rid = "rid="+getrid[index].text;
										var path = "<%=request.getContextPath()%>";
										a.href=path+"/repairController/assignRepair?"+repairid+"&"+rid;
									}
								</script>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	</body>
</html>