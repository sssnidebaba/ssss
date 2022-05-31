<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/regist.css" />
<script type="text/javascript" src="js/check_regist.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
<script src='js/check_regist.js'></script>
<title>注册页面</title>
</head>
<body style="overflow:hidden;" onload="load()">
	<center>
		<div class="regist" style="font-family: 楷体;">
		<form name="regist"  action="registjudge.jsp" method="post">
			<TABLE>
				<tr>
					<td>用户名：</td>
					<td><INPUT id="id" oninput="checkUser()" type="text" name="id" placeholder="账号" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><INPUT id="pass" onInput="checkPass()" type="password" name="pwd" placeholder="密码" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr><tr>
					<td>确认密码：</td>
					<td><INPUT id="pass2" onInput="checkPass2()" type="password" name="pwd2" placeholder="确认密码" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr><tr>
					<td>性别：</td>
					<td><INPUT name="sex" type="radio" value="男" checked="true" />男<INPUT name="sex" type="radio" value="女" />女</td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr><tr>
					<td>昵称：</td>
					<td><INPUT id="name" onInput="checkName()" type="text" name="name" placeholder="昵称" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr><tr>
					<td>手机：</td>
					<td><INPUT id="phone" onInput="checkPhone()" type="text" name="phone" placeholder="手机号" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>宿舍楼：</td>
					<td><INPUT id="dormitory" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="2" onInput="checkDormitory()" type="text" name="dormitory" placeholder="楼号" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>房间号：</td>
					<td><INPUT id="roomnumber" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="3" onInput="checkRoomnumber()" type="text" name="roomnumber" placeholder="房间号" /></td>
					<td class="tip">&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<center><a class="a-upload"><INPUT id="regBtn" type="submit"/>注册</a></center>
					</td>
				</tr>
			</TABLE>
			</form>
		</div>
	</center>
</body>
</html>