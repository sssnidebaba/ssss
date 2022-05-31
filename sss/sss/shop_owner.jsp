<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商家界面</title>
</head>
<td width="5%"  height=400px  valign="top" >
</td>
</table>

<body style="background: radial-gradient(rgb(255, 0, 0),#ff0000);">
<jsp:include page="head.jsp" />
<tr>
  <td width="10%"  height=200px  valign="top">
   <div id="botton" >
  <ul>
  <li ><b><a href="owner_info.jsp" target="user">个人信息</a></b></li>
  <li ><b><a href="owner_update.jsp" target="user">修改信息</a></b></li>
  <li ><b><a href="addgoods.jsp" target="user">发布商品</a></b></li>
  <li ><b><a href="allgoods.jsp" target="user">出售中的商品</a></b></li>
  <li ><b><a href="own_orders.jsp" target="user">订单接收</a></b></li>
  <li ><b><a href="ready.jsp" target="user">待发货</a></b></li>
  <!--<li ><b><a href="sale_history.jsp" target="user">出售历史</a></b></li>
  <li ><b><a href="rev_evaluate.jsp" target="user">收到的评价</a></b></li>-->
   </ul>
  </div>
  </td>
<!--  <div style="height:200px;width:60px;float:right;">你好</div>-->
<table width="96%" border="0" align="center">
 <!-- 竖排导航栏 -->
 
  <td id="content" width="40%"  height=400px  valign="top">
  <!--个人信息表单-->
  <%String str =  request.getParameter("name");%>
  <%if(str != null && str.equals("sale")){ %>
	<iframe name="user" class="userup" src="allgoods.jsp"></iframe>
	<%}else {%>
	<iframe name="user" class="userup" src="owner_info.jsp"></iframe>
	<%} %>
  </td>
  
  
<br><br><br><br><br><br><br><br><br><br><br><br>

    <!-- footer -->
     

</body>
</html>