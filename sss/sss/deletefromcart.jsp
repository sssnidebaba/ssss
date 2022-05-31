<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid");
String ownid=request.getParameter("ownid");
String gname=request.getParameter("gname");

System.out.println("用户名="+name+"商家="+ownid+"货物名="+gname);
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="delete from carts where userid='"+name+"'and ownid='"+ownid+"'and gname='"+gname+"'"; //sql语句，查找货物
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
int i=stmt.executeUpdate(sql);
if(i==1)
{out.println("<script language='javaScript'> alert('已移除,点击回到购物车。');</script>");
response.setHeader("refresh","0;url=shoppingcart.jsp");
}
else{
	out.println("<script language ='javaScript'> alert('移除失败,点击回到购物车。');</script>");
	//response.setHeader("refresh","0;url=user.jsp");
	response.setHeader("refresh","0;url=shoppingcart.jsp");
}
stmt.close();
con.close();
}
%>
</body>
</html>