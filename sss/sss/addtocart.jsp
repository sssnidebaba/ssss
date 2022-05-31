<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品</title>
</head>
<body style="background:radial-gradient(rgb(241, 0, 0),#ff0000);">
<jsp:include page="head.jsp" />
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid");//当前登录id
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
String ownid=request.getParameter("ownid"); //获取商家id
String gname=request.getParameter("gname"); //获取货物名称
int buynum=1; int paystate=0; int confirmstate=0;
String comment="未评论";

System.out.println("商家="+ownid+"货物名="+gname);
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
java.util.Date currentTime = new java.util.Date();
String time = formatter.format(currentTime); //获取加入购物车时间
System.out.println(time);
Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from carts where ownid='"+ownid+"'and gname='"+gname+"'and userid='"+name+"'"; //sql语句，查找购物车中该物品
String sql1="insert into carts values('"+name+"','"+ownid+"','"+gname+"','"+buynum+"','"+paystate+"','"+confirmstate+"','"+comment+"','"+time+"')"; //sql语句，查找货物
System.out.println("查找语句："+sql+"插入语句"+sql1);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
Statement stmt1 = con.createStatement();
int result=0;
while(rs.next())                                     //商品已经在购物车中
{
 result=1;                                         //1表示存在
}
//判断结果，结果导向
if(result==0){                                     //商品不存在购物车中
	int i = stmt1.executeUpdate(sql1);              //sql1语句运行,插入
	out.println("<script language = 'javaScript'> alert('购买成功,点击前往购物车!');</script>");
	//response.setHeader("refresh","0;url=shoppingcart.jsp");
	out.println("<script>window.top.location='user.jsp?name=cart'</script>");
}
else                                              //商品在购物车中
{
	out.println("<script language = 'javaScript'> alert('请勿重复购买,查找其他物品吧！');</script>");
	//response.setHeader("refresh","0;url=index.jsp");
	out.println("<script>window.top.location='index.jsp'</script>");
}
stmt1.close();
stmt.close();
con.close();
}
%>
</body>
</html>