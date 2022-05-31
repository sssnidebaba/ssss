<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员界面</title>
</head>
<body>
<%
String ownid=request.getParameter("ownid");
request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from shop_owners where ownid ='"+ownid+"'"; //sql语句，查找商家
String sql1="delete from carts where ownid='"+ownid+"'"; //sql语句，从购物车删除货物
String sql2="delete from goods where ownid='"+ownid+"'"; //sql语句，删除货物
String sql3="delete from shop_owners where ownid='"+ownid+"'"; //sql语句，删除货物
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
Statement stmt1 = con.createStatement();
Statement stmt2 = con.createStatement();
Statement stmt3 = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //管理员结果集
int result=0;
while(rs.next())                                     //循环查找管理员结果集
{
	result=1;
}
if(result==1){      //有该商家，删除所有信息
	stmt1.executeUpdate(sql1);
	stmt2.executeUpdate(sql2);
	stmt3.executeUpdate(sql3);	
	out.println("<script language='javaScript'> alert('已删除！');</script>");
	out.println("<script>window.top.location='admini.jsp'</script>");
}
else               //没有此商家
{
	out.println("<script language='javaScript'> alert('没有此商家，请与买家核对！');</script>");
	out.println("<script>window.top.location='admini.jsp'</script>");
}
stmt.close();
stmt1.close();
stmt2.close();
stmt3.close();
con.close();	
%>
<jsp:include page="foot.jsp" />
</body>
</html>