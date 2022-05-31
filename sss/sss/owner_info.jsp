<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
    String ownid = (String)session.getValue("sessionid");
    String ownname=null; 
	String ownsex=null;
	String ownphone=null;
	String owndormitory=null;
	String ownnumber=null;
	String ownprofile=null;
	String LogTime = (String)session.getValue("sessionlogtime");
	String IP = (String)session.getValue("sessionip");
	
System.out.println(ownid);
request.setCharacterEncoding("utf-8");
	  Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from shop_owners where ownid ='"+ownid+"'"; //sql语句，查找普通用户学生
System.out.println(ownid+sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
int result=0;
while(rs.next())                                     //循环查找普通用户：学生结果集
{
	ownname=rs.getString("ownname"); 
	ownsex=rs.getString("ownsex");
	ownphone=rs.getString("ownphone");
	owndormitory=rs.getString("owndormitory");
	ownnumber=rs.getString("ownnumber");
	ownprofile=rs.getString("o_profile");
}
stmt.close();
con.close();	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'info.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  .cen {
	text-align: center;
}
  </style>
  </head>
  <body style="overflow:hidden;">
	<p ><img name="" src="<%=ownprofile%>" width="81" height="81" alt="" style="margin-left:235px;"></p>
	<div style="margin-left:230px;">
	<form action="own_uploadimage.jsp" method="post" enctype="multipart/form-data" name="form1">
    <input type="file" name="file">
    <input type="submit" name="Submit" value="上传">
    </div>
	<table width="90%" border="0" cellspacing="10" cellpadding="10">
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">姓 名： </td>
	    <td><label><%=ownname%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">性别：</td>
	    <td><label><%=ownsex%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">电 话： </td>
	    <td><label><%=ownphone%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">楼 号： </td>
	    <td><label><%=owndormitory%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">宿舍号： </td>
	    <td><label><%=ownnumber%></label>&nbsp;</td>
      </tr>
      <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">登陆时间： </td>
	    <td ><label style="color:#F00";><%=LogTime%></label>&nbsp;</td>
      </tr>
      <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">ip地址： </td>
	    <td ><label style="color:#F00";><%=IP%></label>&nbsp;</td>
      </tr>
	  </table>
	<p>&nbsp;</p>
  </body>
</html>
