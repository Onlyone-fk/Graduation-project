<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>${param.bid }栋${param.did }室${param.bedNo }床</label>
	<c:if test="${sessionScope.StuList!='null' }">
		<c:forEach var="stuList" items="${StuList }">
			学生编号：<label>${stuList.sid}</label>
			学生姓名：<label>${stuList.sname}</label>
			学生班级：<label>${ stuList.sclass}</label>
		</c:forEach>
	</c:if>
	<a href="<%= request.getContextPath()%>/StuBedController/StuLeave?sid=${sessionScope.StuList[0].sid }">学生搬离</a>
	<a href="<%= request.getContextPath()%>/ManagerView/Bed.jsp">返回</a>
</body>
</html>