<%@ page language="java" isErrorPage="true" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>错误页面</title>
</head>
<body>
错误信息为：
<%=exception.getMessage()%><br>
<%=exception.toString()%><br>
<a href="index.jsp">单击返回主页</a>
</body>
</html>