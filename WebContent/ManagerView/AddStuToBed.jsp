<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/addstutobed.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>

	<div class="switch">
		<form action="<%= request.getContextPath()%>/StuBedController/AssignStuToBed" method="post">
			<select id="selectSid" onchange="stu()">
				<option>请选择学生</option>
				<c:forEach var="stuList" items="${stuList }">
					<option>${stuList.sid} ${stuList.sname } ${stuList.sclass }</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				function stu(){
					var sid = document.getElementById("selectSid");
					var index = sid.selectedIndex;
					var string = sid[index].text;
 					document.getElementById("stuName").value=parseInt(string.substring(0,1));
				}
				function toSubmit(){
					var sid = document.getElementById("stuName").value;
					if(sid==""||sid==null){
						alert("请选择学生");
						return false;
					}
					return true;
				}
			</script>
			<input type="text" id="stuName" name="stuID" value="" readonly>号生
			<input type="text" name="buildingID" value="<%= session.getAttribute("bid") %>" readonly>  栋
			<input type="text" name="dormitoryID" value="<%= session.getAttribute("did") %>" readonly>  室
			<input type="text" name="bedNo" value="<%= session.getAttribute("bedNo") %>" readonly>号床
			<input type="submit" value="分 配" onclick="return toSubmit()">
			<a href="<%= request.getContextPath()%>/dormitoryController/findBed?bid=${sessionScope.bid }&did=${ sessionScope.did }">返 回</a>
		</form>
	</div>
</body>
</html>