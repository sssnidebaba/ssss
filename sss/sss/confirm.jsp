<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支付</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid");
String ownid=request.getParameter("ownid");
String gname=request.getParameter("gname");

System.out.println("用户名="+name+"商家="+ownid+"货物名="+gname);
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update carts set confirmstate=3 where userid='"+name+"'and ownid='"+ownid+"'and gname='"+gname+"'"; //sql语句，更新订单
String sql1="select * from goods where ownid='"+ownid+"'and gname='"+gname+"'";//sql语句，查找货物
String sql3="select * from carts where userid='"+name+"'and ownid='"+ownid+"'and gname='"+gname+"'";
System.out.println(sql+sql1);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
Statement stmt1 = con.createStatement();
Statement stmt2 = con.createStatement();
Statement stmt3 = con.createStatement();
ResultSet rs=stmt1.executeQuery(sql1);

int i=stmt.executeUpdate(sql);
if(i==1)
{    
	if(rs.next()){
		int gsoldnow=0; int gnumnow=0;int buynum=0;
		ResultSet rs3=stmt3.executeQuery(sql3);
		if(rs3.next()){
		buynum=rs3.getInt("buynum");
		}
		gsoldnow=rs.getInt("gsold")+buynum;  //月售加买的数量
		gnumnow=rs.getInt("gnum")-1;    //剩余数量减购买数量
		System.out.println(gsoldnow+gnumnow);
		String sql2="update goods set gsold='"+gsoldnow+"',gnum='"+gnumnow+"' where ownid='"+ownid+"'and gname='"+gname+"'";
	    stmt2.executeUpdate(sql2);
	}
 out.println("<script language='javaScript'> alert('收货成功。');</script>");
 //response.setHeader("refresh","0;url=user.jsp");
 out.println("<script>window.top.location='user.jsp'</script>");
}
else{
	out.println("<script language ='javaScript'> alert('收货失败,点击跳到您的主页。');</script>");
	//response.setHeader("refresh","0;url=user.jsp");
	out.println("<script>window.top.location='user.jsp'</script>");
}
stmt.close();
stmt1.close();
stmt2.close();
stmt3.close();
con.close();
}
%>
</body>
</html>