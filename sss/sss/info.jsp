<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
    String userid = (String)session.getValue("sessionid");
    String username=null; 
	String usersex=null;
	String userphone=null;
	String userdormitory=null;
	String usernumber=null;
	String userprofile=null;
	String LogTime = (String)session.getValue("sessionlogtime");
	String IP = (String)session.getValue("sessionip");
	String huaxiang =null;
	
System.out.println(userid);
request.setCharacterEncoding("utf-8");
	  Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from users where userid ='"+userid+"'"; //sql语句,查找普通用户学生
System.out.println(userid+sql);    //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);   //普通用户：学生结果集

String sql1 = "select * from goods,carts where goods.gname=carts.gname and userid = '"+userid+"' group by ginfor order by COUNT(ginfor) desc limit 0,1";
Statement stmt1 = con.createStatement();
ResultSet rs1 = stmt1.executeQuery(sql1);

int result=0;
while(rs.next())                                     //循环查找普通用户：学生结果集
{
	username=rs.getString("username"); 
	usersex=rs.getString("usersex");
	userphone=rs.getString("userphone");
	userdormitory=rs.getString("userdormitory");
	usernumber=rs.getString("usernumber");
	userprofile=rs.getString("u_profile");
}
while(rs1.next())
{
	huaxiang = rs1.getString("ginfor");
}
stmt.close();
stmt1.close();
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
	<p ><img name="" src="<%=userprofile%>" width="81" height="81" alt="" style="margin-left:235px;"></p>
	<div style="margin-left:230px;">
	<form action="uploadimage.jsp" method="post" enctype="multipart/form-data" name="form1">
    <input type="file" name="file">
    <input type="submit" name="Submit" value="上传">
    </div>
    </center>
	<table width="90%" border="0" cellspacing="10" cellpadding="10">
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">昵称： </td>
	    <td ><label><%=username%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">性别：</td>
	    <td><label><%=usersex%></label>&nbsp;</td>
      </tr>
      <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">用户画像(主要购买类型)：</td>
	    <td><label style="color:#F00";><%=huaxiang%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">电 话： </td>
	    <td ><label><%=userphone%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td style="color:#000;font-weight:bold;font-size:16px;" align="right">楼 号： </td>
	    <td><label><%=userdormitory%></label>&nbsp;</td>
      </tr>
	  <tr>
	    <td align="right" style="color:#000;font-weight:bold;font-size:16px;">宿舍号： </td>
	    <td ><label><%=usernumber%></label>&nbsp;</td>
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
