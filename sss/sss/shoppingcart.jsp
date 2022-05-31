<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/carts.css">
</head>
<body >
<center>
  <table class="zong">
    <tr id="biaotou">
        <!--  表头单元格 - 包含表头信息（由 th 元素创建），标准单元格 - 包含数据（由 td 元素创建）。th 元素内部的文本通常会呈现为居中的粗体文本，而 td 元素内的文本通常是左对齐的普通文本。 -->
    <th width=180px; scope="col">图片</th>
    <th width=200px; scope="col">商品名</th>
    
    <th width=80px; scope="col">月售</th>
    <th width=120px; scope="col">加入时间</th>
    <th width=80px; scope="col">点赞</th>
    <th width=240px; scope="col">单价&nbsp;&nbsp;购买数量&nbsp;</th>
    <th width=80px; scope="col">支付状态</th>
    <th width=80px; scope="col">操作</th>
  </tr>
 
<%
String userid = (String)session.getValue("sessionid");
request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from carts join goods on carts.gname=goods.gname where userid='"+userid+"'and paystate='0'"; //sql语句，查找普通用户学生
System.out.println(userid+sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
while(rs.next())                                     //循环查找普通用户：学生结果集
{   
	out.println("<form action='pay.jsp' method='post'>");
	out.println("<tr id='biaoge'><td><img class='picture' src= "+rs.getString("gpicture")+" /></td>");
	out.println("<td>"+rs.getString("gname")+"</td>");
	out.println("<td>"+rs.getString("gsold")+"</td>");
	out.println("<td>"+rs.getString("buytime")+"</td>");
	out.println("<td>"+rs.getString("glike")+"</td>");
	out.println("<td>");
	out.println("<section class='cartMain'>");
	out.println("<ul class='order_lists'>");
	out.println("<li class='list_price'>");
	out.println("<p class='price'>"+"<span class='glyphicon-yen'></span>"+rs.getString("gprice")+'元'+"</p>");
    out.println("</li>");
    out.println("<li class='list_amount'>");
    out.println(" <div class='amount_box'>");
    out.println("<a href='javascript:;' class='reduce reSty'>-</a>");
    out.println("<input name='buynum' type='text' value='1' class='sum'>");
    out.println("<a href='javascript:;' class='plus'>+</a>");
    out.println("</div>");
    out.println(" </li>");
    out.println("</ul>");
    out.println("</td>");
	out.println("<td>未支付</td>");
	out.println("<input type='hidden'name='gname' value='"+rs.getString("gname")+"'></input>");
	out.println("<input type='hidden'name='userid' value='"+rs.getString("userid")+"'></input>");
	out.println("<input type='hidden'name='ownid' value='"+rs.getString("ownid")+"'></input>");
	out.println("<td ><button type='submit'>去支付</button>");
	out.println("</form>");
	out.println("<p><a  href=deletefromcart.jsp?gname="+rs.getString("gname")+"&userid="+rs.getString("userid")+"&ownid="+rs.getString("ownid")+"><button>移除</button></a></p></td></tr>");
	
} 
stmt.close();
con.close();	
%>
</table>
</center>
<script src="js/jquery.min.js"></script>
<script src="js/carts.js"></script>
</body>
</html>