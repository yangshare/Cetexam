<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>教师页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">
body {
    background-color: #EEF2FB;
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url("/Cet4System/images/teacherpage/menu_bgs.gif");
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}


</style>
</head>

<body>

<s:iterator value="teachers" >
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
<tr align="center" style="background-image: url('images/background5.jpg');">
 <td>
 	      <img src="/Cet4System/${teacherImage }" width="90px" height="110px"/><br/><br/>
  		              姓名：<s:property value="teacherName"/><br/>
  		             学校：<s:property value="teacherOfSchool"/></td>
</tr>
  <tr>
    <td width="182" valign="top">
    <div id="container">
   <ul style="margin: 0px;padding: 0px;">
  
   <li style="margin-bottom: 7px;">
      <h1 class="type"><a href="<%=request.getContextPath() %>/cet4/updatepwd_currectpassword?id=${id}" target="showteacherright">修改密码</a></h1>
   </li>
   <li style="margin-bottom: 7px;">
    <h1 class="type"><a href="<%=request.getContextPath() %>/cet4/needmark_list?curPage=1" target="showteacherright">批改试卷</a></h1>
   </li>
   <li style="margin-bottom: 7px;">
    <h1 class="type"><a href="<%=request.getContextPath() %>/adminLogin.jsp" target="_top">退出</a></h1>
   </li>
   </ul>
 </div>
        </td>
  </tr>
</table>
</s:iterator>
</body>
</html>





