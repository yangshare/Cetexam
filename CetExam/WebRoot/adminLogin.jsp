<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台登录主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <script type="text/javascript">
  	function check()
  	{
  		if(loginForm.username.value=="")
  		{
  			alert("请输入用户名！");
  			loginForm.username.focus();
  			return false;
  		}
  		if(loginForm.password.value=="")
  		{
  			alert("请输入密码！");
  			loginForm.password.focus();
  			return false;
  		}
  	}
  </script>
  
  <style type="text/css">
  	#form{padding-left: 610px;padding-top: 160px;}
  	#font{color: white;font-size: medium;font-weight: bold;width: 70px;}
  	.btn{width: 70px;height: 30px}
  </style>
  
  <body background="images/admin.jpg" style="background-repeat: no-repeat;background-position: center;">
  	${fail }
    <s:form action="loginAction"  name="loginForm" onsubmit="return check()" id="form">
    	<table height="30%" width="50%"> 
    		<tr>
    			<td id="font">用户名</td>
    			<td><s:textfield name="username"/></td>
	    	</tr>
	    	<tr>
	    		<td id="font">密 码</td>
	    		<td><s:password name="password"/></td>
	    	</tr>
	    	<tr>
	    		<td id="font">类 型</td>
	    		<td><s:select name="type" list="{'管理员','教师'}"/></td>
	    	</tr>
	    	<tr>
	    		<td align="right"><s:submit value="登  录" cssClass="btn"/></td>
	    		<td><s:reset value="重  置" cssClass="btn"/></td>
	    	</tr>
    	</table>
    </s:form>
  </body>
</html>
