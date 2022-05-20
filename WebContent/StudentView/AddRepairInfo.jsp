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
		var repairNote = document.getElementById("repairNote").value;
		var bid = document.getElementById("bid").value;
		var did = document.getElementById("did").value;
		
		if(repairNote==""||repairNote==null){
			alert("请描述宿舍需要维修的说明");
			return false;
		}else if(bid==""||bid==null){
			alert("请输入楼栋编号");
			return false;
		}else if(did==""||did==null){
			alert("请输入宿舍编号");
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

	<div class="switch" >
		<form name="toform" action="<%= request.getContextPath() %>/repairController/addRepairs" method="post" >
			<input type="text" id="repairNote" name="repairNote" autocomplete="off" placeholder="维修说明" >
			<input type="text" id="bid" name="bid" autocomplete="off" placeholder="楼栋编号" >
			<input type="text" id="did" name="did" autocomplete="off" placeholder="宿舍号">
			<input type="submit" value="提交" onclick="return toSubmit()">
			<input type="reset" value="重置">
			<input type="button" value="返回" onclick="javascript:history.go(-1)">
		</form>
	</div>
</body>
</html>