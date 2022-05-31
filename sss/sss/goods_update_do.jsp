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
response.setContentType("text/html;charset=utf-8"); 
String name = (String)session.getValue("sessionid"); //ownid
String gname=request.getParameter("gname");
String gprice=request.getParameter("gprice");
String gnum=request.getParameter("gnum");
String ginfor=request.getParameter("ginfor");
System.out.println(gname+gprice+gnum+ginfor);

	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update goods set gname='"+gname+"',gprice='"+gprice+"',gnum='"+gnum+"',ginfor='"+ginfor+"' where ownid='"+name+"' and gname='"+gname+"'"; //sql语句，更新用户信息
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
%>
</body>
</html>