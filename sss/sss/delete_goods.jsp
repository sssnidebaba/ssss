<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>删除商品</title>
</head>
<body>
<%
String ownid= (String)session.getValue("sessionid");
String gname=request.getParameter("gname");

System.out.println("商家="+ownid+"货物名="+gname);
request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="delete from carts where gname='"+gname+"'and ownid='"+ownid+"'"; //sql语句，从购物车删除货物
String sql1="delete from goods where gname='"+gname+"'and ownid='"+ownid+"'"; //sql语句，删除货物
System.out.println(sql+sql1);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
Statement stmt1 = con.createStatement();
int result=stmt.executeUpdate(sql);
int result1=stmt1.executeUpdate(sql1);
out.println("<script language='javaScript'> alert('删除成功！');</script>");
//response.setHeader("Refresh","0;url=user.jsp");
out.println("<script>window.location='allgoods.jsp'</script>");
stmt.close();
con.close();	
%>
</body>
</html>