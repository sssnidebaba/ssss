<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>华工书店</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<script type="text/javascript" src="js/demo.js"></script>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>
  </head>
  <body onLoad="load()" style="margin-top: 0px;margin-bottom:0px;background-color:#6495ed;">
  <header style="height:30px;margin-top:0px;padding-top:0px;">
  		<ul style="list-style-type:none;z-index: 100;position: relative;">
 <%                                          //获取用户姓名
	request.setCharacterEncoding("utf-8");
    String str = (String)session.getValue("sessionid");
    String pwd = (String)session.getValue("sessionpwd");
    String name=null;
    System.out.println(str);
    int result=0;                                            //结果的导向
if(str==null){                                         //用户id为空,没有登录
    out.print("<li><a href='javascript:;' onclick='showRegist()' style='display:inline;float:right; text-decoration:none;height:32px;color:black;'>注册</a></li>");
    out.print("<li><a href='login.jsp' style='display:inline;float:right;text-decoration:none;height:32px;color:black'>登录|</a></li>");
    }
else if(str.equals("admini")){                               //管理员登录
	if(pwd.equals("admini"))
	{
		out.print("<li><a style='display:inline;float:right;text-decoration:none;color:rgb(0, 0, 0)' href='clear.jsp'>[退出]</a>");
		out.print("<li><a style='display:inline;float:right;text-decoration:none;' href='admini.jsp'>");
		out.print("管理员");
		%>
		<%
		result=3;
		out.print("，欢迎您</a>");
	}
	else
	{
		out.print("<li><a href='javascript:;' onclick='showRegist()' style='display:inline;float:right; text-decoration:none;height:32px;color:black;'>注册</a></li>");
	    out.print("<li><a href='login.jsp' style='display:inline;float:right;text-decoration:none;height:32px;color:black'>登录|</a></li>");
	}
}
else{                                                  //连接数据库
		Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
	String sql="select * from users where userid ='"+str+"'"; //sql语句，查找读者号
	String sql1="select * from shop_owners where ownid ='"+str+"'";//sql语句，查找管理员
	System.out.println(str+sql+sql1);                       //输出到控制台判断语句是否正确
	Statement stmt = con.createStatement();
	Statement stmt2 = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);               //用户结果集
	ResultSet rs1 =stmt2.executeQuery(sql1);              //商家结果集
	
	while(rs.next())                                     //循环查找普通用户：学生结果集
	{
		String userid=rs.getString("userid");                  //从结果集中找到学号
		String userpwd=rs.getString("userpwd");                //从结果集中找到学生密码
		name=rs.getString("username");
		if(str.equals(userid)&&pwd.equals(userpwd))                              //密码正确
		{
			result=1;                                   //结果为1
		}
	}
	while(rs1.next())                                     //循环查找普通用户：店家结果集
	{
		String ownid=rs1.getString("ownid");                  //从结果集中找到用户名
		String ownpwd=rs1.getString("ownpwd");                //从结果集中找到商家密码
		name=rs1.getString("ownname");
		if(str.equals(ownid)&&pwd.equals(ownpwd))                              //密码正确
		{
			result=2;                                   //结果为2
		}
	}
	
if(result==1)                                          //是学生用户
{
	out.print("<li><a style='display:inline;float:right;text-decoration:none;color:rgb(0, 0, 0)' href='clear.jsp'>[退出]</a>");
	out.print("<li><a style='display:inline;float:right;text-decoration:none;' href='user.jsp'>");
	out.print(name);
	%>
	<%
	out.print("，欢迎您</a>");
	stmt.close();
	stmt2.close();
	con.close();	
}
if(result==2)                                          //是商家用户
{
	out.print("<li><a style='display:inline;float:right;text-decoration:none;color:rgb(0, 0, 0)' href='clear.jsp'>[退出]</a>");
	out.print("<li><a style='display:inline;float:right;text-decoration:none;' href='shop_owner.jsp'>");
	out.print(name);
	%>
	<%
	out.print("，欢迎您</a>");
}
}
%>	

        </ul>
  </header>
  	<!--
    <ul class="navigation" style="background-color: #FFFF66;height: 50px;font-size: 36px;text-align: left;list-style-type: none;margin-top:0px;margin-bottom:0px;display:block;">
    	<li><img alt="logo" src="img/logo1.png" style="float:left;height:49px;width:92px;"></li>
    	<li class="list_item" style="margin-left:40px">
    	 &nbsp;<a href="index.jsp" style="text-decoration: none;color:#FF6600;">主页</a> 
   	  </li>
      <li class="list_item">
      <%--if(result==1)
    	  out.print("&nbsp;<a href='user.jsp' style='text-decoration: none;color:#FF6600;'>个人中心</a>"); 
      else if(result==2)
    	  out.print("&nbsp;<a href='shop_owner.jsp' style='text-decoration: none;color:#FF6600;'>个人中心</a>"); 
      else
    	  out.print("&nbsp;<a href='index.jsp' style='text-decoration: none;color:#FF6600;'>个人中心</a>"); 
        --%>
        </li>
        <li class="list_item">
        &nbsp;<a href="help.jsp" style="text-decoration: none;color:#FF6600;">帮助</a> 
        </li>
      <li class="list_item">
        <a href="tencent://message/?uin=1747897282&Site=&Menu=yes" style="text-decoration: none;color:#FF6600;">联系我们</a> 
        </li>
    </ul> 导航栏结束 -->
    
    <!--头部菜单-->
<div class="top">
    <div class="w t_cen">
        <div class="t_c_lr t_c_left"></div>
        <div class="t_c_cen">
            <div class="t_c_top">
            </div>
            <div class="t_c_bottom">
                <ul>
                    <li>
                        <a href="index.jsp"style="text-decoration: none;"><em>&nbsp;&nbsp;首&nbsp;&nbsp;页</em></a>
                    </li>
                    <li>
                    <%if(result==1)
    	  				out.print("<a href='user.jsp'style='text-decoration: none;'><em>个人中心</em></a>"); 
      				else if(result==2)
    	  				out.print("<a href='shop_owner.jsp'style='text-decoration: none;'><em>个人中心</em></a>"); 
      				else if(result==3)
      					out.print("<a href='admini.jsp'style='text-decoration: none;'><em>个人中心</em></a>");
      				else
    	  				out.print("<a href='index.jsp'style='text-decoration: none;'><em>个人中心</em></a>"); 
        			%>
                    </li>
                    
                    <li>
                        <a href="tencent://message/?uin=1747897282&Site=&Menu=yes" style="text-decoration: none;color:#FF6600;"><em>联系我们</em></a>
                    </li>
                    
                </ul>
                <div class="thisMenu" id="thisMenu"></div>
            </div>
        </div>
        <div class="t_c_lr t_c_right"></div>
    </div>
</div>
<!--/头部菜单-->

<!--引用JQuery-->
<script type="text/javascript" src="js/jquery.js"></script>
<!--其他样式-->
<script type="text/javascript" src="js/Other.js"></script>
  </body>
</html>
