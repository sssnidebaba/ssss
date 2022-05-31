<%@ page language="java" contentType="text/html; charset=UTF-8"  import="java.sql.*"
        pageEncoding="UTF-8" errorPage="error.jsp"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html xmlns:x="urn:schemas-microsoft-com:office:excel">  
 <script type="text/javascript">  
      function exportExcel(){  
          window.open('testExcel.jsp?exportToExcel=YES');  
      }  
 </script>  
     <head>
     <link rel="stylesheet" type="text/css" href="css/shoppingcart.css">
    <!-- 显示网格线 -->    
    <xml>    
                <x:ExcelWorkbook>    
                    <x:ExcelWorksheets>    
                        <x:ExcelWorksheet>    
                            <!-- <x:Name>工作表标题</x:Name>-->  
                            <x:WorksheetOptions>    
                                <x:Print>    
                                    <x:ValidPrinterInfo />    
                                </x:Print>    
                            </x:WorksheetOptions>    
                        </x:ExcelWorksheet>    
                    </x:ExcelWorksheets>    
                </x:ExcelWorkbook>    
            </xml>    
    <!-- 显示网格线 -->    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <title>导出Excel表</title>  
    </head>  
    <body> 
    <center>
 <%  
    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	java.util.Date currentTime = new java.util.Date();
	String time = formatter.format(currentTime); 
	System.out.println(time);
    String exportToExcel = request.getParameter("exportToExcel");  
      if (exportToExcel != null  && exportToExcel.toString().equalsIgnoreCase("YES")) {  
          response.setContentType("application/vnd.ms-excel");  
           response.setHeader("Content-Disposition", "inline; filename="+"admin_Excel.xls");  
   }  
%>           

<%
request.setCharacterEncoding("utf-8");
String ownid = (String)session.getValue("sessionid");
    Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="select * from goods order by ginfor"; //sql语句，查找自己商品
System.out.println(ownid+sql);                       //输出到控制台判断语句是否正确
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stmt.executeQuery(sql);               //已支付商品结果集
rs.last();
int countall=rs.getRow();                          //得到总条数
rs.beforeFirst();
if(rs.next()&&countall!=0)                         //循环查找所有商品结果集
{    
	out.println("<table class='zong'>");
	out.println("<tr id='biaotou'>");
	out.println("<th class='text-center' width=180px; scope='col'>类别</th>");
	out.println("<th class='text-center' width=180px; scope='col'>商品名</th>");
	out.println("<th class='text-center' width=180px; scope='col'>价格</th>");
	out.println("<th class='text-center' width=180px; scope='col'>月售</th>");
	out.println("</tr>");
	do{
		out.println("<tr id='biaoge'>");
		out.println("<td>"+rs.getString("ginfor")+"</td>");
		out.println("<td>"+rs.getString("gname")+"</td>");
		out.println("<td>"+"<span class='glyphicon-yen'></span>"+rs.getString("gprice")+'元'+"</td>");
		out.println("<td>"+rs.getString("gsold")+"</td>");
		out.println("</tr>");
	}while(rs.next());
	out.println("</table>");
}
else
{
	out.println("<p>还没有订单！！！</p>");
}
stmt.close();
con.close();	
%>
<%  
            if (exportToExcel == null) {  
%>  
  <center><a href="javascript:exportExcel();">导出为Excel</a></center>
<%  
            }  
%>   </center> 
    </body>  
    </html>  