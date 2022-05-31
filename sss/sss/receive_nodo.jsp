<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>拒绝订单</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid"); //商家id
String userid=request.getParameter("userid"); //用户id
String gname=request.getParameter("gname");

System.out.println("商家名="+name+"买主="+userid+"货物名="+gname);
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update carts set paystate=0 where userid='"+userid+"'and ownid='"+name+"'and gname='"+gname+"'"; //sql语句，查找货物
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
int i=stmt.executeUpdate(sql);
if(i==1)
{out.println("<script language='javaScript'> alert('已拒绝,点击跳到您的主页。');</script>");
response.setHeader("refresh","0;url=shop_owner.jsp");
}
else{
	out.println("<script language ='javaScript'> alert('拒绝失败,点击跳到您的主页。');</script>");
	response.setHeader("refresh","0;url=shop_owner.jsp");
}
stmt.close();
con.close();
}
%>
<script type="text/javascript">window.top.location="shop_owner.jsp"</script>
</body>
</html>