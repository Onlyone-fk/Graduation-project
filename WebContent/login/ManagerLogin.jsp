<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="<%=request.getContextPath()%>/css/login_css/managerLogin.css" rel="stylesheet" >
<title>登录</title>

</head>
<body>
<script type="text/javascript">
function toSubmit(){
	var userName = document.getElementById("userName").value;
	var userPwd = document.getElementById("userPwd").value;
	
	if(userName==""||userName==null){
		alert("请输入用户名");
		return false;
	}else if(userPwd==""||userPwd==null){
		alert("请输入密码");
		return false;
	}
	
	return true;
}
function toSubmit1(){
	var Name = document.getElementById("Name").value;
	var Pwd = document.getElementById("Pwd").value;
	var identity = document.getElementById("identity");
	var index = identity.selectedIndex;
	var out = identity.options[index].text;
	if(out=="学生"){
		var Class = document.getElementById("userClass").value;
		if(Name==""||Name==null){
			alert("请输入用户名");
			return false;
		}else if(Pwd==""||Pwd==null){
			alert("请输入密码");
			return false;
		}else if(Class==""||Class==null){
			alert("请输入班级");
			return false;
		}
	}else{
		if(Name==""||Name==null){
			alert("请输入用户名");
			return false;
		}else if(Pwd==""||Pwd==null){
			alert("请输入密码");
			return false;
		}
	}
	return true;
}

</script>
	<c:if test="${not empty sessionScope.Register && sessionScope.Register=='successful' }">
		<script>alert("注册成功")</script>
	</c:if>
	<c:if test="${not empty sessionScope.Register && sessionScope.Register=='fail' }">
		<script>alert("注册失败")</script>
	</c:if>
	<c:if test="${not empty sessionScope.err && sessionScope.err=='' }">
		<script>alert('<%=session.getAttribute("err") %>')</script>
	</c:if>
	<c:if test="${not empty sessionScope.loginError }">
		<script>alert('<%=session.getAttribute("loginError") %>')</script>
	</c:if>
	<div class="fixed">
		<div class="form-demo">
    		<div class="switch"><h2>没有/已有账号？</h2></div>
    		<input type="checkbox" style="display: none;" id="change">
      		<label for="change" class="lchange">切 换</label>
  
    		<div class="turn">
      			<div class="over">
        			<form action="<%= request.getContextPath() %>/LoginController/login" class="login" method="post">
          				<h1>欢迎登录</h1>
          				<input type="text" id="userName" name="userName" class="ntext" autocomplete="off" placeholder="用户名">
          				<input type="password" id="userPwd" name="userPwd" class="ntext" placeholder="密码"><br/>
          				<div class="theradio">
          					<input name="identity" value="manager" type="radio" class="identity" id="identity1" checked>
          					<label for="identity1">宿管</label>
							<input name="identity" value="student" type="radio" class="identity" id="identity2">
							<label for="identity2">学生</label>
							<input name="identity" value="repair" type="radio" class="identity" id="identity32">
							<label for="identity32">维修人员</label>
          				</div>
          				<input type="submit" class="btn" value="登 录" onclick="return toSubmit()">
        			</form>
        			<form action="<%= request.getContextPath() %>/RegisterController/register" method="post" class="sign">
          				<h1>注册加入</h1>
          				<input type="text" class="ntext2" id="Name" name="userName" autocomplete="off" placeholder="名称">
          				<input type="text" id="userClass" name="userClass" class="ntext2" autocomplete="off" placeholder="班级">
          				<input type="password" class="ntext2" id="Pwd" name="userPwd" placeholder="密码" >
          				
          				<div class="theid">
          					<select id="identity" name="Registeridentity" onchange="getidentity()">
<!--           						<option value="manager">宿管</option> -->
          						<option value="repair">维修人员</option>
          						<option value="student">学生</option>
          					</select>
          					<script type="text/javascript">
          						function getidentity(){
          							var identitys = document.getElementById("identity");
          							var index = identitys.selectedIndex;
          							var out = identitys.options[index].text;
          							if(out=="学生"){
          								document.getElementById("userClass").style.display="inline";
          								var list = document.getElementsByClassName("ntext2");
          								for(var i=0;i<list.length;i++){
          									list[0].setAttribute("placeholder","学生名");
          									document.getElementsByClassName("btn2")[0].style.marginTop="0px";
          									identitys.style.height="40px";
          									list[i].style.height="40px";
          									identitys.style.marginBottom="15px";
          									list[i].style.marginBottom="15px";
          								}
          							}else{
          								document.getElementById("userClass").style.display="none";
          								var list = document.getElementsByClassName("ntext2");
          								for(var i=0;i<list.length;i++){
          									list[0].setAttribute("placeholder","名称");
          									document.getElementsByClassName("btn2")[0].style.marginTop="15px";
          									identitys.style.height="48px";
          									list[i].style.height="48px";
          									identitys.style.marginBottom="20px";
          									list[i].style.marginBottom="20px";
          								}
          							}
          						}
          					</script>
          				</div>
          				<input type="submit" class="btn2" value="注 册" onclick="return toSubmit1()" >
        			</form>
      			</div>
    		</div>
  		</div>
	</div>
</body>
</html>
<!-- 登录校验 -->
<%-- <c:if test="${not empty sessionScope.loginError && sessionScope.loginError == 'loginError'}"> --%>
<!-- 	<script>alert("您的账号或密码错误，点击\"确定\"重新登录")</script> -->
<%-- </c:if> --%>
<!-- <!-- 修改密码校验 --> -->
<%-- <c:if test="${not empty requestScope.request_updatePwdError && requestScope.request_updatePwdError == 'false1'}"> --%>
<!--    		<script>alert("该密码可用，点击\"确定\"重新登录");	</script> -->
<%--  </c:if> --%>
<!-- 	<article class="content"> -->
<!-- 		<div class="wrap"> -->
<!-- 			<div class=loginBox> -->
<%-- 				<form action="<%= request.getContextPath() %>/ManagerController/login" method="post"> --%>
<!-- 					<h2>学生宿舍管理系统</h2> -->
<!-- 					<div class="item"> -->
<!-- 						<input id="managerID" name="userName" type="text" autocomplete="off" required> -->
<!-- 						<label for="">用户名</label> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<input id="managerPwd" name="userPwd" type="password" required> -->
<!-- 						<label for="">密码</label> -->
<!-- 					</div> -->
					
<!-- 					<div class="item2"> -->
					
<!-- 						<input name="identity" value="manager" type="radio" checked><label for="identity">宿管</label> -->
						
<!-- 						<input name="identity" value="student" type="radio"><label for="identity">学生</label> -->
<!-- 					</div>	 -->
<!-- 					<button class="btn" type="submit">登录</button> -->
<!-- 				</form> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	<article> -->