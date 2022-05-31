<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>商品管理</title>
<link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
</head>
<body>
<center>
 <% 
    request.setCharacterEncoding("utf-8");
    String str = (String)session.getValue("sessionid");
  %>
 <!--打印结果--> 
  <table class="zong">
    <tr id="biaotou">
    <th class="text-center" width=120px; scope="col">商家ID</th>
    <th class="text-center" width=180px; scope="col">图片</th>
    <th class="text-center" width=200px; scope="col">商品名</th>
    <th class="text-center" width=80px; scope="col">月售</th>
    <th class="text-center" width=120px; scope="col">商品类别</th>
  </tr>
 <!--设置显示页码-->
  <%
     int dipage=1;//当前页码数默认为1
     String pages=request.getParameter("dipage");
     if(pages==null){pages="1";}                
     try{
    	 dipage=Integer.parseInt(pages);
     }catch(Exception e){
    	 dipage=1;
     }
     System.out.println("当前页数pages:"+pages);
     System.out.println("当前页数dipage:"+dipage);
  %>
   <!--数据库连接及判断-->
<%
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
	String sql="select * from goods"; //sql语句，查找货物
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = stmt.executeQuery(sql);               //货物（按名查找）结果集
	//---------------------------------------------------
	rs.last();
	int countall=rs.getRow();
	rs.beforeFirst();
	System.out.println("按名查找总数："+countall);
	int onepage=5;                                       //一页5条
	int countPage=0;
	if(countall%onepage==0)       //0条记录
	{countPage=countall/onepage; //得到总页数(取整)
	System.out.println("按名得到总页数:"+countPage); }
	else                                     //不是0条记录
	{countPage=countall/onepage+1;
	System.out.println("按名得到总页数:"+countPage);}
	 if((dipage-1)*onepage==0) 
	    	rs.beforeFirst();   //把记录指针移至当前页第一条记录之前
	  else
	      rs.absolute((dipage-1)*onepage); 
    int i=0; int j=0;
	int result=0;
	if(rs.next()){                                      //按名结果集不为空
		do{
		out.println("<tr id='biaoge'><td><a href=goods.jsp?gname="+rs.getString("gname")+"&ownid="+rs.getString("ownid")+">");
		out.print(rs.getString("ownid")+"</td><td>"+"<img class='picture' src= "+rs.getString("gpicture")+" /></a></td><td>"+rs.getString("gname")+"</td><td>"
	    +rs.getString("gsold")+"</td><td>"+rs.getString("ginfor")+"</td>");
		
		i++;
		if(i>=onepage) break;//超过每页显示数量停止
		}
	   while(rs.next());                                     //循环查找货物结果集
	}
	if(result==0){
		out.print("<tr><td colspan=6 align=center>");
		out.print("共"+countall+"条记录,共"+countPage+"页,当前第"+dipage+"页,每页"+onepage+"条记录,");
		if(dipage==1);//当前是首页
		else{//当前不是首页
			out.print("<a href=admin_goods.jsp?dipage=1>首页</a>,");
			out.print("<a href=admin_goods.jsp?dipage="+(dipage-1)+">上一页</a>,");
		}
	    if(dipage==countPage); //当前页是末页
	    else{//当前页不是末页
	    	out.print("<a href=admin_goods.jsp?dipage="+(dipage+1)+">下一页</a>,");
	    	out.print("<a href=admin_goods.jsp?dipage="+countPage+">末页</a>");
	    }
	    out.print("</td></tr>");
	}
	stmt.close();//关闭数据库
	con.close();	
%>
</table>
</center>
</body>
</html>