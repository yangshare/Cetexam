<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@  taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>教师页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#teacher{
background-color: #EEF2FB;
position:absolute;
top:0px;
left:150px;
width:1024px;
height:760px;
}
#message{
position:absolute;
top:167px;
left:193px;
width: 810px;
height:400px;
background-image: url("images/background5.jpg");
border: 2px solid #ccccff;
}
#left{
position:absolute;
top:170px;
left:0px;
}
#nowposition{
position:absolute;
top:10px;
left:10px;
}
</style>
  </head>
  <body bgcolor="white">
  <s:div id="teacher">
  <img src="images/background4.jpg"></img>
  <br/>
  <!-- 左边部分 -->
  <s:div id="left">
  <s:include value="tleft.jsp"></s:include>
  </s:div>
 <!-- 右边部分 -->
  	 <s:div id="message">
  	    <s:div id="nowposition">
  	                当前位置：教师须知
  	    </s:div><!--
  	         <br/><br/><br>
  	      &nbsp;&nbsp;&nbsp; <s:iterator value="lists">
 		      <img src="${teacherImage }" width="90px" height="110px"/><br/><br/>
  		              姓名：<s:property value="teacherName"/><br/>
  		             密码：<s:property value="password"/><br/>
  		             学校：<s:property value="teacherOfSchool"/><br/>
               <s:hidden name="id"></s:hidden>
  	         </s:iterator> 	  
  	 --></s:div>
  </s:div>
  </body>
</html>
