<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="com.zhbit.pojo.*" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/Bed.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
	<c:if test="${not empty sessionScope.addStuSuccess }">
		<script>alert('<%= session.getAttribute("addStuSuccess") %>')</script>
		<% session.removeAttribute("addStuSuccess"); %>
	</c:if>
	<c:if test="${not empty sessionScope.addStuError }">
		<script>alert('<%=session.getAttribute("addStuError") %>')</script>
		<% session.removeAttribute("addStuError"); %>
	</c:if>
	<c:if test="${not empty sessionScope.deleteStuSuccess }">
		<script>alert('${sessionScope.deleteStuSuccess}')</script>
		<% session.removeAttribute("deleteStuSuccess"); %>
	</c:if>
	<c:if test="${not empty sessionScope.deleteStuError }">
		<script>alert('<%=session.getAttribute("deleteStuError") %>')</script>
		<% session.removeAttribute("deleteStuError"); %>
	</c:if>
	<h2><%= session.getAttribute("bid") %>栋<%= session.getAttribute("did") %>室</h2>
	<h3>卫生评分：<%=session.getAttribute("HealthScore") %></h3>
	
	<input type="number" name="score" id="score" value="" placeholder="请输入卫生评分">
	<a class="toScore" href="" onclick="getscore(this)">进行卫生评分</a>
	<script type="text/javascript">
		function getscore(a){
			var path="<%= request.getContextPath()%>";
			var score = 'score='+document.getElementById("score").value;
			var bid = 'bid='+'<%= session.getAttribute("bid") %>';
			var did = 'did='+'<%= session.getAttribute("did") %>';
			a.href=path+"/dormitoryController/getScore?"+score+"&"+bid+"&"+did;
		}
	</script>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>床号</th>
					<th>学生编号</th>
					<th>学生班级</th>
					<th>学生姓名</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<% List<Bed> b = (List<Bed>)session.getAttribute("BedList");
								for(Bed bed:b){
									
								
				%>
					<tr>
						<td><%= bed.getBedNo() %></td>
						<td>
							<%
								if(!bed.getStu().isEmpty()){
									for(StudentAccount sa:bed.getStu())	{
							%>
										<%=sa.getSid() %>
							<%
									}
								}else{
							%>
								<a href="<%= request.getContextPath()%>/StuBedController/StuWithoutBed?bedNo=<%= bed.getBedNo() %>">床位分配</a>
							<%
								}
							%>
						</td>
						<td>
							<%for(StudentAccount sa:bed.getStu())	{
							%>
										<%=sa.getSclass() %>
							<%} %>
						</td>
						<td>
						<%for(StudentAccount sa:bed.getStu())	{
							%>
										<%=sa.getSname() %>
							<%} %></td>
						<td>
							<%
								if(!bed.getStu().isEmpty()){
									for(StudentAccount sa:bed.getStu())	{
							%>
							<a href="<%= request.getContextPath()%>/StuBedController/ExchangeBed?bedNo=<%= bed.getBedNo() %>&sid=<%= sa.getSid() %>">交换床位</a> <a class="leave" href="<%= request.getContextPath()%>/StuBedController/StuLeave?sid=<%= sa.getSid() %>">学生搬离</a>
							<%}
							} %>
						</td>
					</tr>
				<%
								}
				%>
			</tbody>
		</table>
	</div>
	<a class="back" href="<%= request.getContextPath()%>/dormitoryController/findDormitory?bid=${sessionScope.bid}">返回</a>
</body>
</html>