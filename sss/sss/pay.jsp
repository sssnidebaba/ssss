<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>支付</title>
<link rel="stylesheet" type="text/css" href="css/pay.css">
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String name = (String)session.getValue("sessionid");
String ownid=request.getParameter("ownid");
String gname=request.getParameter("gname");
String buynum=request.getParameter("buynum");
double all=0.0;

	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");

if(buynum==null){//立即支付不乱码  插入购物车
	buynum="1";          //默认为1         

 int paystate=0; int confirmstate=0;
String comment="未评论";
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
java.util.Date currentTime = new java.util.Date();
String time = formatter.format(currentTime); //获取加入购物车时间
String sql="select * from carts where ownid='"+ownid+"'and gname='"+gname+"'and userid='"+name+"'"; //sql语句，查找购物车中该物品
String sql1="insert into carts values('"+name+"','"+ownid+"','"+gname+"','"+buynum+"','"+paystate+"','"+confirmstate+"','"+comment+"','"+time+"')"; //sql语句，查找货物
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
}
else                                              //商品在购物车中
{
	out.println("<script language = 'javaScript'> alert('已在购物车,查找其他物品吧！');</script>");
	out.println("<script>window.top.location='index.jsp'</script>");
}
}

String sql="select * from carts join goods on carts.gname=goods.gname where userid='"+name+"'and goods.ownid='"+ownid+"'and goods.gname='"+gname+"'"; //sql语句，查找单价
System.out.println(sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
if(rs.next()){
String price=null;
price=rs.getString("gprice");
double aa=Double.parseDouble(price);
double num = Double.parseDouble(buynum);//强制装换为double
if(num==0.0)num=1.0;
all=aa*num;
}
con.close();
%>

<table width="800px" height="400px" border="0" bordercolor="#FF9900" align="center">
<tr>
<td width=280px; height=20px; style="font-size:14px; color:#FF9900;">
</td>
</tr>
<tr>
<td width=280px; height=3px;>
<hr style="height:1px;border:none;border-top:1px solid #FFCC33;">
</td>
<td width=280px; height=3px;><hr style="height:1px;border:none;border-top:1px solid #FFCC33;"></td>
</tr>



<td height=400px; width=200px>
<img alt="支付" src="img/zhifubao.jpg" style="height:400px;width:300px">
</td>
</table>
<%
//gname = new String(gname.getBytes("ISO-8859-1"), "UTF-8");
if(name==null){
out.println("<script language='javaScript'> alert('请先登录！');</script>");
response.setHeader("Refresh","0;url=login.jsp");
}
else{
	out.println("<center><a id='search_button' href=pay_do.jsp?gname="+gname+"&userid="+name+"&buynum="+buynum+"&ownid="+ownid+">已支付</a></center>");
}
%>
</body>
</html>