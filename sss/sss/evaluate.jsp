<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid");
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
String ownid=request.getParameter("ownid");
String gname=request.getParameter("gn");
System.out.println(gname);
String comment=request.getParameter("textarea");
System.out.println("商家="+ownid+"货物名="+gname);
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update carts set comment='"+comment+"' where gname='"+gname+"'and ownid='"+ownid+"'and userid='"+name+"'"; //sql语句，插入评论
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
int i = stmt.executeUpdate(sql);              //sql1语句运行,插入
if(i==1){
out.println("<script language = 'javaScript'> alert('评论成功,点击前往历史订单!');</script>");
//response.setHeader("refresh","0;url=history.jsp");
out.println("<script>window.top.location='user.jsp?name=hist'</script>");
}
else{

	out.println("<script language = 'javaScript'> alert('未购买此商品，无法评论!');</script>");
	//response.setHeader("refresh","0;url=history.jsp");
	//out.println("<script>document.</script>")
	out.println("<script>window.top.location='user.jsp?name=hist'</script>");
}
}
%>

</body>
</html>