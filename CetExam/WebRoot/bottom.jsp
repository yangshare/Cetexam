<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>底部页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="margin: 0" bgcolor="#EEF2FB">
  	<hr align="center"/>
	<table align="center">
		<tr>
			<td>
				<img src="images/bottom.jpg">
			</td>
			<td width="450px" align="center">
				<h2>版权所有，违者必究</h2>
	 		</td>
	 		<td>
	 			<img src="images/bottom1.jpg">
			 </td>
	 	</tr>
	</table>
  </body>
</html>
