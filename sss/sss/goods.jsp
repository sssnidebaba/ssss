<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品</title>
<link rel="stylesheet" type="text/css" href="css/goodinfo.css" />
</head>
<body style="background:radial-gradient(rgb(227, 0, 0),#ff0000);">
<jsp:include page="head.jsp" />
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid");
String ownid=request.getParameter("ownid");
String gname=request.getParameter("gname");

System.out.println("商家="+ownid+"货物名="+gname);
    Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from goods where gname='"+gname+"'and ownid='"+ownid+"'"; //sql语句，查找货物
String sql1="select * from carts join  users on carts.userid=users.userid where gname='"+gname+"'and ownid='"+ownid+"'and carts.userid='"+name+"'"; //sql语句，查找该货物订单及用户表，用于找到评价级用户的信息    
Statement stmt = con.createStatement();
Statement stmt1 = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);               //货物结果集
ResultSet rs1 = stmt1.executeQuery(sql1);               //订单结果集
int result=0;
String img = null,gn = null,gp = null,gs = null,gl = null,gi = null,gnum=null;
while(rs.next())                                     //循环查找普通用户：学生结果集
{
	img = rs.getString("gpicture");
	gn = rs.getString("gname");
	gp = rs.getString("gprice");
	gs = rs.getString("gsold");
	gl = rs.getString("glike");
	gi = rs.getString("ginfor");
	gnum=rs.getString("gnum");
	//out.println(rs.getString("gpicture")+" == "+rs.getString("gname")+" == "+" == "+rs.getString("gprice")+" == "+rs.getString("gsold")+" == "+rs.getString("glike")+" == "+rs.getString("ginfor")+" == ");
}
//out.println("<tr><td colspan='3'><a href=addtocart.jsp?gname="+gname+"&ownid="+ownid+">加入购物车</a></td><td colspan='3'><a href=pay.jsp?gname="+gname+"&ownid="+ownid+">立即支付</a></td></tr>");	
%>
  <center><table width="68%" border="0" align="center" style="margin-top:63px">
  <tr>
    <td width="29%" valign="top" bgcolor="#6495ED"><div class="good">
    <%
    	out.println("<img style='background-color:white;' src='" + img + "' alt='' width='100%' height='99%' />");
     %>
    <div style="text-align:start;background-color:#6495ED;">
    <ul class="simpleul">
    	
            </ul>
    </div>
    </div></td>
    <td width="71%" style="text-indent:30px;">
    <h1 class="yangshi"><%out.println(gn); %> </h1>
    <h3 class="yangshi2">￥<%out.println(gp); %></h3>
    <h3 class="yangshi3">商品类别：<%out.println(gi); %></h3>
    <h3 class="yangshi3">商品剩余：<%out.println(gnum); %></h3>
    <h3 class="yangshi3" style="margin-bottom:35px;"> 月销量：<%out.println( gs); %></h3>
    
    <p ><%out.println("<a class='button' href=addtocart.jsp?gname="+gname+"&ownid="+ownid+">加入购物车</a><a class='button' href=pay.jsp?gname="+gname+"&ownid="+ownid+">立即支付</a>");	 %>	
</td>
  </tr>
  
  
  
</table>
</center>

<br><br><br><br><br><br><br><br><br><br><br><br>

<jsp:include page="foot.jsp" />

</body>
</html>

