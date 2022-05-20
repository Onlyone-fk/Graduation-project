<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/ExchangeBeds.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body onload="stu()">
	<div class="switch">
		<form action="<%= request.getContextPath()%>/StuBedController/StuExchangeBed" method="post">
			<select id="selectSid" onchange="stu()">
				<c:forEach var="allstuList" items="${AllstuList }">
					<option>${allstuList.sid} ${allstuList.sname } ${allstuList.sclass }</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				function stu(){
					var sid = document.getElementById("selectSid");
					var index = sid.selectedIndex;
					var string = sid[index].text;
 					document.getElementById("stuName").value=parseInt(string.substring(0,1));
				}
			</script>
			<input type="text" id="stuName" name="stuID" value="" readonly>
			<input type="text" name="buildingID" value="<%= session.getAttribute("bid") %>" readonly>栋
			<input type="text" name="dormitoryID" value="<%= session.getAttribute("did") %>" readonly>室
			<input type="text" name="bedNo" value="<%= session.getAttribute("bedNo") %>" readonly>号床
			<input type="submit" value="分配">
			<input type="button" value="返回" onclick="javascript:history.go(-1)">
		</form>
	</div>
</body>
</html>