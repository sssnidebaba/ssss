<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'info.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <style type="text/css">
  .cen {
	text-align: center;
}
  </style>
  </head>
  <body style="overflow:hidden;">
  <%
String userid = (String)session.getValue("sessionid");
System.out.println(userid);
request.setCharacterEncoding("utf-8");
	  Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from carts where userid ='"+userid+"' and comment!='未评论'"; //sql语句，查找该用户的购物车
System.out.println(userid+sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stmt.executeQuery(sql);               //购物车结果集
rs.last();
int countall=rs.getRow();                          //得到总条数
rs.beforeFirst();
if(rs.next())                                     //用户购买物品？
{                                                   
	if(countall!=0){                                        //有评论的物品
	out.println("<table width='90%' border='0' cellspacing='10' cellpadding='10'>");
	out.println("<th class='text-center' scope='col'>商品名</th>");
	out.println("<th class='text-center' scope='col'>评论</th>");
	do{                                                  //购买物品且评论  
	     out.println("<tr>");
	     out.println("<td align='center'>"+rs.getString("gname")+"</td>");
	     out.println("<td align='center'><label>"+rs.getString("comment")+"</label>&nbsp;</td>");
         out.println("</tr>");
	}while(rs.next());
	out.println("</table>");
	out.println("<p>&nbsp;</p>");
	}
	else{
		out.println("<p>您还没有评论过！！！</p>");
	}
}
else//未购买过物品
{
	out.println("<center><p>您还没有购买过物品！！！</p></center>");
}
stmt.close();
con.close();	
%>
  </body>
</html>
