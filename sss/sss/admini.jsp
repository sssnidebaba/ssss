<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*"
    pageEncoding="utf-8" errorPage="error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户界面</title>
</head>
<body style="background:radial-gradient(rgb(255, 0, 0),#ff0000);">
<jsp:include page="head.jsp" />
<br><br>
<!--  <div style="height:200px;width:60px;float:right;">你好</div>-->
<table width="96%" border="0" align="center">
 <!-- 竖排导航栏 -->
 <tr>
  <td width="10%"  height=500px  valign="top">
   <div id="botton" >
	<ul>
	<li ><b><a href="admin.jsp" target="user">管理商家</a></b></li>
	<li ><b><a href="admin_goods.jsp" target="user">商家销售业绩</a></b></li>
	<li ><b><a href="admin_select.jsp" target="user">商品统计管理</a></b></li>
	<li ><b><a href="admin_Excel.jsp" target="user">商品销售业绩</a></b></li>
   </ul>
  </div>
  </td>
  <td id="content" width="40%"  height=535px  valign="top">
  <!--个人信息表单-->
  <%String str =  request.getParameter("name");%>
  <%if(str != null && str.equals("cart")){ %>
	<iframe id="user" name="user" class="userup" src="shoppingcart.jsp"></iframe>
	<%} else if(str != null && str.equals("hist")){%>
	<iframe id="user" name="user" class="userup" src="history.jsp"></iframe>
	<%} else{%>
	<iframe id="user" name="user" class="userup" src="admin.jsp"></iframe>
	<%} %>
  </td>
  <td width="5%"  height=400px  valign="top" colspan="2">
  </td>
</tr>
</table>

</body>
</html>