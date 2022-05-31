<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
</head>
<body>

<!--获取关键字id(普通用户:users和商家：shop_owners)-->
 <% request.setCharacterEncoding("utf-8");
    String id= request.getParameter("id");//得到id(登录界面的文本框内容)给id(String)
    String pwd=request.getParameter("pwd");//得到pwd(登录界面的文本框内容)给pwd(String)
    System.out.println(id+pwd);  
    session.setAttribute("sessionid",id);      //设置session-sessionid
    session.setAttribute("sessionpwd",pwd);      //设置session-sessionpwd
    
    if(id.equals("admini")&&pwd.equals("admini"))
    {  //管理员登录
    	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
       	java.util.Date currentTime = new java.util.Date();
       	String time = formatter.format(currentTime);     //得到登陆时间time
       	System.out.println(time);
       	session.setAttribute("sessionlogtime",time);     //设置session-sessionlogtime
       	
       	String ip = request.getRemoteAddr();       //得到ip地址
       	session.setAttribute("sessionip",ip);     //设置session-sessionip
       	
    	response.setHeader("Refresh","0;url=admini.jsp");
    }
    else{                                       //非管理员登录                         
	request.setCharacterEncoding("utf-8");  //数据库连接及判断
		Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
	String sql="select * from users where userid ='"+id+"'"; //sql语句，查找普通用户学生
	String sql1="select * from shop_owners where ownid ='"+id+"'";//sql语句，查找商家
	System.out.println(id+pwd+sql+sql1);                       //输出到控制台判断语句是否正确
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);               //普通用户：学生结果集
	ResultSet rs1 =stmt2.executeQuery(sql1);              //普通用户：商家结果集
	int result=0;
	while(rs.next())                                     //循环查找普通用户：学生结果集
	{
		String pw=rs.getString("userpwd").trim();       //从结果集中找到密码、去掉空格
		if(pw.equals(pwd))                              //密码正确
		{
			result=1;                                   //结果为1
		}
	}
	while(rs1.next())                                     //循环查找普通用户：商家结果集
	{
		String pw1=rs1.getString("ownpwd");                  //从结果集中找到密码
		if(pw1.equals(pwd))                              //密码正确
		{
			result=2;                                   //结果为2
		}
	}
	stmt.close();
	stmt2.close();
	con.close();	
	
if(result==1&&id!="admini")//结果导向
{   
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
   	java.util.Date currentTime = new java.util.Date();
   	String time = formatter.format(currentTime);     //得到登陆时间time
   	System.out.println(time);
   	session.setAttribute("sessionlogtime",time);     //设置session-sessionlogtime
   	
   	String ip = request.getRemoteAddr();       //得到ip地址
   	session.setAttribute("sessionip",ip);     //设置session-sessionip
   	
	response.setHeader("Refresh","0;url=user.jsp");
}
if(result==2&&id!="admini")
{
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
   	java.util.Date currentTime = new java.util.Date();
   	String time = formatter.format(currentTime);     //得到登陆时间time
   	System.out.println(time);
   	session.setAttribute("sessionlogtime",time);     //设置session-sessionlogtime
   	
   	String ip = request.getRemoteAddr();       //得到ip地址
   	session.setAttribute("sessionip",ip);     //设置session-sessionip
   	
	response.setHeader("Refresh","0;url=shop_owner.jsp");
}
if(result==0&&id!="admini")
{
	out.println("<script language='javaScript'> alert('用户名或密码错误！');</script>");
	response.setHeader("Refresh","0;url=login.jsp");
}
    }
%>
</body>
</html>