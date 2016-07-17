<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员框架页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
    <frameset cols="10%,1024px,10%" frameborder="no" style="overflow: auto;" framespacing="0">
    	<frame src="border.jsp" noresize="noresize"/>
    	<frameset rows="210px,*,100px">
    		<frame src="top.jsp" noresize="noresize" scrolling="NO"/>
    		<frameset cols="175,*" frameborder="no">
			  	<frame src="left.jsp" noresize="noresize" scrolling="yes"/>
			  	<frame src="home.jsp" name="showAdmin"/>
			</frameset>
    		<frame noresize="noresize" src="bottom.jsp"/>
    	</frameset>
    	<frame src="border.jsp" noresize="noresize"/>
    </frameset>
  
  <body>
  
  </body>
</html>
