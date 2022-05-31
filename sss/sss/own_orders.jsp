<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商家订单</title>
<link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
</head>
<body>
<center>
<%
String ownid = (String)session.getValue("sessionid");
request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from carts join goods on carts.gname=goods.gname join users on carts.userid=users.userid where carts.ownid='"+ownid+"'and paystate='1' and confirmstate='0'"; //sql语句，查找已支付未接单
System.out.println(ownid+sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stmt.executeQuery(sql);               //已支付商品结果集
rs.last();
int countall=rs.getRow();                          //得到总条数
rs.beforeFirst();
if(rs.next()&&countall!=0)                         //循环查找已支付未接单商品结果集
{    
	out.println("<table class='zong' >");
	out.println("<tr id='biaotou'>");
	out.println("<th class='text-center' width=180px; scope='col'>图片</th>");
	out.println("<th class='text-center' width=200px; scope='col'>商品名</th>");
	out.println("<th class='text-center' width=80px; scope='col'>价格</th>");
	out.println("<th class='text-center' width=80px; scope='col'>购买数量</th>");
	out.println("<th class='text-center' width=100px; scope='col'>支付状态</th>");
	out.println("<th class='text-center' width=120px; scope='col'>支付时间</th>");
	out.println("<th class='text-center' width=120px; scope='col'>送货地点</th>");
	out.println("<th class='text-center' width=140px; scope='col'>操作</th>");
	out.println("</tr>");
	do{
		out.println("<tr id='biaoge'><td><img class='picture' src= "+rs.getString("gpicture")+" /></td>");
		out.println("<td>"+rs.getString("gname")+"</td>");
		out.println("<td>"+"<span class='glyphicon-yen'></span>"+rs.getString("gprice")+'元'+"</td>");
		out.println("<td>"+rs.getString("buynum")+"</td>");
		out.println("<td>已支付</td>");
		out.println("<td>"+rs.getString("buytime")+"</td>");
		out.println("<td>"+rs.getString("userdormitory")+"栋"+rs.getString("usernumber")+"</td>");
		out.println("<td><p><a href=receive_do.jsp?gname="+rs.getString("gname")+"&userid="+rs.getString("userid")+">接收</a></p>");
		out.println("<p><a href=receive_nodo.jsp?gname="+rs.getString("gname")+"&userid="+rs.getString("userid")+">退单</a></p></td></tr>");
	}while(rs.next());
	out.println("</table>");
}
else
{
	out.println("<p>还没有订单，加油吧！！！</p>");
}
stmt.close();
con.close();	
%>
</center>
</body>
</html>