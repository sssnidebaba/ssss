<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
  
	String LogTime = (String)session.getValue("sessionlogtime");
    String IP = (String)session.getValue("sessionip");
  
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <center>
    <form style="margin: 0px; font-size: 36px;margin-left:108px;margin-right:0px" name="form1" method="post" action="delete_shopowner.jsp">
              
              <input placeholder="   输入商家用户名进行删除" onClick="hideSearch()" type="text" name="ownid" id="search_text" style="background:url('img/search.png');
              background-repeat:no-repeat;background-position: 5px,center; height: 40px; width: 50%;">
              <button type="submit" id="search_button" >删除</button>
              <img src="img/search.png" style="width:160px;visibility:hidden;">
    </form>
    </center>
    <br><br><br><br><br><br><br><br><br><br><br><br>
    
    <table width="90%" border="0" cellspacing="10" cellpadding="10">
	  <tr>
	    <td align="right" style="color:#000000;font-weight:bold;width: 390px;font-size:16px;">登录时间： </td>
	    <td ><label><%=LogTime%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000000;font-weight:bold;width: 390px;font-size:16px;">ip地址： </td>
	    <td ><label><%=IP%></label>&nbsp;</td>
      </tr>
	</table>

</body>
</html>