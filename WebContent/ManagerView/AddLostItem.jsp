<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/index_css/additems.css" rel="stylesheet" >
<title>添加丢失物品清单</title>
<script type="text/javascript">
	function toSubmit(){
		var itemsName = document.getElementById("itemsName").value;
		var sid = document.getElementById("sid").value;
		
		if(itemsName==""||itemsName==null){
			alert("请输入丢失物件的名称");
			return false;
		}else if(sid==""||sid==null){
			alert("请输入失主的学生编号");
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

	<div class="switch" >
		<form name="toform" action="<%= request.getContextPath() %>/itemsController/addItems" method="post" >
			<input type="text" id="itemsName" name="itemsName" autocomplete="off" placeholder="丢失物品名" >
			<input type="text" id="sid" name="sid" autocomplete="off" placeholder="失主学生编号" >
			<input type="text" id="notes" name="notes" autocomplete="off" placeholder="物品备注">
			<input type="submit" value="提交" onclick="return toSubmit()">
			<input type="reset" value="重置">
			<input type="button" value="返回" onclick="javascript:history.go(-1)">
		</form>
	</div>
</body>
</html>