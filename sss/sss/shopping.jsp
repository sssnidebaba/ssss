<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="css/shopping.css" rel="stylesheet">
<title>搜索结果</title>
</head>
<body  style="background:radial-gradient(rgb(255, 0, 0),#ff0000);">
<jsp:include page="head.jsp" />
<br><br>
<link href="css/bootstrap.css" rel="stylesheet">
<!--获取关键字search_text-->
 <% 
    request.setCharacterEncoding("utf-8");
    String gname= request.getParameter("search_text");//得到search_text(搜索框内容)给gname(String)
    System.out.println("商品:"+gname);
  %>
 <!--打印结果--> 
 <div width="100%"; height="80px">
 <p>&nbsp;</p>
 
 </div>
  <div style="width:1000px;margin-left: auto;margin-right: auto;text-align: center;"><!--<table class="zhengti"  class="text-center"  >
    <tr align="center" class="stroke">
    <th width=250px; scope="col" class="text-center">图片</th>
    <th   width=200px; scope="col" class="text-center">商品名</th>
    <th  width=80px; scope="col" class="text-center" >价格</th>
    <th   width=80px; scope="col" class="text-center">月售</th>
    <th  width=80px; scope="col" class="text-center">点赞</th>
    <th  width=160px; scope="col" class="text-center">商品类别</th>
    <th  width=160px;  scope="col" class="text-center">卖家姓名</th>
  </tr>-->
  
 <!--设置显示页码-->
  <%
     //按商品名
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
     //按楼号
     int dipage1=1;//当前页码数默认为1
     String pages1=request.getParameter("dipage1");
     if(pages1==null){pages1="1";}
     try{
    	 dipage1=Integer.parseInt(pages1);
     }catch(Exception e){
    	 dipage1=1;
     }
     System.out.println("当前页数pages1:"+pages1);
     System.out.println("当前页数dipage1:"+dipage1);
  %>
   <!--数据库连接及判断-->
<%
	Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
	String sql="select * from goods join shop_owners on goods.ownid=shop_owners.ownid where gname like'%"+gname+"%'"; //sql语句，查找货物
	Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = stmt.executeQuery(sql);               //货物（按名查找）结果集
	//-------------------------------------------------
	String sql1="select * from goods join shop_owners on goods.ownid=shop_owners.ownid where shop_owners.owndormitory='"+gname+"'"; //sql语句，按楼号查找货物
	Statement stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs1 = stmt1.executeQuery(sql1);            //货物（按楼号查找）结果集     
	//---------------------------------------------------
	rs.last();
	int countall=rs.getRow();
	rs.beforeFirst();
	System.out.println("按名查找总数："+countall);
	int onepage=8;                                       //一页5条
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
//----------------------------------------------------	
    rs1.last();
	int countall1=rs1.getRow();
	rs1.beforeFirst();
	System.out.println("按楼号查找总数："+countall1);
     int onepage1=8;                                       //一页5条
     int countPage1=0;
	 if(countall1%onepage1==0)       //0条记录
		{countPage1=countall1/onepage1; //得到总页数(取整)
		System.out.println("按楼号得到总页数:"+countPage1); }
		else                                     //不是0条记录
		{countPage1=countall1/onepage1+1;
		System.out.println("按楼号得到总页数:"+countPage1);}
		 if((dipage1-1)*onepage1==0) 
		    	rs1.beforeFirst();   //把记录指针移至当前页第一条记录之前
		  else
		      rs1.absolute((dipage1-1)*onepage1); 
//-----------------------------------------------------------	
    int i=0; int j=0;
	int result=0;
	if(rs.next()){                                      //按名结果集不为空
		do{
			out.println("<div id='search_result'>"+
							"<a href=goods.jsp?gname="+rs.getString("gname")+"&ownid="+rs.getString("ownid")+" ><img src='" + rs.getString("gpicture") + "' width='220' height='220' /></a>" + 
							"<div style='background-color:#888'>" + 
								"<div id='price'>￥" + rs.getString("gprice") + "</div>" +
								"<div id='sell'>月销量：" + rs.getString("gsold") + "<br />点赞：" + rs.getString("glike") + "</div>" +
								"<div id='name'>" + rs.getString("gname") + "<br>" + rs.getString("ginfor") + "</div>" + 
							"</div>" +
						"</div>");		i++;
		if(i>=onepage) break;//超过每页显示数量停止
		}
	   while(rs.next());                                     //循环查找货物结果集
	}
	else if(rs1.next()){                                      //按楼号结果集不为空
		result=1;
		do{
			out.println("<div id='search_result'>"+
							"<a href=goods.jsp?gname="+rs1.getString("gname")+"&ownid="+rs1.getString("ownid")+" ><img src='" + rs1.getString("gpicture") + "' width='220' height='220' /></a>" + 
								"<div style='background-color:#888'>" + 
									"<div id='price'>￥" + rs1.getString("gprice") + "</div>" +
									"<div id='sell'>月销量：" + rs1.getString("gsold") + "<br />点赞：" + rs1.getString("glike") + "</div>" +
									"<div id='name'>" + rs1.getString("gname") + "</div>" + 
									"<div id='zhonglei'>"+ rs1.getString("ginfor") +"</div>"+
								"</div>" +
						"</div>");
			j++;
			if(j>=onepage1) break;//超过每页显示数量停止  
		}
	   while(rs1.next());                                     //循环查找货物结果集
	}
	else                                                  //结果集为空，无此商品
	{
		out.print("<script>alert('没有此商品，点击返回重新搜索。')</script>");
		response.setHeader("refresh", "0;url=index.jsp");
	}
	out.print("<div style='clear:left'></div>");
	if(result==0){
		//out.print("<tr><td colspan=6 align=center>");
		out.print("共"+countall+"条记录,共"+countPage+"页,当前第"+dipage+"页,每页"+onepage+"条记录,");
		if(dipage==1);//当前是首页
		else{//当前不是首页
			out.print("<a href=shopping.jsp?dipage=1&search_text="+gname+">首页</a>,");
			out.print("<a href=shopping.jsp?dipage="+(dipage-1)+"&search_text="+gname+">上一页</a>,");
		}
	    if(dipage==countPage); //当前页是末页
	    else{//当前页不是末页
	    	out.print("<a href=shopping.jsp?dipage="+(dipage+1)+"&search_text="+gname+">下一页</a>,");
	    	out.print("<a href=shopping.jsp?dipage="+countPage+"&search_text="+gname+">末页</a>");
	    }
	    //out.print("</td></tr>");
	}
	
	//------------------------------
	if(result==1){
		//out.print("<tr><td colspan=6 align=center>");
		out.print("共"+countall1+"条记录,共"+countPage1+"页,当前第"+dipage1+"页,每页"+onepage1+"条记录,");
		if(dipage1==1);//当前是首页
		else{//当前不是首页
			out.print("<a href=shopping.jsp?dipage1=1&search_text="+gname+">首页</a>,");
			out.print("<a href=shopping.jsp?dipage1="+(dipage1-1)+"&search_text="+gname+">上一页</a>,");
		}
	    if(dipage1==countPage1); //当前页是末页
	    else{//当前页不是末页
	    	out.print("<a href=shopping.jsp?dipage1="+(dipage1+1)+"&search_text="+gname+">下一页</a>,");
	    	out.print("<a href=shopping.jsp?dipage1="+countPage1+"&search_text="+gname+">末页</a>");
	    }
	    //out.print("</td></tr>");
	}
	stmt.close();//关闭数据库
	con.close();	
%>
</div>
<jsp:include page="foot.jsp" />
</body>
</html>