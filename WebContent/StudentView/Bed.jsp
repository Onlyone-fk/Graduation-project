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
<body onload="become()">
	<h2><%= session.getAttribute("bid") %>栋<%= session.getAttribute("did") %>室</h2>
	<h3>卫生评分：<%=session.getAttribute("HealthScore") %></h3>
	<script type="text/javascript">
		function getscore(a){
			var path="<%= request.getContextPath()%>";
			var score = 'score='+document.getElementById("score").value;
			var bid = 'bid='+'<%= session.getAttribute("bid") %>';
			var did = 'did='+'<%= session.getAttribute("did") %>';
			a.href=path+"/dormitoryController/getScore?"+score+"&"+bid+"&"+did;
		}
		function become(){
			var bedNo = document.getElementsByClassName("bedNo");
			var sid = document.getElementsByClassName("sid");
			var sclass = document.getElementsByClassName("sclass");
			var sname = document.getElementsByClassName("sname");
			for(var i=0;i<sid.length;i++){
				if(sid[i].innerText=='${sessionScope.sid}'){
					bedNo[i].style.backgroundColor="#e8e8ca";
					sid[i].style.backgroundColor="#e8e8ca";
					sclass[i].style.backgroundColor="#e8e8ca";
					sname[i].style.backgroundColor="#e8e8ca";
				}
			}
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
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${BedList }" var="bedlist">
					<tr>
						<td class="bedNo">${bedlist.bedNo }</td>
						<c:forEach items="${bedlist.stu }" var="stulist">
							<td class="sid">${stulist.sid }</td>
						</c:forEach>
						<c:forEach items="${bedlist.stu }" var="stulist">
							<td class="sclass">${stulist.sclass }</td>
						</c:forEach>
						<c:forEach items="${bedlist.stu }" var="stulist">
							<td class="sname">${stulist.sname }</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<a class="back" href="<%= request.getContextPath()%>/StudentView/Dormitory.jsp">返回</a>
</body>
</html>