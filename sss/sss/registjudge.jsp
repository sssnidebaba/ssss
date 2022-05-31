<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册判断</title>
</head>
<body>
<!--获取普通用户注册页面内容-->
 <% request.setCharacterEncoding("utf-8");
    String id= request.getParameter("id");//得到id(注册界面的文本框内容)给id(String)
    String pwd= request.getParameter("pwd");//得到pwd(注册界面的文本框内容)给pwd(String)
    String sex= request.getParameter("sex");//得到sex(注册界面的文本框内容)给sex(String) 
    String name= request.getParameter("name");//得到name(注册界面的文本框内容)给name(String)
    String phone= request.getParameter("phone");//得到phone(注册界面的文本框内容)给phone(String)
    String dormitory= request.getParameter("dormitory");//得到dormitory(注册界面的文本框内容)给dormitory(String)
    String roomnumber= request.getParameter("roomnumber");//得到roomnumber(注册界面的文本框内容)给roomnumber(String)
  %>
 <!--数据库连接、判断及结果导向-->
<%                                       
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
	String sql="select * from users where userid ='"+id+"'"; //sql语句，查找普通用户学生
	System.out.println(sql);                       //输出到控制台判断数据库语句是否正确
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
	System.out.println(rs);
	int result=0;
	if(rs.next())                                     //循环查找普通用户：学生结果集
	{
			result=1;                                   //结果为1
	}                                                  
if(result==1)//普通用户：学生表中已存在
{   
	out.println("<script language='javaScript'> alert('该帐号已被注册，点击返回注册页面！');</script>");
	response.setHeader("Refresh","0;url=regist.jsp");
}
if(result==0)
{   
	String sql1="insert into users(userid,userpwd,usersex,username,userphone,userdormitory,usernumber,u_profile) values('"+id+"','"+pwd+"','"+sex+"','"+name+"','"+phone+"','"+dormitory+"','"+roomnumber+"','img/regist.jpg')";
	stmt.execute(sql1); //执行sql1语句，插入到users表
	out.println("<script language='javaScript'> alert('注册成功，点击登录！');window.top.location='login.jsp'</script>");
	//response.setHeader("Refresh","0;url=login.jsp");
}
stmt.close(); //关闭数据库连接
con.close();	
%>
<script>window.open("login.jsp")</script>
</body>
</html>