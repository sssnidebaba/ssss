<%@ page contentType="text/html;charset=gb2312" errorPage="error.jsp" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%
String name = (String)session.getValue("sessionid");
SmartUpload mySmartUpload =new SmartUpload();
long file_size_max=4000000;
String fileName2="",ext="",testvar="";
String url="upload/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）
//初始化
mySmartUpload.initialize(pageContext);
//只允许上载此类文件
try {
mySmartUpload.setAllowedFilesList("png,jpg,gif,JPG,PNG,JIF");//此处的文件格式可以根据需要自己修改
//上载文件
mySmartUpload.upload();
} catch (Exception e){
%>
<SCRIPT language=javascript>
alert("只允许上传.png,.jpg,JPG,PNG和.gif类型图片文件");
window.location='upload.html';
</script>
<%
}
try{
com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
if (myFile.isMissing()){%>
<script language=javascript>
alert("请先选择要上传的文件");
window.location='upload.html';
</script>
<%}
else{
//String myFileName=myFile.getFileName(); //取得上载的文件的文件名
ext= myFile.getFileExt(); //取得后缀名
int file_size=myFile.getSize(); //取得文件的大小
String saveurl="";
if(file_size<file_size_max){
//更改文件名，取得当前上传时间的毫秒数值
Calendar calendar = Calendar.getInstance();
String filename = String.valueOf(calendar.getTimeInMillis());
saveurl=application.getRealPath("/")+url;//这里有问题？
saveurl+=filename+"."+ext; //保存路径
myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);
url+=filename+"."+ext;
String ret = "parent.HtmlEdit.focus();";
ret += "var range = parent.HtmlEdit.document.selection.createRange();" ;
ret += "range.pasteHTML('<img src=\"" + request.getContextPath() + "/upload/" + filename + "." + ext + "\">');" ;
ret += "alert('上传成功！');";
ret += "window.location='upload.html';";
out.print("<script language=javascript>" + ret + "</script>");
request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.cj.jdbc.Driver");//连接数据库
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sss","root","123456789Aa");
String sql="update shop_owners set o_profile='"+url+"' where ownid='"+name+"'"; 
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
System.out.println(sql);
stmt.close();//关闭数据库
}
}
}catch (Exception e){
out.print(e.toString());
}
%>
<script language = javascript >alert("上传成功！！！");</script>
<script type="text/javascript">window.top.location="shop_owner.jsp"</script>
