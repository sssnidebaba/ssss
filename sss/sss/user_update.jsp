<%@ page language="java" import="java.util.*" pageEncoding="utf-8" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>华工书店</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/info.css">
  </head>
  <body bgcolor="#DC143C" style="overflow: hidden;">
    <form action="user_update_do.jsp" method="post" class="1">
	<p >&nbsp;</p>
	<table width="90%" border="0" cellspacing="10" cellpadding="10" style="color:#000000">
	  <tr>
	    <td  align="right">昵称： </td>
	    <td><input name="username" /></td>
      </tr>
	  <!--  
	  <tr>
	    <td align="right">请上传头像： </td>
	    <td><input name="fileField" type="file" id="fileField" size="30" maxlength="45" /></td>
      </tr>
	  --> 
	  <tr>
	    <td align="right">性别：</td>
	    <td><input name="usersex" type="radio" value="男" checked="checked" />
	      男
            <input name="usersex" value="女" type="radio" />
        女</td>
      </tr>
	  <tr>
	    <td align="right">电 话： </td>
	    <td><input name="userphone" size="25" /></td>
      </tr>
	  <tr>
	    <td align="right">楼 号： </td>
	    <td><input name="userdormitory" size="25"/></td>
      </tr>
	  <tr>
	    <td align="right">宿舍号： </td>
	    <td><input name="usernumber" size="25"/></td>
      </tr>
      <tr>
	    <td align="right">&nbsp;</td>
	    <td><button type="submit" class="inputstyle1">修改</button></td>
      </tr>
	  </table>
	<p>&nbsp;</p>
  	</form>
  </body>
</html>
