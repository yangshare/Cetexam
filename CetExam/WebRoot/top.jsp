<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>顶部页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <style type="text/css">
		#demo{
			margin: 175px 0 0 600px;
		}
		ul#menu{
			list-style-type:none;
			font-weight: bold;
			color: #660000;
		}
	</style>
  
  <body background="images/background2.jpg">
  <%
  		String week = "";
  		Date date = new Date();
  		DateFormat daformat = new SimpleDateFormat("yyyy年MM月dd日");
  		String da = daformat.format(date);
  		switch(date.getDay())
  		{
  			case 0:
  				week="星期日";
  				break;
  			case 1:
  				week="星期一";
  				break;
  			case 2:
  				week="星期二";
  				break;
  			case 3:
  				week="星期三";
  				break;
  			case 4:
  				week="星期四";
  				break;
  			case 5:
  				week="星期五";
  				break;
  			case 6:
  				week="星期六";
  				break;
  			default:
  				break;
  		}
  	 %>
    <div id="demo">
   		<ul id="menu">
   			<li><font size="4"><%=da %>&nbsp;<%=week %>&nbsp;&nbsp;&nbsp;${sessionScope.username }</font></li>
   		</ul>
   	</div> 
  </body>
</html>
