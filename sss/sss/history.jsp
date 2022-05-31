<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物历史</title>
<link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
</head>
<body>
<center>
  <table class="zong">
    <tr id="biaotou">
    <th class="text-center" width=180px; scope="col">图片</th>
    <th class="text-center" width=200px; scope="col">商品名</th>
    <th class="text-center" width=120px; scope="col">价格</th>
    <th class="text-center" width=80px; scope="col">月售</th>
    <th class="text-center" width=80px; scope="col">购买时间</th>
    <th class="text-center" width=100px; scope="col">商品类别</th>
    <th class="text-center" width=100px; scope="col">评价</th>
  </tr>
<%
String userid = (String)session.getValue("sessionid");
request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from carts join goods on carts.gname=goods.gname where userid='"+userid+"'and paystate='1' and confirmstate='3'"; //sql语句，查找普通用户学生
System.out.println(userid+sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
int result=0;
while(rs.next())                                     //循环查找普通用户：学生结果集
{  
	System.out.println(rs.getString("comment"));
	String comment=rs.getString("comment");
	if(comment.equals("未评论")){   //未评论
	out.println("<tr id='biaoge'><td><img class='picture' src= "+rs.getString("gpicture")+" /></td><td>"+rs.getString("gname")+"</td><td>"+"<span class='glyphicon-yen'></span>"+rs.getString("gprice")+'元'+"</td><td>"+rs.getString("gsold")+"</td><td>"+rs.getString("buytime")+"</td><td>"+rs.getString("ginfor")+"</td><td><a target='_blank' href='goods.jsp?ownid="+rs.getString("ownid")+"&gname="+rs.getString("gname")+"'>去评价</a></td></tr>");
	}
	else
	{
    out.println("<tr id='biaoge'><td><img class='picture' src= "+rs.getString("gpicture")+" /></td><td>"+rs.getString("gname")+"</td><td>"+"<span class='glyphicon-yen'></span>"+rs.getString("gprice")+'元'+"</td><td>"+rs.getString("gsold")+"</td><td>"+rs.getString("buytime")+"</td><td>"+rs.getString("ginfor")+"</td><td>已评价</td></tr>");
	}
}
stmt.close();
con.close();	
%>
</table>
</center>
</body>
</html>