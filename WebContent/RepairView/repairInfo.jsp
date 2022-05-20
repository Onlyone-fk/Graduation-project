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
						<td>${repairinfo.rid }</td>
						<td>
							<a class="complete" href="" onclick="complete(this,${repairinfo.repairid })">维修完成</a>
							<script type="text/javascript">
								function complete(a,b){
									var repairid = "repairid="+b;
									var path = "<%=request.getContextPath()%>";
									a.href=path+"/repairController/delRepairs?"+repairid;
								}
							</script>
						</td>
						
					</tr>
					
				</c:forEach>
				
			</tbody>
		</table>
	</div>
	
	</body>
</html>