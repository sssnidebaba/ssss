<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>接单</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid"); //商家id
String userid=request.getParameter("userid"); //用户id
String gname=request.getParameter("gname");

System.out.println("商家名="+name+"买主="+userid+"货物名="+gname);
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
java.util.Date currentTime = new java.util.Date();
String time = formatter.format(currentTime); //获取接单时间
System.out.println(time);
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
//response.setHeader("Refresh","0;url=login.jsp");
out.println("<script>window.top.location='login.jsp'</script>");
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update carts set confirmstate=1,buytime='"+time+"' where userid='"+userid+"'and ownid='"+name+"'and gname='"+gname+"'"; //sql语句，查找货物
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
int i=stmt.executeUpdate(sql);
if(i==1)
{out.println("<script language='javaScript'> alert('接收成功。');</script>");
response.setHeader("refresh","0;url=own_orders.jsp");
//out.println("<script>window.top.location='shop_owner.jsp'</script>");
}
else{
	out.println("<script language ='javaScript'> alert('接收失败,点击跳到您的主页。');</script>");
	//response.setHeader("refresh","0;url=shop_owner.jsp");
	out.println("<script>window.top.location='shop_owner.jsp'</script>");
}
stmt.close();
con.close();
}
%>
</body>
</html>