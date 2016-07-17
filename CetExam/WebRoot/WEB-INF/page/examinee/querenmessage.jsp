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
    
    <title>确认考生信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<STYLE type="text/css">
	#ei{position: absolute; right: 60px; top: 500px;}
	#wei{position: absolute; right: 500px; top: 400px; border:0px;}
	#img{position: absolute; right: 300px; top: -101px;border:0px;}
	</STYLE>
	
  </head>
  
  <body background="images/huis3.jpg">
  ${error }
 <div align="center"><font size="6" color="blue"><b>考生信息</b></font></div> 
  <br/><br/> <br/><br/><br/>
 <font size="5"> 

  <s:form action="/cet4/test_getpartI.action" method="post">
   <s:iterator value="examinee" begin="0" end="4" step="1">
   
  <table style="position:absolute; right: 440px; top:260px;">
  <tr> <td> <b>姓名：</b></td><td><s:property value="name"/></td> </tr>
  <tr></tr>
   <tr></tr>
    <tr> <td> <b>性别：</b></td><td><s:property value="sex"/></td> </tr>
    <tr></tr> <tr></tr>
    <tr> <td> <b>准考证号：</b></td><td><s:property value="candidateNo"/></td> </tr>
    <tr></tr> <tr></tr>
     <tr> <td><b>所在院校：</b></td><td><s:property value="examineeOfSchool"/></td> </tr>
     </table>
    
  
     <div style="position:absolute; left: 400px; top:140px;"><img src="${image }"/></div> 
     
      <s:hidden name="candidateNo" /><!-- 隐藏域传值 -->
      <s:submit  value="开始答题" id="wei" type="image" src="images/dati.jpg"></s:submit> 
      <a href="<%=request.getContextPath() %>/cet4/examinee_getgrades?candidateNo=${candidateNo }" id="ei"><img src="images/chengji.jpg" id="img"/></a>
   </s:iterator>
   </s:form> 
   
   
   </font>
  </body>
</html>
