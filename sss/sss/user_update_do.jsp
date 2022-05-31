<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户页面</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String userid = (String)session.getValue("sessionid");
String username=request.getParameter("username"); 
String usersex=request.getParameter("usersex"); 
String userphone=request.getParameter("userphone"); 
String userdormitory=request.getParameter("userdormitory"); 
String usernumber=request.getParameter("usernumber"); 
//System.out.println("用户id="+userid+"用户名="+username+"用户性别="+usersex+"宿舍="+userdormitory+"宿舍号="+usernumber);
if(userid==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update users set username='"+username+"',usersex='"+usersex+"',userphone='"+userphone+"',userdormitory='"+userdormitory+"',usernumber='"+usernumber+"' where userid='"+userid+"'"; //sql语句，更新用户信息
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
int i=stmt.executeUpdate(sql);
if(i==1)
{	out.println("<script language='javaScript'> alert('更新成功,点击跳到您的主页。');</script>");
	out.println("<script>window.top.location='user.jsp'</script>");
}
else{
	out.println("<script language ='javaScript'> alert('更新失败,点击跳到您的主页。');</script>");
	out.println("<script>window.top.location='user.jsp'</script>");
}
stmt.close();
con.close();
}
%>
</body>
</html>