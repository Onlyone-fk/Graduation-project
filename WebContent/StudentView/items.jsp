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
<body onload="getRemark()">
<a class="open" href="<%=request.getContextPath()%>/StudentView/AddLostItem.jsp">丢失物品</a>
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
							<c:if test="${items.sid==sessionScope.studentID }">
								<c:if test="${items.notes=='' }"><label class="remarkslab" onclick="getRemark()">暂无</label></c:if>
								<c:if test="${items.notes!='' }"><label class="remarkslab" onclick="getRemark()">${items.notes }</label></c:if>
								<input type="text" style="width:100%" class="remarksinp" value="${items.notes }">
							</c:if>
							<c:if test="${items.sid!=sessionScope.studentID }">
								<label>${items.notes }</label>
							</c:if>
						</td>
						<td>${items.itemstatus }</td>
						<td><c:if test="${items.sid==sessionScope.studentID }"><a class="update" href="" >更改备注</a></c:if>
							<c:if test="${items.sid!=sessionScope.studentID }"><label class="renew">更改备注</label></c:if>
						 	<c:if test="${items.sid==sessionScope.studentID }"><a class="giveback" href="<%= request.getContextPath()%>/itemsController/deletestuItems?itemsid=${items.itemsId }">已归还</a></c:if>
						 	<c:if test="${items.sid!=sessionScope.studentID }"><label class="renew">已归还</label></c:if>
						 </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script type="text/javascript">
		function getRemark(){
			var remarkslab = document.getElementsByClassName("remarkslab");
			var remarksinp = document.getElementsByClassName("remarksinp");
			var update = document.getElementsByClassName("update");
			var item = document.getElementsByClassName("item");
			for(let i=0;i<remarkslab.length;i++){
				remarkslab[i].onclick=function(){
					remarkslab[i].style.display="none";
		 			remarksinp[i].style.display="inline";
		 			remarksinp[i].focus();
				}
				update[i].onclick=function(){
					var notes = 'notes='+remarksinp[i].value;
					var itemsid = 'itemsid='+item[i].innerHTML;
					var path="<%= request.getContextPath()%>";
					this.href=path+"/itemsController/stuchangeNotes?"+notes+"&"+itemsid;
				}
			}
// 			
		}
// 		function notRemark(){
// 			document.getElementById("remarkslab").style.display="inline";
// 			document.getElementById("remarksinp").style.display="none";
// 		}
// 		function updateNotes(a){
// 			var notes = 'notes='+document.getElementById("remarksinp").value;
// 			var itemsid = 'itemsid='+document.getElementById("item").innerHTML;
<%-- 			var path="<%= request.getContextPath()%>"; --%>
// 			a.href=path+"/itemsController/changeNotes?"+notes+"&"+itemsid;
// 		}
	</script>
	</body>
</html>