<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>更新商品信息</title>
<link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
</head>
<body>
<center>
<table class="zong">
    <tr id="biaotou">
    <th class="text-center" width=180px; scope="col">图片</th>
    <th class="text-center" width=200px; scope="col">商品名</th>
    <th class="text-center" width=80px; scope="col">价格</th>
    <th class="text-center" width=120px; scope="col">商品类别</th>
  </tr>
<%
request.setCharacterEncoding("utf-8");
String ownid=request.getParameter("ownid");
String gname=request.getParameter("gname");

System.out.println("商家="+ownid+"货物名="+gname);
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from goods where gname='"+gname+"'and ownid='"+ownid+"'"; //sql语句，查找货物
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
int result=0;
while(rs.next())                                     //循环查找普通用户：学生结果集
{
	out.println("<tr>");
	out.println("<td><img style='height:150px;width:150px;' src= "+rs.getString("gpicture")+" /></td>");
	out.println("<td>"+rs.getString("gname")+"</td>");
	out.println("<td>"+"<span class='glyphicon-yen'></span>"+rs.getString("gprice")+'元'+"</td>");
	out.println("<td>"+rs.getString("ginfor")+"</td></tr>");
}
%>

</table>
</center>
    <form method="post" action="goods_update_do.jsp">
			<table align="center" border="0" cellpadding="8px" width="450px">
				<tr>
				<% 
				out.println("<td width='25%'><label>商品名称：</label></td>");
				out.println("<td><label>"+gname+"</label></td>");
				out.println("<td><input type='hidden' name='gname' value='"+gname+"'/></td>");
				%>
				</tr>
				<tr>
					<td><label>商品类别：</label></td>
					<td><select name="ginfor">
			            <option value="PS4">外国理论</option>
						<option value="PS5">国内理论</option>
						<option value="XBOX">实践指南</option>
						<option value="Switch">入门</option>
					</select></td>
				</tr>
				<tr>
					<td><label>价格：</label></td>
					<td>￥<input class="price" name="gprice" type="text"/>元</td>
				</tr>
				<tr>
					<td><label>数量：</label></td>
					<td><input class="price" name="gnum" type="text"/>个</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><button class="button green" type="submit">修改</button></td>
				</tr>
			</table>
		</form>
  </body>
<%
stmt.close();
con.close();	
%>
</html>