<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'teacherFrame.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<frameset cols="10%,1024px,10%" frameborder="no" style="overflow: auto;" framespacing="0" >
    	<frame src="border.jsp" noresize="noresize"/>
    	<frameset rows="160px,*,100px">
    		<frame src="teachertop.jsp" noresize="noresize" scrolling="NO" />
    		<frameset cols="175,*" frameborder="no" >
			  	<frame src="<%=request.getContextPath() %>/cet4/teacherAction-tleft" noresize="noresize" scrolling="NO"/>
			  	<frame src="teacherneedknow.jsp" name="showteacherright"/>
			</frameset>
    		<frame noresize="noresize" src="bottom.jsp"/>
    	</frameset>
    	<frame src="border.jsp" noresize="noresize"/>
    </frameset>
  <body>

  </body>
</html>
