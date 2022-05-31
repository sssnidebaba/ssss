<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商家页面</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String ownid = (String)session.getValue("sessionid");
String ownname=request.getParameter("ownname"); 
String ownsex=request.getParameter("ownsex"); 
String ownphone=request.getParameter("ownphone"); 
String owndormitory=request.getParameter("owndormitory"); 
String ownnumber=request.getParameter("ownnumber"); 
System.out.println("用户id="+ownid+"用户名="+ownname+"用户性别="+ownsex+"宿舍="+owndormitory+"宿舍号="+ownnumber);
if(ownid==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update shop_owners set ownname='"+ownname+"',ownsex='"+ownsex+"',ownphone='"+ownphone+"',owndormitory='"+owndormitory+"',ownnumber='"+ownnumber+"' where ownid='"+ownid+"'"; //sql语句，更新用户信息
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
int i=stmt.executeUpdate(sql);
if(i==1)
{out.println("<script language='javaScript'> alert('更新成功,点击跳到您的主页。');</script>");
//response.setHeader("refresh","0;url=user.jsp");
 out.println("<script>window.top.location='shop_owner.jsp'</script>");
}
else{
	out.println("<script language ='javaScript'> alert('更新失败,点击跳到您的主页。');</script>");
	out.println("<script>window.top.location='shop_owner.jsp'</script>");
}
stmt.close();
con.close();
}
%>
</body>
</html>