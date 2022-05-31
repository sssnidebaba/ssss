<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="java.sql.*" errorPage="error.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <body>
        <font size="7"> 华工书店</font><br/>
       </body>
    <base href="<%=basePath%>">
    <title>华工书店</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/demo.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery-3.2.1.js"></script>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	       
  </head>
  
  <body onLoad="load()" style="margin-top: 0px;margin-bottom:0px;background: radial-gradient(rgb(255, 0, 0),#ff0000);">
  <jsp:include page="head.jsp" />
    <!-- 网页整体布局 -->
    <table width="100%" border="0" align="center">
         <!--搜索框  -->
          <tr>
            <td colspan="3" align="center" valign="middle" style="margin-top: 0px;">
            <form style="margin-top: -91px;margin-bottom: 0px; font-size: 36px;margin-left:108px;margin-right:-20px" name="form1" method="post" action="shopping.jsp">
              
              <input placeholder="   输入商品名搜索" onClick="hideSearch()" type="text" name="search_text" id="search_text" style="background:url('img/search.png');background-repeat:no-repeat;background-position: 5px,center;border-bottom-left-radius:10px;border-top-left-radius:10px;">
              <button type="submit" id="search_button" style="border-radius:6px;">搜索</button>
              <img src="img/search.png" style="width:160px;visibility:hidden;">
            </form>
            </td>
          </tr>
          
          
          <tr>
           <td width="20%" > 
           <p>&nbsp;</p>
           </td>
      
           
            
           
            
         
    </table>
    <body>

        <p style="text-align: center;">
    
            <img src="img/sun.jpeg" alt="">
    
        </p>
    
    </body>
   
  </body>
</html>
